;;; init_python --- Summary;

;;; Code:

;;(add-hook 'python-mode-hook 'anaconda-mode)
;;(add-hook 'python-mode-hook 'anaconda-eldoc-mode)



;; flycheck

;;; Commentary:
;; 

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(set-face-attribute 'flycheck-error nil
                   :foreground "Black"
                   :background "DarkOrange")

(set-face-attribute 'flycheck-warning nil
                   :foreground "White"
                   :background "DarkGray")

(set-face-attribute 'flycheck-info nil
                   :foreground "Black"
                   :background "Green")

(elpy-enable)
(setq elpy-rpc-python-command "python3")

;;(require 'ipython)
;;(add-hook 'elpy-mode-hook 'elpy-use-ipython)
;;(elpy-use-ipython)


(global-git-gutter-mode +1)
(add-hook 'python-mode-hook 'git-gutter-mode)

(set-face-foreground 'git-gutter:modified "yellow")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")

;;(setq jedi:complete-on-dot t)

(provide 'init_python)
;;;



;;; init_python.el ends here
