;;settings

(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

;; discover
(require 'discover)
(global-discover-mode 1)
(discover-add-context-menu
 :context-menu '(isearch
                 (description "Isearch, occur and highlighting")
                 (lisp-switches
                  ("-cf" "Case should fold search" case-fold-search t nil))
                 (lisp-arguments
                  ("=l" "context lines to show (occur)"
                   "list-matching-lines-default-context-lines"
                   (lambda (dummy) (interactive) (read-number "Number of context lines to show: "))))
                 (actions
                  ("Isearch"
                   ("_" "isearch forward symbol" isearch-forward-symbol)
                   ("w" "isearch forward word" isearch-forward-word))
                  ("Occur"
                   ("o" "occur" occur))
                  ("More"
                   ("h" "highlighters ..." makey-key-mode-popup-isearch-highlight))))
  :bind "M-s")


(setq show-paren-style 'expression)
(show-paren-mode 2)

(menu-bar-mode -1)

(setq make-backup-files        nil)
(setq make-save-list-file-name nil)
(setq auto-save-default        nil)

(require 'yalinum)
(setq yalinum-format "%4d  |")
(global-yalinum-mode t)
(set-face-attribute 'yalinum-face nil
                    :foreground "Black"
                    :background "DarkOrange")

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-mathing t)

(require 'bs)
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

(defun my-merge-imenu ()
  (interactive)
  (let ((mode-imenu (imenu-default-create-index-function))
        (custom-imenu (imenu--generic-function imenu-generic-expression)))
    (append mode-imenu custom-imenu)))

;;vimish-fold
(require 'vimish-fold)
;; aoutopair
(require 'autopair)
(autopair-global-mode)
(global-font-lock-mode 1)
(global-auto-revert-mode t)
(setq-default indent-tabs-mode nil)

;; emojify
(add-hook 'after-init-hook #'global-emojify-mode)
;; direx
(require 'direx)

(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

;; custom functions
(defun copy-line (&optional arg)
      "Do a kill-line but copy rather than kill.  This function directly calls
    kill-line, so see documentation of kill-line for how to use it including prefix
    argument and relevant variables.  This function works by temporarily making the
    buffer read-only."
      (interactive "P")
      (let ((buffer-read-only t)
            (kill-read-only-ok t))
        (kill-line arg)))
;;neotree 
;; (require 'neotree)
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; emojify
(add-hook 'after-init-hook #'global-emojify-mode)
;;direx
(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
;; mode-icons

(mode-icons-mode)
;;(setq mode-icons-change-mode-name nil)
;;(setq mode-icons-desaturate-active t)


;; projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)


(provide 'init_common)
