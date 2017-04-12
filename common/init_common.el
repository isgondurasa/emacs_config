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
;;direx
;;(require 'direx)
(require 'ranger)
(ranger-override-dired-mode t)

(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

(provide 'init_common)
