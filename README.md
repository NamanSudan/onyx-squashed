# Onyx Docker Images (Squashed)

This repository contains squashed Docker images for the Onyx application along with necessary configuration files. These images have been exported from a working Onyx deployment and squashed into single-layer images for improved portability and efficiency.

## Repository Contents

The repository includes everything needed to run Onyx:

- **Docker Image Files**:
  - `onyx-backend-squashed.tar.gz` - The Onyx backend service (616MB)
  - `onyx-model-server-squashed.tar.gz` - The ML model server for Onyx (1.4GB)
  - `onyx-web-server-squashed.tar.gz` - The web server for Onyx (91MB)
  - `vespa-squashed.tar.gz` - The Vespa search engine (524MB)
  - `postgres-squashed.tar.gz` - PostgreSQL database (84MB)
  - `redis-squashed.tar.gz` - Redis cache (16MB)
  - `nginx-squashed.tar.gz` - Nginx web server (15MB)
- **Configuration**:
  - `.env` - Environment configuration for Onyx
- **Scripts**:
  - `import-images.sh` - Script to import all Docker images

## Instructions for Your Manager

To use this repository:

1. Clone this repository:
   ```bash
   git clone https://github.com/NamanSudan/onyx-squashed.git
   cd onyx-squashed
   ```

2. Import all Docker images using the provided script:
   ```bash
   chmod +x import-images.sh
   ./import-images.sh
   ```

3. Clone the Onyx repository:
   ```bash
   git clone https://github.com/onyx-dot-app/onyx.git
   ```

4. Copy the `.env` file to the Onyx root directory:
   ```bash
   cp .env onyx/
   ```

5. Navigate to the Docker Compose directory:
   ```bash
   cd onyx/deployment/docker_compose
   ```

6. Start Onyx using Docker Compose:
   ```bash
   docker compose -f docker-compose.dev.yml -p onyx-stack up -d
   ```

7. Onyx will be accessible at http://localhost:3003

## Alternative: Manual Import

If you prefer to import the images manually:

```bash
# Import and tag the backend image
cat onyx-backend-squashed.tar.gz | docker import - onyxdotapp/onyx-backend:latest

# Import and tag the model server image
cat onyx-model-server-squashed.tar.gz | docker import - onyxdotapp/onyx-model-server:latest

# Import and tag the web server image
cat onyx-web-server-squashed.tar.gz | docker import - onyxdotapp/onyx-web-server:latest

# Import and tag the other images
cat vespa-squashed.tar.gz | docker import - vespaengine/vespa:8.277.17
cat postgres-squashed.tar.gz | docker import - postgres:15.2-alpine
cat redis-squashed.tar.gz | docker import - redis:7.4-alpine
cat nginx-squashed.tar.gz | docker import - nginx:1.23.4-alpine
```

## Important Note

These images have been squashed (all layers combined into one), making them more portable and potentially smaller, but they may lack some metadata compared to the original images. The included import script correctly tags them to match the original image names required by Docker Compose. 