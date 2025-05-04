****# Efficient Log Management and Rotation System 

## Overview

This project provides a bash script to monitor system logs, check for specific errors and warnings, and automatically rotate logs when they exceed a predefined size limit (5MB). The script helps in managing system logs, which is essential for cloud infrastructure maintenance, particularly in AWS Cloud Support or Associate Solutions Architect roles.

Key Features:
- **Log Monitoring**: The script scans logs for errors and warnings (`ERROR`, `WARNING`).
- **Log Rotation**: Automatically moves log files to an archive folder when they exceed a set size.
- **Report Generation**: Generates a report detailing errors, warnings, and log rotation status.
- **Cross-Platform Compatibility**: Works on macOS and Linux-based systems.

********Why Is This Important**
In cloud support or associate roles, managing logs is essential for:

Troubleshooting: Quickly identifying and resolving system or service issues.

Performance Monitoring: Tracking the health and performance of systems and applications.

Security Auditing: Monitoring logs for signs of unauthorized access or security incidents.

Automation & Scalability: Automating routine tasks like log management to ensure efficient and scalable operations in cloud environments.

### Steps to Set Up

1. **Clone the Repository**:
    git clone https://github.com/yourusername/Log-monitoring-and-Log-rotation.git
    cd Log-monitoring-and-Log-rotation

2. **Create Required Folders and Files**:
    mkdir -p rotated  # Folder for rotated logs
    touch log_report.txt  # Log report file

3. **Make the Script Executable**:
    chmod +x log_monitor.sh

4. **Run the Script**:
    sudo ./log_monitor.sh

    > **Note**: `sudo` is required to access system logs located in `/var/log/system.log` on macOS or Linux.

## How It Works

1. **Log Monitoring**: The script checks the **system.log** (`/var/log/system.log`) for any errors or warnings by searching for keywords like `ERROR` and `WARNING`. It appends the results to the `log_report.txt`.

2. **Log Rotation**: If the log file exceeds **5MB**, the script moves the log to the `rotated/` directory and renames it with a timestamp (e.g., `system_20230425_130501.log`). A new, empty log file is then created in place of the rotated file.

3. **Generating Reports**: The script creates a report detailing:
    - The date and time of the script run.
    - Any `ERROR` or `WARNING` messages found.
    - Whether the log was rotated.

## Automating the Script

To automate log monitoring and rotation, you can use **cron jobs** to schedule the script to run periodically.

1. **Edit the Crontab**:
    crontab -e

2. **Add a Cron Job to Run the Script Every Hour**:
    0 * * * * /path/to/log-monitoring-directory/log_monitor.sh

    This will run the script at the top of every hour.

## Testing and Troubleshooting

### **Testing Log Monitoring**:
To simulate an error and test the log monitoring functionality:
echo "ERROR: Something broke!" | sudo tee -a /var/log/system.log
****
