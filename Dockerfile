# Use an official Ubuntu base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y cowsay fortune netcat && \
    rm -rf /var/lib/apt/lists/*

# Copy the Bash script into the container
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the port the app runs on
EXPOSE 4499

# Run the script
CMD ["/usr/local/bin/wisecow.sh"]


