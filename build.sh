#!/bin/sh
set -xeo
cat ~/plantuml.jar > /dev/null || wget https://github.com/plantuml/plantuml/releases/download/v1.2024.5/plantuml-gplv2-1.2024.5.jar -o ~/plantuml.jar
emacs -Q --script build-site.el
