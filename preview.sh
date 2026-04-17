#!/bin/sh
# emacs -Q --script preview-site.el
emacsclient -e "(httpd-stop)"
emacsclient -e "(httpd-serve-directory \"./public/\")"
emacsclient -e "(eww \"localhost:8080\")"
