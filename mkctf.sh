#!/bin/bash

# Check if a challenge name is provided
if [ -z "$1" ]; then
  echo "Usage: mkctf <challenge_name>"
  exit 1
fi

CHALLENGE_NAME=$1

# Create the directory structure
mkdir -p $CHALLENGE_NAME/{network,web,creds,notes}

# Copy the Docker Compose file into the challenge directory
cat <<EOL > $CHALLENGE_NAME/docker-compose.yml
version: '3'
services:
  pentest:
    build: .
    container_name: ${CHALLENGE_NAME}_pentest
    privileged: true
    network_mode: "host"
    volumes:
      - ./:/root/$CHALLENGE_NAME
    stdin_open: true
    tty: true
EOL

# Create a Dockerfile in the challenge directory
cat <<EOL > $CHALLENGE_NAME/Dockerfile
FROM kalilinux/kali-rolling

# Update and install tools
RUN apt-get update && apt-get install -y \\
    nmap \\
    gobuster \\
    ffuf \\
    impacket-scripts \\
    python3-impacket \\
    iproute2 \\
    net-tools \\
    inetutils-ping \\
    && apt-get clean

# Set the working directory
WORKDIR /root/$CHALLENGE_NAME

# Command to keep the container running
CMD ["/bin/bash"]
EOL

echo "Challenge environment for '$CHALLENGE_NAME' created successfully."
