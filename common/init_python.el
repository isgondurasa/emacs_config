(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'python-mode-hook 'python-mode-hook)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; (set-face-attribute 'flycheck-error nil
;;                     :foreground "yellow"
;;                     :background: "red")

;; (set-face-attribute 'flycheck-warning nil
;;                     :foreground "yellow"
;;                     :background: "red")


(global-git-gutter-mode +1)
(add-hook 'python-mode-hook 'git-gutter-mode)

(set-face-background 'git-gutter:modified "purple") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")


;;(setq jedi:complete-on-dot t)

;; cl
(require 'cl)

(provide 'init_python)
