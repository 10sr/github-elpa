;; -*- mode: eask; lexical-binding: t -*-

(package "github-elpa" "0.0.1" "Build and publish ELPA repositories with GitHub Pages")

(website-url "https://github.com/10sr/github-elpa")

(package-file "github-elpa.el")

(files :defaults "bin")

(source 'gnu)
(source 'melpa)

(depends-on "package-build")
(depends-on "commander")
(depends-on "git")

(setq network-security-level 'low)  ; see https://github.com/jcs090218/setup-emacs-windows/issues/156#issuecomment-932956432
