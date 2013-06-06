#!/bin/bash

# give the server 1 second to start before trying to open the URL
sleep 1 && xdg-open "http://localhost:8888/" &

WIKI_DIR="$(readlink -f $(dirname $0)/../../..)"
$WIKI_DIR/tools/minihttp/mono/MiniHttp.exe --root=$WIKI_DIR
