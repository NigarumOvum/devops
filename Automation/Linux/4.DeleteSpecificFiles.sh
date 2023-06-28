find . -type f -name "*.log" -exec rm {} \;
# To delete all files older than 25 days, run this command:
$ find . -type f -mtime +25 -exec rm {} \;