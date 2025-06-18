# Task Scheduler System  

A **PHP-based task management application** with email reminders, designed to operate without a database (file-based storage). Users can add tasks, subscribe for hourly reminders, and manage subscriptions.

[![PHP Version](https://img.shields.io/badge/PHP-8.3%2B-blue.svg)](https://php.net/)
![No Database](https://img.shields.io/badge/Storage-File%20(JSON)-orange.svg)

## ✨ Features  

✅ **Task Management**  
- Add/delete tasks  
- Mark tasks as complete/incomplete  
- Prevent duplicate tasks  

✅ **Email Subscription System**  
- Secure 6-digit verification codes  
- Pending/verified subscriber tracking  
- One-click unsubscribe  

✅ **Automated Reminders**  
- Hourly cron job for pending task alerts  
- HTML-formatted emails with unsubscribe links  

✅ **No-Database Architecture**  
- Stores data in JSON files (`tasks.txt`, `subscribers.txt`, `pending_subscriptions.txt`)  
- Atomic file operations with error handling  

## 🛠️ Tech Stack  

| Component       | Technology Used          |
|-----------------|-------------------------|
| Backend         | PHP 8.3+                |
| Storage         | JSON files              |
| Email           | PHP `mail()` function   |
| Automation      | Cron jobs via Bash      |
| Security        | Verification codes      |

## 📂 File Structure  
src/
├── functions.php # Core logic
├── index.php # Main interface
├── verify.php # Email verification
├── unsubscribe.php # Unsubscribe handler
├── cron.php # Reminder engine
├── setup_cron.sh # Cron job installer
├── tasks.txt # Task storage (JSON)
├── subscribers.txt # Verified emails (JSON)
└── pending_subscriptions.txt # Pending emails (JSON)


## 🚀 Installation  

1. **Clone the repository**  
   ```bash
   git clone https://github.com/rtlearn/task-scheduler-praveenkumar949.git
   cd task-scheduler-praveenkumar949

📝 Usage
Add tasks via the web interface

Subscribe emails (verification link will be sent)

Hourly reminders will automatically notify subscribers

🔧 Testing
Test cases covered:

Task duplication prevention

Email verification flow

Cron job execution

Unsubscribe functionality

