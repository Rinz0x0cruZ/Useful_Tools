#!/bin/bash
echo "[+] Path: " && read  path;
echo "[+] Files if any: " && read files;
echo "[+] Comment: " && read comment;
`cd $path`
`git add $files && git commit -m $comment`
`git push`

case "$?" in
0) echo "[+] Sucessfully Pushed" ;;
*) echo "[+] Error Occoured" ;;
esac
