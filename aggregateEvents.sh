#!/bin/bash

hostfqdn="vrli.joshs.cloud"
baseUrl="https://$hostfqdn:9543/api/v1/"
timeRange="300000" # In ms 300000 == 5 minutes.
token=$(curl -k -X POST $baseUrl"sessions" -d '{"username":"admin","password":"mySecretPassword","provider":"Local"}')

readarray -d , -t tokenArray <<< $token
readarray -d : -t tokenArray <<< ${tokenArray[1]}
readarray -d \" -t tokenArray <<< ${tokenArray[1]}
token="Authorization: Bearer "${tokenArray[1]}
eventsUrl=$baseUrl"aggregated-events/timestamp/LAST+"$timeRange"?bin-width=all"
output=$(curl -k $eventsUrl --header "$token")
output="$(echo $output | grep -o \[0-9]* | tail -1)"

logger "$hostfqdn: $output events received in the past "$(expr $timeRange / 1000 / 60)" minutes."
