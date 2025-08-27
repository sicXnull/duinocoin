# Duino-Coin Docker Miner

A simple Docker image containing the official Duino-Coin PC Miner! 🪙

[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://www.docker.com/)
[![Duino-Coin](https://img.shields.io/badge/Duino--Coin-Official-green.svg)](https://duinocoin.com/)
[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-sicnull%2Fduinocoin-blue.svg)](https://hub.docker.com/r/sicnull/duinocoin)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

This Docker image allows you to easily deploy a Duino-Coin miner with minimal configuration. Perfect for running on servers, Raspberry Pi, or any Docker-compatible system.

## 🚀 Quick Start

### Basic Usage
```bash
docker run -e USERNAME="your_username" sicnull/duinocoin
```

### With Custom Configuration
```bash
docker run \
  -e USERNAME="your_username" \
  -e MINING_KEY="your_mining_key" \
  -e INTENSITY="50" \
  -e THREADS="4" \
  -e DIFFICULTY="MEDIUM" \
  -e RIG="MyDockerRig" \
  --restart=always \
  sicnull/duinocoin
```

## ⚙️ Configuration

### Environment Variables

| Variable | Default | Range | Description |
|----------|---------|-------|-------------|
| `USERNAME` | `"sic_null"` | - | Your Duino-Coin username |
| `MINING_KEY` | `"None"` | - | Your mining key |
| `INTENSITY` | `"50"` | 1-100 | Mining intensity percentage |
| `THREADS` | `"4"` | 1-16 | Number of CPU threads to use |
| `DIFFICULTY` | `"LOW"` | LOW/MEDIUM/NET | Mining difficulty level |
| `RIG` | `"None"` | - | Rig identifier name |

### Difficulty Levels

- **`LOW`**: Easiest difficulty, good for low-powered devices
- **`MEDIUM`**: Balanced difficulty, recommended for most users
- **`NET`**: Network difficulty, best for high-powered systems

## 📋 Examples

### Example 1: Minimal Configuration
```bash
docker run -e USERNAME="your_username" sicnull/duinocoin
```
Starts mining with default settings (50% intensity, 4 threads, LOW difficulty).

### Example 2: With Auto-Restart
```bash
docker run \
  -e USERNAME="your_username" \
  --restart=always \
  sicnull/duinocoin
```
Container will automatically restart if it crashes.

### Example 3: High-Performance Configuration
```bash
docker run \
  -e USERNAME="your_username" \
  -e INTENSITY="95" \
  -e THREADS="8" \
  -e DIFFICULTY="NET" \
  -e RIG="HighPerfRig" \
  --restart=always \
  sicnull/duinocoin
```
Optimized for high-performance mining.

### Example 4: Using Environment File
```bash
# Create env_vars file
cat > env_vars << EOF
USERNAME=your_username
MINING_KEY=your_mining_key
INTENSITY=75
THREADS=6
DIFFICULTY=MEDIUM
RIG=DockerRig
EOF

# Run with env file
docker run --env-file env_vars --restart=always sicnull/duinocoin
```

### Example 5: Raspberry Pi Optimized
```bash
docker run \
  -e USERNAME="your_username" \
  -e INTENSITY="30" \
  -e THREADS="2" \
  -e DIFFICULTY="LOW" \
  -e RIG="RaspberryPi" \
  --restart=always \
  sicnull/duinocoin
```
Optimized settings for Raspberry Pi devices.

## 🔧 Advanced Usage

### Docker Compose
Create a `docker-compose.yml` file:

```yaml
version: '3.8'
services:
  duinocoin-miner:
    image: sicnull/duinocoin
    environment:
      - USERNAME=your_username
      - MINING_KEY=your_mining_key
      - INTENSITY=75
      - THREADS=4
      - DIFFICULTY=MEDIUM
      - RIG=DockerComposeRig
    restart: unless-stopped
    deploy:
      resources:
        limits:
          cpus: '4.0'
          memory: 2G
```

Run with:
```bash
docker-compose up -d
```

### Resource Limits
```bash
docker run \
  -e USERNAME="your_username" \
  --cpus=4.0 \
  --memory=2g \
  --restart=always \
  sicnull/duinocoin
```

## 🐛 Troubleshooting

### Common Issues

**1. Mining Key Error**
```
Error checking mining key: Incorrect padding
```
- Ensure your mining key is correct
- If you don't have a mining key, leave `MINING_KEY="None"`

**2. Container Exits Immediately**
```bash
# Check logs
docker logs <container_name>

# Run in foreground to see output
docker run -it -e USERNAME="your_username" sicnull/duinocoin
```

**3. Low Hashrate**
- Increase `THREADS` (up to 16)
- Increase `INTENSITY` (up to 100)
- Try higher `DIFFICULTY` level

### Logs and Monitoring
```bash
# View logs
docker logs <container_name>

# Follow logs in real-time
docker logs -f <container_name>

# Check container stats
docker stats <container_name>
```

## 📦 Building from Source

### Prerequisites
- Docker
- Git

### Build Steps
```bash
# Clone repository
git clone <repository-url>
cd duinocoin-docker

# Build image
docker build -t duinocoin-miner .

# Run with your configuration
docker run -e USERNAME="your_username" duinocoin-miner
```

## 🚀 Ready-to-Use Image

If you don't want to build the image yourself, you can use the pre-built image from Docker Hub:

```bash
# Pull the latest image
docker pull sicnull/duinocoin

# Run with your configuration
docker run -e USERNAME="your_username" sicnull/duinocoin
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [Duino-Coin Official Website](https://duinocoin.com/)
- [Duino-Coin GitHub](https://github.com/revoxhere/duino-coin)
- [Docker Documentation](https://docs.docker.com/)

## ⚠️ Disclaimer

This Docker image is for educational and personal use. Please ensure you comply with your local regulations and Duino-Coin's terms of service when mining.



