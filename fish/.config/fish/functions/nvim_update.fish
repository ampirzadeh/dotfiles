#!/usr/bin/env fish

# Install/update Neovim nightly build to /opt/nvim
# Usage: sudo ./install-nvim-nightly.fish  (needs sudo for /opt)

set URL https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
set TARBALL /tmp/nvim-linux-x86_64.tar.gz
set EXTRACT_DIR /tmp/nvim-nightly-extract

echo "Downloading Neovim nightly..."
curl -L -o $TARBALL $URL
or begin
    echo "Download failed."
    exit 1
end

echo "Extracting to $EXTRACT_DIR..."
rm -rf $EXTRACT_DIR
mkdir -p $EXTRACT_DIR
tar xzf $TARBALL -C $EXTRACT_DIR --strip-components=1
or begin
    echo "Extraction failed."
    exit 1
end

echo "Installing to /opt/nvim..."
sudo rm -rf /opt/nvim
sudo mkdir -p /opt/nvim
sudo cp -r $EXTRACT_DIR/* /opt/nvim/

echo "Cleaning up..."
rm -rf $TARBALL $EXTRACT_DIR

echo "Done. Neovim nightly installed to /opt/nvim"
echo "Make sure /opt/nvim/bin is in your PATH, e.g. add this to ~/.config/fish/config.fish:"
echo '    fish_add_path /opt/nvim/bin'
/opt/nvim/bin/nvim --version
