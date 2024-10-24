# Fix User Account Control (UAC) Yes Button Missing or Grayed Out in Windows 10

Start > Settings > Update & Security > Recovery  -- Restart now

# Choose an option screen is shown

Troubleshoot > Advanced options > Startup Settings -- Restart

# Startup Settings - Press 6
6) Enable Safe Mode with Command Prompt

# Select Administrator


# Once Logged in... at the command prompt

# type "net user" to show accounts
# C:\WINDOWS\system32> 
net user 

# C:\WINDOWS\system32> 
net localgroup Administrators [user-name] /add 

# hit enter

# "the command completed sucessfully."

# reboot

shutdown /r -t 0
