;;; 
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(autopair
                      yasnippet
                      auto-complete
                      fuzzy
		      cl
		      git-gutter
		      helm
		      helm-projectile
                      helm-ls-git
		      blank-mode
                      flycheck
		      yalinum
		      ido
		      bs
		      scala-mode
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
                      solarized-theme
		      sublime-themes
                      )
"install packages")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/modules")

(when (not package-archive-contents)
  (package-refresh-contents))


(add-to-list 'load-path "~/.emacs.d/modules")
(add-to-list 'load-path "~/.emacs.d/common")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(require 'init_common)
(require 'init_helm)
(require 'init_python)
(require 'init_company)

(load-theme 'tango t)
