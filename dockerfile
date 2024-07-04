# Use an official Ubuntu as a base image
FROM ubuntu:20.04

# Install curl, gnupg, and other dependencies
RUN apt-get update && \
    apt-get install -y curl gnupg zip python3 python3-pip && \
    pip3 install gallery-dl

# Set the working directory in the container
WORKDIR /home/container

# Copy the rest of the application code to the working directory
COPY . .

# Define mountable directories and files
VOLUME ["/home/container/"]

# Ensure gallery-dl is in the PATH
ENV PATH="/usr/local/bin:${PATH}"

# Add aliases
RUN echo "alias download_galleries='gallery-dl -I if.txt --config /home/container/config/gallery-dl.conf --write-info-json'" >> ~/.bashrc
RUN echo "alias create_cbz='bash /home/container/create_cbz.sh /home/container/gallery-dl'" >> ~/.bashrc

CMD ["tail", "-f", "/dev/null"]
