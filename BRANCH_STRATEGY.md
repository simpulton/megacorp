# Branch Strategy

This document outlines the three-environment deployment strategy for the CI/CD pipeline.

## Three-Environment Strategy

### 🚧 Development Environment
- **`develop`** → Deploys to **develop** environment
- Integration testing and development
- All feature branches merge here

### 🧪 Staging Environment  
- **`staging`** → Deploys to **staging** environment
- Pre-production testing
- E2E tests run here before production

### 🚀 Production Environment
- **`main`** → Deploys to **production** environment
- Live production environment
- Only stable, tested code reaches here

## Deployment Triggers

| Branch Pattern | Environment | Trigger | Purpose |
|----------------|-------------|---------|---------|
| `develop`, `dev/*`, `feat/*` | develop | Push | Development integration |
| `staging`, `staging/*`, `preview/*` | staging | Push | Pre-production testing |
| `main`, `prod/*`, `release/*` | production | Push | Live production |

## Usage Examples

### Deploy to Development
```bash
# Create dev branch
git checkout -b dev/user-dashboard
git push origin dev/user-dashboard
# → Automatically deploys to develop environment

# Create feature branch
git checkout -b feat/user-auth
git push origin feat/user-auth
# → Automatically deploys to develop environment
```

### Deploy to Staging
```bash
# Create staging branch
git checkout -b staging/release-candidate
git push origin staging/release-candidate
# → Automatically deploys to staging environment

# Create preview branch
git checkout -b preview/design-review
git push origin preview/design-review
# → Automatically deploys to staging environment
```

### Deploy to Production
```bash
# Create prod branch
git checkout -b prod/hotfix
git push origin prod/hotfix
# → Automatically deploys to production environment

# Create release branch
git checkout -b release/v1.2.0
git push origin release/v1.2.0
# → Automatically deploys to production environment
```

## Environment URLs

- **Develop**: `https://develop.yourdomain.com`
- **Staging**: `https://staging.yourdomain.com`  
- **Production**: `https://yourdomain.com`

## Branch Protection

### Required PRs
- `feature/*` → `develop` (via PR)
- `develop` → `staging` (via PR)
- `staging` → `main` (via PR)

### Direct Pushes
- `develop` → Direct push allowed
- `staging` → Direct push allowed  
- `main` → Direct push allowed (with protection)
