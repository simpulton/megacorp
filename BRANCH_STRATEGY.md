# Branch Strategy & Naming Conventions

This document outlines the branch naming conventions and deployment triggers for the CI/CD pipeline.

## Branch Naming Conventions

### 🚧 Development Branches
- **`develop`** → Deploys to **develop** environment
- **`feature/*`** → Deploys to **preview** environment
  - Examples: `feature/user-auth`, `feature/dashboard-widget`
  - Creates preview deployments for testing

### 🧪 Testing Branches  
- **`staging`** → Deploys to **staging** environment
- **`preview/*`** → Deploys to **preview** environment
  - Examples: `preview/design-review`, `preview/qa-testing`
  - Creates isolated preview environments

### 🚀 Release Branches
- **`main`** → Deploys to **production** environment
- **`release/*`** → Deploys to **preview** environment
  - Examples: `release/v1.2.0`, `release/hotfix-123`
  - Pre-production testing before main merge

### 🔥 Hotfix Branches
- **`hotfix/*`** → Deploys to **preview** environment
  - Examples: `hotfix/security-patch`, `hotfix/critical-bug`
  - Emergency fixes with preview testing

## Deployment Triggers

| Branch Pattern | Environment | Trigger | Purpose |
|----------------|-------------|---------|---------|
| `develop` | develop | Push | Development integration |
| `staging` | staging | Push | Pre-production testing |
| `main` | production | Push | Live production |
| `feature/*` | preview | Push | Feature testing |
| `preview/*` | preview | Push | Design/QA review |
| `release/*` | preview | Push | Release candidate testing |
| `hotfix/*` | preview | Push | Emergency fix testing |

## Usage Examples

### Feature Development
```bash
# Create feature branch
git checkout -b feature/user-dashboard
# Make changes and push
git push origin feature/user-dashboard
# → Triggers preview deployment
```

### Release Preparation
```bash
# Create release branch
git checkout -b release/v1.2.0
# Push for testing
git push origin release/v1.2.0
# → Triggers preview deployment
```

### Hotfix Process
```bash
# Create hotfix branch
git checkout -b hotfix/security-patch
# Push for testing
git push origin hotfix/security-patch
# → Triggers preview deployment
```

### Preview Testing
```bash
# Create preview branch
git checkout -b preview/design-review
# Push for stakeholder review
git push origin preview/design-review
# → Triggers preview deployment
```

## Environment URLs

- **Develop**: `https://develop.yourdomain.com`
- **Staging**: `https://staging.yourdomain.com`  
- **Production**: `https://yourdomain.com`
- **Preview**: `https://preview-{branch-name}.yourdomain.com`

## Branch Protection

### Required PRs
- `feature/*` → `develop` (via PR)
- `hotfix/*` → `main` (via PR)
- `release/*` → `main` (via PR)
- `preview/*` → `develop` (via PR)

### Direct Pushes
- `develop` → Direct push allowed
- `staging` → Direct push allowed  
- `main` → Direct push allowed (with protection)

## Cleanup

Preview environments are automatically cleaned up when branches are deleted:

```bash
# Delete feature branch
git branch -d feature/user-dashboard
git push origin --delete feature/user-dashboard
# → Preview environment cleaned up
```
