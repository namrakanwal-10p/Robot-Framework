FROM ppodgorsek/robot-framework:latest

# Copy the entire project into the /app directory in the container
COPY . /app

# Set the working directory
WORKDIR /app

# Set the entrypoint to use the robot command
ENTRYPOINT ["robot"]
