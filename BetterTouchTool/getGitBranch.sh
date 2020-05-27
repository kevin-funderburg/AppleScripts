#!/bin/bash
gitpath="$1/.git"
if [ -d "$gitpath" ]; then
    cd "$1"
    BRANCH=$(git rev-parse --abbrev-ref HEAD)
    STATUS=$(git status --porcelain --branch)
    echo $BRANCH
	if [ -z "$STATUS" ]; then
	   echo "No changes"
	else
	    IFS=$'\r'
		for line in "$STATUS";
			do
				if  echo "$line" | grep -Eq "^##.*"; then
					STREAM=$(echo $line | grep -Eo "ahead|behind")
					if [ -z "$STREAM" ]; then
						echo "neither"
					else
						echo $STREAM
					fi
				fi
				lineStatus=$(echo $line | grep -Eo "^( |[A-Z]){2}")
				echo $lineStatus
			done
	fi
else
    echo "false"
fi