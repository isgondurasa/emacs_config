(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(autopair
                      ace-isearch
                      discover
                      yasnippet
                      auto-complete
                      fuzzy
		      cl
                      elpy
		      git-gutter
		      helm
		      helm-projectile
                      helm-ls-git
		      blank-mode
                      flycheck
		      linum
		      ido
		      bs
		      neotree
		      multiple-cursors
                      anaconda-mode
                      company
                      company-anaconda
                      company-jedi
                      color-theme
		      pyimport
		      pyvenv
		      python-docstring
		      python-mode
                      dracula-theme
                      solarized-theme
		      sublime-themes
                      spaceline
                      telephone-line
                      emojify
                      direx
                      magit
                      org-bullets
                      vimish-fold
                      switch-window
		      git-gutter
                      git-timemachine
                      magit
                      org-bullets
                      mode-icons
                      )
"install packages")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(when (not package-archive-contents)
  (package-refresh-contents))

(load-theme 'tsdh-light t)

;;(add-to-list 'load-path "~/.emacs.d/modules")
(add-to-list 'load-path "~/.emacs.d/common")

(require 'init_common)
(require 'init_helm)
(require 'init_python)
(require 'init_company)
;;(require 'init_telephoneline)
(require 'init_powerline)
(require 'init_orgmode)
(require 'init_keymap)

(load-theme 'adwaita)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (importmagic yalinum xpm vimish-fold tramp-term telephone-line switch-window sublime-themes spaceline solarized-theme scala-mode ranger python-mode python-docstring pyimport pomodoro org-bullets neotree multiple-cursors mode-icons magit ipython helm-projectile helm-ls-git git-timemachine git-gutter fuzzy flycheck emojify elpy dracula-theme discover direx company-jedi company-anaconda color-theme blank-mode autopair auto-complete all-the-icons ace-isearch))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
