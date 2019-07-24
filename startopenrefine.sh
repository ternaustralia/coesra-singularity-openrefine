#!/bin/bash
# start openrefine
/opt/openrefine/refine &
sleep 2
# open firefox to that address
/usr/bin/firefox http://127.0.0.1:3333/