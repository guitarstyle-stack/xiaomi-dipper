FROM ubuntu:20.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies from .github-ci.yml
RUN apt update && apt install -y \
    android-tools-mkbootimg \
    bc \
    build-essential \
    ca-certificates \
    cpio \
    curl \
    git \
    kmod \
    libssl-dev \
    libtinfo5 \
    python2 \
    sudo \
    unzip \
    wget \
    xz-utils \
    img2simg \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Fix python link
RUN ln -sf /usr/bin/python2 /usr/bin/python

# Set working directory
WORKDIR /build

# Copy the build script and other necessary files
# We will mount the directory instead to keep the artifacts
# But let's set a default command
CMD ["bash", "build.sh"]
