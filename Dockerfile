# Use the official Node.js image as the base image
FROM node:14

# Set the working directory
WORKDIR /app

# Install Java (OpenJDK)
RUN apt-get update && apt-get install -y openjdk-11-jdk

# Install Appium
RUN npm install -g appium

# Expose the Appium port
EXPOSE 4723

# Default command to run Appium server
CMD ["appium"]
