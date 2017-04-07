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

(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))
(setq whitespace-display-mappings
      '(
	(space-mark 32 [183] [46])
	(newline-mark 10 [182] [10])
	(tab-mark 9 [9655 9] [92 9])
	))

(require 'blank-mode)
(global-blank-mode 0)

(add-hook 'text-mode-hook 'blank-mode-on)

(setq blank-chars '(tabs spaces trailing lines space-before-tab))
(setq blank-style '(color))


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

;; aoutopair
(require 'autopair)
(autopair-global-mode)

(global-font-lock-mode 1)
(global-auto-revert-mode t)
(setq-default indent-tabs-mode nil)

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
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))


;; tramp mode
(setq tramp-default-method "ssh")

;; emojify
(add-hook 'after-init-hook #'global-emojify-mode)

;;direx
(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

(provide 'init_common)
