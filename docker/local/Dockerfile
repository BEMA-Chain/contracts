# Use an official Node.js runtime as a parent image
FROM node:18.16.0


# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application to the container
COPY . .

# Copy the hardhat.config.js file to the container
COPY hardhat.config.js ./

# Set up the environment variables
ARG NETWORK=polygon
ARG INFURA_PROJECT_ID
ENV POLYGON_NETWORK=$NETWORK
ENV INFURA_PROJECT_ID=$INFURA_PROJECT_ID

# Build the application
RUN npx hardhat compile

# Expose the port that the application will be running on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]

