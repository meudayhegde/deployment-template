FROM certbot/certbot:latest

WORKDIR /app

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Default command to run the script
CMD ["/entrypoint.sh"]