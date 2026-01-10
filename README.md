```bash
# Set your env variables
cd </path/to/the/project>
cp .env.example .env
nano .env

# Build the container
docker-compose build

# Start the container
docker-compose up -d

# Access the terminal
docker exec -it ubuntu-sandbox /bin/bash
```
