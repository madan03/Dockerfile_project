FROM nginx:alpine

WORKDIR /opt/html

# Copy static files to be served by nginx
COPY index.html /opt/html
COPY default.conf /etc/nginx/conf.d/

# Set user to non-root and create a group with necessary permissions
RUN addgroup -g 1001 -S madan \
    && adduser -u 1001 -S madan -G madan \
    && mkdir -p /var/run/nginx /var/tmp/nginx \
    && chown -R madan:madan  /var/run/nginx /var/tmp/nginx

COPY nginx.conf /etc/nginx/nginx.conf


# Install curl for testing purposes
RUN apk add --no-cache curl

# Set the user and group ownership of the html directory
RUN chown -R madan:madan /opt/html

# Expose configurable port
EXPOSE 80

# Switch to non-root user
USER madan

# Start nginx as a foreground process
CMD ["nginx", "-g", "daemon off;"]
