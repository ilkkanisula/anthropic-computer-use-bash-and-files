# Use an official Python image as the base image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Install essential system tools and UV package manager
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    coreutils \
    curl \
    wget \
    vim \
    git \
    unzip \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install UV package manager
RUN pip install uv

# Copy the lock file and project files into the container
COPY uv.lock ./
COPY . .

# Install dependencies with UV
RUN uv sync
