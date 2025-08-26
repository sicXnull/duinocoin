#!/bin/sh

# Create the data directory
mkdir -p "Duino-Coin PC Miner 4.3"

# Copy translations file to the correct location
cp PCMiner_2.6_resources/langs.json "Duino-Coin PC Miner 4.3/Translations.json"

# Handle mining key - if it's "None", use it as-is, otherwise base64 encode it
if [ "${MINING_KEY}" = "None" ]; then
    MINING_KEY_CONFIG="None"
else
    MINING_KEY_CONFIG=$(echo -n "${MINING_KEY}" | base64)
fi

# Edit the config file
echo "[PC Miner]
username = ${USERNAME}
mining_key = ${MINING_KEY_CONFIG}
intensity = ${INTENSITY}
threads = ${THREADS}
start_diff = ${DIFFICULTY}
donate = 0
identifier = ${RIG}
algorithm = DUCO-S1
language = english
soc_timeout = 45
report_sec = 600
raspi_leds = y
raspi_cpu_iot = y
discord_rp = y" > "Duino-Coin PC Miner 4.3/Settings.cfg"

# Start the miner
python PC_Miner.py
