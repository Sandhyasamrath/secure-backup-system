# Secure Automated File Backup and Recovery System using Linux Shell Scripting

## Project Overview

This project is a Linux-based secure automated backup and recovery system developed using Bash Shell Scripting. It helps users automatically create compressed backups of important files and folders, protect them using password-based encryption, restore files when needed, and schedule backups using Cron Jobs.

The system is designed to improve data security, reduce the risk of accidental data loss, and automate regular backup tasks without manual effort.

This project demonstrates practical Linux administration, shell scripting, automation, file handling, and secure backup management.

---

## Features

* Automatic file and folder backup
* Compressed backup using `.tar.gz`
* Password-protected encrypted backup using GPG
* Restore files from encrypted backup
* Automatic deletion of old backups
* Backup activity logging
* Scheduled daily backup using Cron Jobs
* Secure file recovery system

---

## Technologies Used

* Linux (Ubuntu)
* Bash Shell Scripting
* Cron Jobs
* GPG Encryption
* Tar and Gzip
* Linux File Permissions
* Nano Editor
* Git and GitHub

---

## Project Structure

```text
backup-system/
│
├── backup.sh
├── restore.sh
├── backups/
├── restored_files/
├── temp/
├── logs/
├── .gitignore
└── README.md
```

---

## How It Works

### Backup Process

1. Selects the source folder automatically
2. Creates a compressed `.tar.gz` backup
3. Encrypts the backup using GPG password protection
4. Deletes the unencrypted backup file
5. Stores the encrypted file securely
6. Deletes backups older than 7 days
7. Saves backup logs for monitoring

---

## Installation Steps

### Step 1: Clone Repository

```bash
git clone https://github.com/Sandhyasamrath/secure-backup-system.git
cd secure-backup-system
```

---

### Step 2: Install Required Packages

```bash
sudo apt update
sudo apt install gnupg cron nano
```

---

### Step 3: Give Execute Permission

```bash
chmod +x backup.sh
chmod +x restore.sh
```

---

## Running the Project

### Run Backup Script

```bash
./backup.sh
```

This creates a password-protected encrypted backup.

---

### Run Restore Script

```bash
./restore.sh
```

This restores files from encrypted backup.

---

## Cron Job Setup

To automate daily backup at 10 PM:

```bash
crontab -e
```

Add this line:

```bash
0 22 * * * /home/username/backup-system/backup.sh
```

Save and exit.

---

## Example Output

```text
Password protected backup completed successfully!
Saved at:
/home/user/backup-system/backups/backup_2026-04-27_22-10-55.tar.gz.gpg
```

---

## Applications

* Personal file backup
* Student project data protection
* Office document safety
* Source code backup
* Linux server maintenance
* Secure confidential file storage

---

## Future Improvements

* Email notification after backup
* GUI version using Python Tkinter
* Cloud backup integration
* USB auto-backup support
* Multi-user backup support

---

## Resume Description

Developed a Secure Automated File Backup and Recovery System on Ubuntu using Bash scripting, Cron Jobs, and GPG encryption for scheduled backups, password-protected storage, automated cleanup, and secure file restoration.

---

## Author

Sandhya Samrath
B.Tech ECE
Indian Institute of Information Technology, Pune

GitHub: https://github.com/Sandhyasamrath

---

## License

This project is created for academic and learning purposes.
