#!/bin/env fish
set notifs $(makoctl history)
set notifs_jq $(echo $notifs | jq '.data.[].[] | [.summary.data, .body.data]')
set notifs_parsed $(echo $notifs_jq | jq -s 'map(., "\n") | .[]')
echo "{\"text\": $notifs_parsed[2] \"tooltip\": \"s\"}"

