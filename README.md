This Bash script analyzes SSH authentication logs (/var/log/auth.log) to detect logins (both failed and successful), repeated attacks from the same IP, and root login attempts. The results are saved in a report (log_analysis.txt).

- Counts failed and successful SSH login attempts
- Identifies top attacking IPs (brute force detection)
- Detects root login attempts (potential privilege escalation)
- Lists all users attempting logins
