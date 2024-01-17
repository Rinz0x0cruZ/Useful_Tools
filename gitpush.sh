#!/bin/bash

read -p "[+] Path: " path
read -p "[+] Files if any: " files
read -p "[+] Comment: " comment

(
    cd "$path" || { echo "Error changing directory"; exit 1; }

    git add "$files"

    read -p "[+] Need a status check? " chk

    case "$chk" in
        [Yy]* ) git status ;;
        [Nn]* ) echo "continuing....." ;;
        * ) echo "[+] Please answer in yes or no" ;;
    esac

    git commit -m "$comment"
    git push

    case "$?" in
        0) echo "[+] Successfully Pushed" ;;
        *) echo "[+] Error Occurred" ;;
    esac
)

