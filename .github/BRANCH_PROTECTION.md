# Branch Protection Rules

This document outlines the recommended branch protection rules for this repository.

## Branch Strategy

- **develop**: Development branch - where all feature branches are merged
- **staging**: Pre-production testing branch - where features are tested before production
- **main**: Production branch - stable, production-ready code

## Recommended Branch Protection Rules

### For `main` branch:
- ✅ Require a pull request before merging
- ✅ Require approvals (2 reviewers recommended)
- ✅ Dismiss stale PR approvals when new commits are pushed
- ✅ Require status checks to pass before merging
- ✅ Require branches to be up to date before merging
- ✅ Restrict pushes that create files larger than 100MB
- ✅ Include administrators in restrictions

### For `staging` branch:
- ✅ Require a pull request before merging
- ✅ Require approvals (1 reviewer recommended)
- ✅ Require status checks to pass before merging
- ✅ Require branches to be up to date before merging

### For `develop` branch:
- ✅ Require a pull request before merging
- ✅ Require status checks to pass before merging

## Workflow

1. **Feature Development**: Create feature branches from `develop`
2. **Code Review**: Create PR to `develop` for review
3. **Integration Testing**: Merge to `develop` triggers develop deployment
4. **Staging Release**: Create PR from `develop` to `staging`
5. **Pre-production Testing**: Staging deployment with E2E tests
6. **Production Release**: Create PR from `staging` to `main`
7. **Production Deployment**: Main branch triggers production deployment

## Setting Up Branch Protection

1. Go to your repository on GitHub
2. Navigate to Settings → Branches
3. Add rules for each branch (`main`, `staging`, `develop`)
4. Configure the protection rules as outlined above
