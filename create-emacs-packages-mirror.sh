#!/usr/bin/bash

mkdir -p ~/elpa-mirror
emacs --batch -l ~/.emacs.d/init.el -l ~/.emacs.d/site-lisp/elpa-mirror/elpa-mirror.el --eval='(setq elpamr-default-output-directory "~/elpa-mirror")' --eval='(elpamr-create-mirror-for-installed)'
