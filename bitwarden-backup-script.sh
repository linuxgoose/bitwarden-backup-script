#!/bin/bash

#Variables
today=`date +%Y%m%d-%H%M`
todayhuman=`date +"%d-%m-%Y %H:%M:%S"`
random=`head /dev/urandom | tr -dc a-f0-9 | head -c 12 ; echo ''`
offsite=/volume1/homes/linuxgoose/Backups/BitwardenBackups/NAS
backupdir=/volume1/homes/linuxgoose/Backups/BitwardenBackups/NAS/bwrs_$today

#Setup Folders
echo -e "Checking folder requirements..."
mkdir $backupdir

#Backup Database
echo -e "Backing up the database..."
sqlite3 /volume1/docker/bitwardenrs/bw-data/db.sqlite3 ".backup '$backupdir/db-$(date '+%Y%m%d-%H%M').sqlite3'"

#Copy bw-data folder
echo -e "Backing up the bw-data folder..."
cp -r /volume1/docker/bitwardenrs/bw-data $backupdir/bw-data

#Finish
echo -e "Bitwarden_RS backup complete! :D"
