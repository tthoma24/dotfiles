(setq inhibit-startup-screen t)
;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "puppet-mode-init")
(load "powershell-mode-init")
