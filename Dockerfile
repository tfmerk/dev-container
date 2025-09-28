FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# Core + plugin dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    neovim \
    git \
    curl \
    php-cli \
    unzip \
    python3 \
    python3-pip \
    python3-pynvim \
    nodejs \
    npm \
    ripgrep \
    fd-find \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Make fd available as "fd" (Debian names it fdfind)
RUN ln -s $(which fdfind) /usr/local/bin/fd

# Install Composer (using recommended method, assuming php-cli is installed)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# PHP LSP (Intelephense)
# FIX: Temporarily disable strict OpenSSL security to avoid ERR_SSL_CIPHER_OPERATION_FAILED
RUN NODE_OPTIONS='--tls-min-v1.0' npm install -g intelephense

# Create non-root user
RUN useradd -ms /bin/bash dev

# Copy Neovim configuration
COPY nvim_config/init.lua /home/dev/.config/nvim/
RUN chown -R dev:dev /home/dev/.config/nvim/

USER dev


CMD ["nvim"]
