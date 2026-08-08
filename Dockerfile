# Use a lightweight Linux system with Java 17 and Node.js
FROM ubuntu:22.04

# Prevent interactive prompts from breaking the installation loop
ENV DEBIAN_FRONTEND=noninteractive

# Update system and download required core networks
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    git \
    openjdk-17-jre-headless \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Set up the active folder
WORKDIR /app

# Copy all the files from your GitHub into the container
COPY . .

# Expose port 8080 for your panel Web UI
EXPOSE 8080

# Expose port 25565 for your Minecraft players to join
EXPOSE 25565

# Directly trigger the original web installation script silently
CMD ["bash", "install.sh"]
