(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'python-mode-hook 'python-mode-hook)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(set-face-attribute 'flycheck-error nil
                   :foreground "Black"
                   :background "Red")

(set-face-attribute 'flycheck-warning nil
                   :foreground "Black"
                   :background "Yellow")

(set-face-attribute 'flycheck-info nil
                   :foreground "Black"
                   :background "Green")

(elpy-enable)

(global-git-gutter-mode +1)
(add-hook 'python-mode-hook 'git-gutter-mode)

(set-face-foreground 'git-gutter:modified "yellow")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")


;;(setq jedi:complete-on-dot t)

;; cl
;;(require 'cl)

(provide 'init_python)
