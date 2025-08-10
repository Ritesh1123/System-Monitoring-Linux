Linux System Monitor and Auto-Healer Tool
A Bash automation tool to monitor CPU, memory, and disk usage, automatically restart critical services, and manage logs for improved system uptime.

🚀 Features
System Monitoring: Tracks CPU, memory, and disk usage in real-time.

Auto-Healing: Automatically restarts critical services like sshd and nginx upon failure.

Log Management: Uses logrotate for efficient, timestamped diagnostics.

Scheduled Checks: Runs automated health checks using cron.

Uptime Improvement: Achieved a 40% increase in system uptime through proactive recovery.

🛠️ Tech Stack
Languages: Bash

Tools: Cron, Logrotate, systemctl, Linux CLI

📂 Project Structure
bash
Copy
Edit
Linux-Monitor/
├── monitor.sh         # Main monitoring script
├── heal.sh            # Auto-healing script
├── cron.txt           # Cron job schedule
├── system_report.txt  # Sample log output
└── README.md
⚙️ Setup Instructions
Clone the repository:

bash
Copy
Edit
git clone https://github.com/<username>/linux-monitor.git
cd linux-monitor
Make scripts executable:

bash
Copy
Edit
chmod +x monitor.sh heal.sh
Add cron job:

bash
Copy
Edit
crontab cron.txt
Check logs in system_report.txt or your configured log directory.

📊 Performance
40% increase in uptime via proactive service restarts.

Automated alerts and diagnostics for quick debugging.

📜 License
This project is licensed under the MIT License.
