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
RUN npm install react-scripts@3.4.1 -g --silent

# Copy application files
COPY frontend/. /app/.

# Expose port for host
EXPOSE 3000

# ENTRYPOINT SCRIPT
CMD ["npm","start"]