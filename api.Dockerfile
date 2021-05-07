# Official Docker Image
FROM node:13.12.0-alpine

# Make and set Working Directory
RUN mkdir -p /app
WORKDIR /app

# Add node modules to environment path
ENV PATH /app/node_modules/.bin:$PATH

# Copy necessary files into container
COPY ./frontend/package.json /app
COPY ./frontend/package-lock.json /app

# Install app dependencies, '--silent' for quiet install
RUN npm install --silent


# Copy application files
COPY api/. /app/.

# Expose port for host
EXPOSE 3010

# ENTRYPOINT SCRIPT
CMD ["node", "src/index.js"]

