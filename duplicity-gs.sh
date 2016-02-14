#!/bin/bash
thedate=$(date +%d%b%Y)
duplicity --progress --log-file /root/duplicity-logs/duplicity-gs_$thedate.txt --encrypt-key=YOURKEYHERE --sign-key=YOURKEYHERE /seafile/ gs://ix4-300d/seafile/
