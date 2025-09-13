#!/bin/bash

DATE=$(date +%Y%m%d)
BACKUP_ROOT="/mnt/HHD/Arch_backup/$DATE"

echo "📦 Starting backup for $DATE..."
echo "📁 Creating backup directory structure..."
mkdir -p $BACKUP_ROOT/{docs,packages}

echo "📂 Copying ~/Documents/..."
cp -r ~/Documents/ $BACKUP_ROOT/docs/

echo "📄 Saving global npm packages list..."
npm list -g --depth=0 >$BACKUP_ROOT/packages/npm-packages.txt

echo "📄 Saving paru (AUR) package list..."
paru -Qqe >$BACKUP_ROOT/packages/paru-packages.txt

# Official repos
pacman -Qqen >$BACKUP_ROOT/packages/pacman-explicit.txt

# List explicitly installed (not deps)
pacman -Qqe >$BACKUP_ROOT/packages/pacman-explicit.txt

echo "📦 Creating compressed /etc backup..."
if sudo tar -czpf "$BACKUP_ROOT/packages/etc-backup.tar.gz" \
    -C / \
    --exclude='etc/mtab' \
    --exclude='etc/.pwd.lock' \
    --exclude='etc/machine-id' \
    --exclude='etc/ssh/ssh_host_*' \
    --exclude='etc/udev/hwdb.bin' \
    --warning=no-file-ignored \
    etc/; then
    echo "✅ /etc backup created successfully."
else
    echo "❌ FAILED to create /etc backup!" >&2
    exit 1
fi

SNAPSHOT_ROOT="/"

# Root snapshot
SNAP_ROOT="$SNAPSHOT_ROOT/@arch-pre-migration-$DATE"
if sudo btrfs subvolume show "$SNAP_ROOT" &>/dev/null 2>&1; then
    echo "🗑️  Deleting existing root snapshot: $SNAP_ROOT"
    sudo btrfs subvolume delete "$SNAP_ROOT"
fi
echo "📸 Creating BTRFS snapshot of root..."
if sudo btrfs subvolume snapshot / "$SNAP_ROOT"; then
    echo "✅ Root snapshot created: $SNAP_ROOT"
else
    echo "❌ Failed to create root snapshot!" >&2
    exit 1
fi

# Home snapshot — created at FS root, NOT under /home/
SNAP_HOME="$SNAPSHOT_ROOT/@home-pre-omarchy-$DATE"
if sudo btrfs subvolume show "$SNAP_HOME" &>/dev/null 2>&1; then
    echo "🗑️  Deleting existing home snapshot: $SNAP_HOME"
    sudo btrfs subvolume delete "$SNAP_HOME"
fi
echo "📸 Creating BTRFS snapshot of /home..."
if sudo btrfs subvolume snapshot /home "$SNAP_HOME"; then
    echo "✅ Home snapshot created: $SNAP_HOME"
else
    echo "❌ Failed to create home snapshot!" >&2
    exit 1
fi

echo "✅ Backup completed successfully! Location: $BACKUP_ROOT"
