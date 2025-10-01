# Release Branch Example Repository

A comprehensive CI/CD setup with three-environment deployment strategy and branch-based preview deployments.

## 🚀 Quick Start

### Branch-Based Deployment Strategy

This repository automatically deploys based on branch naming conventions:

| Branch Pattern | Environment | Purpose |
|----------------|-------------|---------|
| `develop`, `dev/*`, `feat/*` | **develop** | Development integration |
| `staging`, `staging/*`, `preview/*` | **staging** | Pre-production testing |
| `main`, `prod/*`, `release/*` | **production** | Live production |

### Examples

```bash
# Deploy to develop environment
git checkout -b dev/feature-name
git push origin dev/feature-name
# → Automatically deploys to develop

git checkout -b feat/user-auth
git push origin feat/user-auth
# → Automatically deploys to develop

# Deploy to staging environment  
git checkout -b staging/release-candidate
git push origin staging/release-candidate
# → Automatically deploys to staging

git checkout -b preview/design-review
git push origin preview/design-review
# → Automatically deploys to staging

# Deploy to production environment
git checkout -b prod/hotfix
git push origin prod/hotfix
# → Automatically deploys to production

git checkout -b release/v1.2.0
git push origin release/v1.2.0
# → Automatically deploys to production
```

### Manual Deployments

```bash
# Deploy to specific environments
npm run release:develop     # Deploy to develop
npm run release:staging     # Deploy to staging  
npm run release:production  # Deploy to production
```

## 🏗️ Architecture

### Three-Environment Strategy

- **🚧 Develop** - Integration testing and development
- **🧪 Staging** - Pre-production testing with E2E tests
- **🚀 Production** - Live production environment

### Branch Strategy

- **`develop`** → All feature branches merge here
- **`staging`** → Pre-production testing before main
- **`main`** → Production-ready code

## 📋 Development Workflow

### 1. Feature Development
```bash
# Create feature branch
git checkout -b feature/your-feature
# Make changes and create PR to develop
# After merge → Auto-deploys to develop environment
```

### 2. Integration Testing
```bash
# Create PR to develop
# After merge → Auto-deploys to develop environment
```

### 3. Pre-Production Testing
```bash
# Create PR from develop → staging
# After merge → Auto-deploys to staging + runs E2E tests
```

### 4. Production Release
```bash
# Create PR from staging → main
# After merge → Auto-deploys to production
```

## 🛠️ Available Commands

### Development
```bash
npm run dev          # Start development server
npm run build        # Build for production
npm run test         # Run tests
npm run lint         # Run linting
npm run e2e          # Run E2E tests
```

### Deployment
```bash
npm run release:develop     # Deploy to develop
npm run release:staging     # Deploy to staging
npm run release:production  # Deploy to production
```

### Utilities
```bash
npm run clean        # Reset Nx cache
npm run graph        # Show project dependency graph
npm run affected:build  # Build only affected projects
npm run affected:test   # Test only affected projects
```

## 📚 Documentation

- **[Release Process](RELEASE_PROCESS.md)** - Detailed release workflow
- **[Branch Strategy](BRANCH_STRATEGY.md)** - Branch naming conventions
- **[Branch Protection](.github/BRANCH_PROTECTION.md)** - GitHub branch protection rules

## 🔧 Technical Details

### CI/CD Pipeline

The GitHub Actions workflow automatically:

1. **On PR**: Runs build, test, lint, and type checking
2. **On merge to develop**: Deploys to develop environment
3. **On merge to staging**: Deploys to staging + runs E2E tests
4. **On merge to main**: Deploys to production + runs smoke tests
5. **On feature branches**: Deploys to preview environment

### Environment Variables

Set up these secrets in your GitHub repository:

- `NX_CLOUD_ACCESS_TOKEN` - For Nx Cloud integration
- `DEPLOY_TOKEN` - For deployment authentication
- Environment-specific secrets as needed

### Monitoring

Each environment includes:
- Health check endpoints
- Monitoring and alerting
- Log aggregation
- Performance metrics

## 🚀 Getting Started

1. **Clone the repository**
2. **Install dependencies**: `npm install`
3. **Start development**: `npm run dev`
4. **Create a feature branch**: `git checkout -b feature/your-feature`
5. **Push to trigger deployment**: `git push origin feature/your-feature`

## 📖 Nx Workspace

This project is built with [Nx](https://nx.dev) - a powerful build system for monorepos.

### Run tasks

```bash
# Start the dashboard app
npx nx dev dashboard

# Build the dashboard app
npx nx build dashboard

# See all available targets
npx nx show project dashboard
```

### Add new projects

```bash
# Generate a new Next.js app
npx nx g @nx/next:app my-app

# Generate a new React library
npx nx g @nx/react:lib my-lib
```

### Learn more

- [Nx Documentation](https://nx.dev)
- [Nx Console](https://nx.dev/getting-started/editor-setup) - IDE extension
- [Nx Community](https://go.nx.dev/community)