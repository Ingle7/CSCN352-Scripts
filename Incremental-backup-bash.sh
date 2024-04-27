#!/bin/bash

# Define the source and destination directories
source_dir="/var/www/html"
backup_dir="/home/ubuntuadmin/backups"

# Create a timestamp for the backup directory
timestamp=$(date +"%Y%m%d%H%M%S")
new_backup_dir="$backup_dir/$timestamp"

# Create the new backup directory
mkdir -p "$new_backup_dir"

# Perform the incremental backup
tar --create --listed-incremental="$backup_dir/latest.snapshot" --file="$new_backup_dir/backup.tar" "$source_dir"

# Update the latest symlink
ln -sfn "$new_backup_dir" "$backup_dir/latest"

