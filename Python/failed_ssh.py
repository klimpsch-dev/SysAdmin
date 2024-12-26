import re

# Path to the log file
log_file = '/var/log/secure'

failed_attempts_pattern = re.compile(r'Failed (password|publickey) for')

with open(log_file, 'r') as f:
    log_lines = f.readlines()

failed_attempts = []
for line in log_file:
    if failed_attempts_pattern.search(line):
        failed_attempts.append(line)

for attempt in failed_attempts:
    print(attempt)

