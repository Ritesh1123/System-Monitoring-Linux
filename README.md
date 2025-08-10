# Linux System Monitor and Auto-Healer Tool

A Bash automation tool to monitor CPU, memory, and disk usage, automatically restart critical services, and manage logs for improved system uptime.

## 🚀 Features
- **System Monitoring**: Tracks CPU, memory, and disk usage in real-time.
- **Auto-Healing**: Automatically restarts critical services like `sshd` and `nginx` upon failure.
- **Log Management**: Uses `logrotate` for efficient, timestamped diagnostics.
- **Scheduled Checks**: Runs automated health checks using `cron`.
- **Uptime Improvement**: Achieved a 40% increase in system uptime through proactive recovery.

## 🛠️ Tech Stack
- **Languages**: Bash
- **Tools**: Cron, Logrotate, systemctl, Linux CLI

## 📂 Project Structure

Linux-Monitor/
├── monitor.sh # Main monitoring script
├── heal.sh # Auto-healing script
├── cron.txt # Cron job schedule
├── system_report.txt # Sample log output
└── README.md


## ⚙️ Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/<username>/linux-monitor.git
   cd linux-monitor

2. Make scripts executable:
   chmod +x monitor.sh heal.sh

3. Add cron job:
   crontab cron.txt

4. Check logs in system_report.txt or your configured log directory.

📊 Performance

- 40% increase in uptime via proactive service restarts.
- Automated alerts and diagnostics for quick debugging.

📜 License
This project is licensed under the MIT License.


---

If you want, I can also **merge these into a single portfolio-style README** for your GitHub profile so recruiters see both projects together in one place. That would make it look more professional.

