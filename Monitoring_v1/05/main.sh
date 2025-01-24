#!/bin/bash
start=$(date '+%s.%N')
find $1* -type d | wc -l | awk '{print "Total number of folders (including all nested ones) = "$1}'
echo "TOP 5 folders of maximum size arranged in descending order (path and size): "
find $1 -maxdepth 0 -type d -exec du -h {} + | head -n -1 | sort -rh | head -5 | awk '{print NR" - "$2", "$1}'
ls -la $1 | head -1 | awk '{print "Total number of files = "$2}'
echo "Number of:"
locate "$1*.conf" | wc -l | awk '{print "Configuration files (with the .conf extension) = "$1}'
locate "$1*.txt" | wc -l | awk '{print "Text files = "$1}'
find $1 -maxdepth 0 -executable -type f | wc -l | awk '{print "Executable files = "$1}'
locate "$1*.log" | wc -l | awk '{print "Log files (with the extension .log) = "$1}'
locate "$1*.rar" "$1*.7z" "$1*.tar" "$1*.zip" | wc -l | awk '{print "Archive files = "$1}'
sudo find $1 -maxdepth 0 -type l | wc -l | head -1 | awk '{print "Symbolic links = "$1}'
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
. ./5_10
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
. ./part_6
end=$(date '+%s.%N')
calc="scale=1; ""$start"" / ""$end"
echo -n "Script execution time (in seconds) = "
bc <<< "$calc" | sed 's/^\./0\./'
