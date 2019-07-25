#!/bin/bash
# start openrefine
/opt/openrefine/refine &
REFINE_PID=$!
sleep 2
# open firefox to that address
/usr/bin/firefox http://127.0.0.1:3333/ &
FIREFOX_PID=$!
wait $FIREFOX_PID
kill -9 $REFINE_PID