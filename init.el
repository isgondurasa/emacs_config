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
                      ;; js2-mode
                      json-mode
                      web-mode
                      exec-path-from-shell
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
                      markdown-mode
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

(add-to-list 'load-path "~/.emacs.d/common")
(load-theme 'solarized-light t)


(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "PYTHONPATH")

(require 'init_common)
(require 'init_helm)
(require 'init_python)
(require 'init_company)
(require 'init_powerline)
(require 'init_orgmode)
(require 'init_keymap)
(require 'init_markdown)
