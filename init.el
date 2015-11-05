;; This is the main initialization file I use for starting
;; emacs. This is the file that emacs uses on initial start
;; up, and everything else comes from that. 
;;
;; This particular way of setting up emacs configuration is 
;; based mainly on that of Daniel Mai, but draws from many 
;; others.
;;
;; HISTORY
;;   31-10-15: Initial version
;;
;; Adrian Burd
;;
;; First, change the displays during start up
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; I'm going to make use of the package manager through ELPA
;; so I need ot load and set that up. 
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http//marmalade-repo.org/packages/") t)
(package-initialize)

;; I'm going to use use-package to load and configure the 
;; various packages I need. The reason for this is that the 
;; organization of the code is neater, and using it improves 
;; load times considerably. To do this, I'm going to bootstrap
;; the install of this package - if it's not already loaded, 
;; then it will be downloaded, installed, and loaded
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)
;(setq use-package-verbose t)

;; The meat of the configuration file is contained in an
;; org mode file (for literate programming) and so we have
;; to load this.
(org-babel-load-file (concat user-emacs-directory "config.org"))


