FROM python:3.9-slim

WORKDIR /
USER root

ENV USERNAME "sic_null"
ENV INTENSITY "50"
ENV THREADS "4"
ENV DIFFICULTY "LOW"
ENV RIG "None"
ENV MINING_KEY "None"

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    dos2unix \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to latest version to avoid warnings
RUN python -m pip install --upgrade pip

# Pre-install all required Python packages
COPY requirements.txt .
RUN pip install -r requirements.txt

# DOWNLOAD AND SETUP MINER
RUN mkdir PCMiner_2.6_resources
COPY PC_Miner.py .
WORKDIR /PCMiner_2.6_resources
COPY langs.json .
WORKDIR /

# Copy start up script
COPY start.sh .
# Fix permissions so the file can be executed
RUN chmod +x start.sh

# Fixes a file format error when the image is built on Windows, uploaded to Docker Hub/GitHub and then ran.
RUN dos2unix start.sh 

# Run start up script
CMD ["./start.sh"]
