# Release Process

This document outlines the release process for the three-environment setup (develop, staging, main).

## Environment Overview

### 🚧 Develop Environment
- **Branch**: `develop`
- **Purpose**: Integration testing and development
- **Trigger**: Automatic deployment on push to `develop`
- **Testing**: Unit tests, integration tests, linting

### 🧪 Staging Environment
- **Branch**: `staging`
- **Purpose**: Pre-production testing and validation
- **Trigger**: Automatic deployment on push to `staging`
- **Testing**: Full E2E test suite, performance testing

### 🚀 Production Environment
- **Branch**: `main`
- **Purpose**: Live production environment
- **Trigger**: Automatic deployment on push to `main`
- **Testing**: Smoke tests, monitoring

## Release Workflow

### 1. Feature Development
```bash
# Create feature branch from develop
git checkout develop
git pull origin develop
git checkout -b feature/your-feature-name

# Make your changes and commit
git add .
git commit -m "feat: add your feature"
git push origin feature/your-feature-name
```

### 2. Development Integration
```bash
# Create PR to develop
# After approval and merge, develop environment is automatically deployed
```

### 3. Staging Release
```bash
# Create PR from develop to staging
# This triggers staging deployment with E2E tests
```

### 4. Production Release
```bash
# Create PR from staging to main
# This triggers production deployment
```

## CI/CD Pipeline

The GitHub Actions workflow automatically:

1. **On PR**: Runs build, test, lint, and type checking
2. **On merge to develop**: Deploys to develop environment
3. **On merge to staging**: Deploys to staging + runs E2E tests
4. **On merge to main**: Deploys to production + runs smoke tests

## Manual Deployment

You can also trigger deployments manually:

```bash
# Deploy to develop
git push origin develop

# Deploy to staging
git push origin staging

# Deploy to production
git push origin main
```

## Rollback Process

If issues are found in production:

```bash
# Quick rollback - revert the last commit
git revert HEAD
git push origin main

# Or rollback to a specific commit
git reset --hard <commit-hash>
git push --force-with-lease origin main
```

## Environment Variables

Make sure to set up the following secrets in your GitHub repository:

- `NX_CLOUD_ACCESS_TOKEN`: For Nx Cloud integration
- `DEPLOY_TOKEN`: For deployment authentication
- Any other environment-specific secrets

## Monitoring

Each environment should have:
- Health check endpoints
- Monitoring and alerting
- Log aggregation
- Performance metrics
