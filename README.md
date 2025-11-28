# nova-proxy

![Version](https://img.shields.io/badge/version-0.8.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Node.js](https://img.shields.io/badge/node-%3E%3D22-green)
![npm](https://img.shields.io/badge/npm-%3E%3D10-green)
[![Code Quality](https://github.com/nova-eco/nova-proxy/actions/workflows/code-quality.yml/badge.svg)](https://github.com/nova-eco/nova-proxy/actions/workflows/code-quality.yml)

A reverse proxy service for the Nova ecosystem, built with Nginx and Docker. This service routes requests to various Nova services (web and API) through a unified entry point.

**Repository:** [gitlab.com/nova-eco/nova-proxy](https://gitlab.com/nova-eco/nova-proxy)

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
  - [Development](#development)
  - [Docker](#docker)
  - [npm Scripts](#npm-scripts)
- [Project Structure](#project-structure)
- [Development](#development-1)
  - [Code Quality](#code-quality)
  - [Git Hooks](#git-hooks)
- [License](#license)

---

## Overview

nova-proxy is a lightweight reverse proxy service that acts as a gateway for the Nova ecosystem. It handles incoming requests and routes them to the appropriate backend services:

- **Web Service** (`/web` → nova-web:3002)
- **API Service** (`/api` → nova-api:3001)

The service is containerized using Docker and can be easily deployed and scaled.

---

## Features

- ✅ Reverse proxy routing with Nginx
- ✅ Docker & Docker Compose support
- ✅ Health checks for container monitoring
- ✅ Environment variable configuration
- ✅ Code quality checks (formatting, spell-checking)
- ✅ Automated changelog management
- ✅ Husky git hooks for pre-push validation
- ✅ Commit message linting

---

## Prerequisites

- **Docker** (for containerized deployment)
- **Docker Compose** (v2+)
- **Node.js** (v22 or higher)
- **npm** (v10 or higher)

---

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://gitlab.com/nova-eco/nova-proxy.git
   cd nova-proxy
   ```

2. **Install dependencies:**

   ```bash
   npm install
   ```

   The postinstall hook will automatically copy `.env.TEMPLATE` to `.env` if `.env` doesn't already exist.

3. **Configure environment variables:**

   Edit `.env` with your desired configuration:

   ```bash
   cp .env.TEMPLATE .env
   ```

---

## Configuration

Configure the service using environment variables in `.env`:

| Variable | Description | Default |
|----------|-------------|---------|
| `NOVA_PROXY_AUTHOR` | Author/maintainer information | `admin<admin@nova.eco>` |
| `NOVA_PROXY_HOST` | Proxy host address | `localhost` |
| `NOVA_PROXY_NAME` | Container name | `nova-proxy` |
| `NOVA_PROXY_NETWORK` | Docker network name | `nova-network` |
| `NOVA_PROXY_PORT` | Port to expose | `3000` |

Example `.env`:

```dotenv
NOVA_PROXY_AUTHOR="admin<admin@nova.eco>"
NOVA_PROXY_HOST="localhost"
NOVA_PROXY_NAME="nova-proxy"
NOVA_PROXY_NETWORK="nova-network"
NOVA_PROXY_PORT="3000"
```

---

## Usage

### Development

**Start the proxy service with Docker:**

```bash
npm start
```

This command:
1. Runs code quality checks (formatting and spell-checking)
2. Lints Docker files
3. Builds and starts the Docker container

**Stop the service:**

```bash
npm stop
```

### Docker

**Manual Docker operations:**

```bash
# Build and start the container
npm run docker:start

# Stop and remove all containers
npm run docker:stop

# Check if Docker is installed
npm run docker:has
```

### npm Scripts

| Command | Description |
|---------|-------------|
| `npm start` | Start the proxy service with checks and linting |
| `npm stop` | Stop and clean up Docker containers |
| `npm run docker` | Start Docker Compose |
| `npm run docker:start` | Build and start containers with Docker Compose |
| `npm run docker:stop` | Stop and remove containers and images |
| `npm run check` | Run formatting and spell-check |
| `npm run format` | Check code formatting |
| `npm run format:fix` | Auto-fix code formatting |
| `npm run lint` | Run all linting checks |
| `npm run lint:docker` | Lint Docker files and compose config |
| `npm run lint:docker:dockerfile` | Lint Dockerfile |
| `npm run lint:docker:compose` | Validate Docker Compose configuration |
| `npm run spell` | Run spell-checker |
| `npm run changelog` | Generate changelog from commits |
| `npm run changelog:commit` | Commit the generated changelog |
| `npm run env:cp` | Copy `.env.TEMPLATE` to `.env` |

---

## Project Structure

```
nova-proxy/
├── .auto-changelog              # Auto changelog configuration
├── .env                         # Environment variables (git-ignored)
├── .env.TEMPLATE                # Environment variables template
├── .github/                      # GitHub workflows
├── .gitignore                   # Git ignore rules
├── .husky/                      # Husky git hooks
├── .prettierignore              # Prettier ignore rules
├── .prettierrc.json             # Prettier configuration
├── commitlint.config.mjs        # Commit lint configuration
├── compose.override.yaml        # Docker Compose override (local dev)
├── compose.yaml                 # Docker Compose configuration
├── cspell.json                  # Spell-checker configuration
├── Dockerfile                   # Docker image definition
├── LICENSE.txt                  # MIT License
├── nginx.conf                   # Nginx proxy configuration
├── package.json                 # npm package definition
├── package-lock.json            # npm dependency lock file
├── README.md                    # This file
└── scripts/
    └── docker-build-check.sh    # Docker build validation script
```

---

## Development

### Code Quality

The project enforces code quality standards through:

- **Prettier** - Code formatting
- **cspell** - Spell-checking
- **Docker Linting** - Dockerfile and Compose configuration validation
- **commitlint** - Commit message validation

**Run all quality checks:**

```bash
npm run check
```

**Auto-fix formatting issues:**

```bash
npm run format:fix
```

### Git Hooks

Husky manages git hooks for this project:

- **pre-push** - Runs formatting, spell-check, and linting before pushing
- **commit-msg** - Validates commit messages against Conventional Commits

These hooks are automatically installed during `npm install`.

---

## License

This project is licensed under the **MIT License** - see [LICENSE.txt](LICENSE.txt) for details.

---

## Author

**admin** &lt;admin@nova.eco&gt;

---

## Support

For issues, questions, or contributions, please visit the [project repository](https://gitlab.com/nova-eco/nova-proxy).
