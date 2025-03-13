FROM ubuntu:latest

# Install dependencies
RUN apt update && apt install -y \
    retroarch \
    libretro-nestopia \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Set RetroArch as the default entrypoint
ENTRYPOINT ["retroarch"]

# Set the default command to run Super Mario Bros.
CMD ["-L", "/usr/lib/libretro/nestopia_libretro.so", "/game/super_mario.nes"]

# Create a directory for the game
RUN mkdir /game

# Copy the Super Mario Bros. ROM (User must provide their own legal copy)
COPY super_mario.nes /game/
