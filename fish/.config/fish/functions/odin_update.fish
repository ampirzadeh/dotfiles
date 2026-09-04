#!/usr/bin/env fish

# Install/update latest Odin release to /opt/odin
# Usage: sudo ./install-odin-latest.fish  (needs sudo for /opt)

set API_URL https://api.github.com/repos/odin-lang/Odin/releases/latest
set INSTALL_DIR /opt/odin

echo "Looking up latest Odin release tag..."
set TAG (curl -s $API_URL | grep -m1 '"tag_name":' | sed -E 's/.*"tag_name": *"([^"]+)".*/\1/')

if test -z "$TAG"
    echo "Could not determine latest release tag."
    exit 1
end

echo "Latest release: $TAG"

set FILENAME odin-linux-amd64-$TAG.tar.gz
set URL https://github.com/odin-lang/Odin/releases/download/$TAG/$FILENAME
set TARBALL /tmp/$FILENAME
set EXTRACT_DIR /tmp/odin-extract

echo "Downloading $URL..."
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

echo "Installing to $INSTALL_DIR..."
sudo rm -rf $INSTALL_DIR
sudo mkdir -p $INSTALL_DIR
sudo cp -r $EXTRACT_DIR/* $INSTALL_DIR/

echo "Cleaning up..."
rm -rf $TARBALL $EXTRACT_DIR

echo "Done. Odin $TAG installed to $INSTALL_DIR"
echo "Make sure $INSTALL_DIR is in your PATH, e.g. add this to ~/.config/fish/config.fish:"
echo "    fish_add_path $INSTALL_DIR"

$INSTALL_DIR/odin version
