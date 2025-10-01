#!/bin/bash

# Release script for three-environment setup with branch support
# Usage: ./scripts/release.sh [develop|staging|production|preview]

set -e

ENVIRONMENT=$1
BRANCH_NAME=$(git branch --show-current)

if [ -z "$ENVIRONMENT" ]; then
    echo "Usage: ./scripts/release.sh [develop|staging|production|preview]"
    echo ""
    echo "Environments:"
    echo "  develop    - Deploy to development environment"
    echo "  staging    - Deploy to staging environment"
    echo "  production - Deploy to production environment"
    echo "  preview    - Deploy to preview environment (for feature branches)"
    echo ""
    echo "Branch-based deployments:"
    echo "  feature/*  - Auto-deploys to preview"
    echo "  hotfix/*   - Auto-deploys to preview"
    echo "  release/*  - Auto-deploys to preview"
    echo "  preview/*  - Auto-deploys to preview"
    exit 1
fi

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)
echo "Current branch: $CURRENT_BRANCH"

case $ENVIRONMENT in
    "develop")
        echo "🚀 Deploying to DEVELOP environment..."
        if [ "$CURRENT_BRANCH" != "develop" ]; then
            echo "Switching to develop branch..."
            git checkout develop
            git pull origin develop
        fi
        echo "✅ Develop deployment triggered"
        ;;
    "staging")
        echo "🚀 Deploying to STAGING environment..."
        if [ "$CURRENT_BRANCH" != "staging" ]; then
            echo "Switching to staging branch..."
            git checkout staging
            git pull origin staging
        fi
        echo "✅ Staging deployment triggered"
        ;;
    "production")
        echo "🚀 Deploying to PRODUCTION environment..."
        if [ "$CURRENT_BRANCH" != "main" ]; then
            echo "Switching to main branch..."
            git checkout main
            git pull origin main
        fi
        echo "✅ Production deployment triggered"
        ;;
    "preview")
        echo "🚀 Deploying to PREVIEW environment..."
        echo "Branch: $BRANCH_NAME"
        if [[ $BRANCH_NAME == feature/* ]] || [[ $BRANCH_NAME == hotfix/* ]] || [[ $BRANCH_NAME == release/* ]] || [[ $BRANCH_NAME == preview/* ]]; then
            echo "✅ Preview deployment triggered for branch: $BRANCH_NAME"
        else
            echo "⚠️  Warning: Branch '$BRANCH_NAME' doesn't follow preview naming convention"
            echo "Preview branches should be: feature/*, hotfix/*, release/*, or preview/*"
        fi
        ;;
    *)
        echo "❌ Invalid environment: $ENVIRONMENT"
        echo "Valid environments: develop, staging, production, preview"
        exit 1
        ;;
esac

echo ""
echo "🔍 Check the GitHub Actions tab to monitor deployment progress"
echo "📊 View deployment status: https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\([^.]*\).*/\1/')/actions"
