FROM registry.access.redhat.com/ubi8/ubi:latest

# Install dependencies
RUN dnf update -y && dnf install -y \
    retroarch \
    libretro-nestopia \
    wget && \
    dnf clean all

# Set RetroArch as the default entrypoint
ENTRYPOINT ["retroarch"]

# Set the default command to run Super Mario Bros.
CMD ["-L", "/usr/lib/libretro/nestopia_libretro.so", "/game/super_mario.nes"]

# Create a directory for the game
RUN mkdir /game

# Copy the Super Mario Bros. ROM (User must provide their own legal copy)
COPY super_mario.nes /game/
