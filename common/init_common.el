(require 'powerline) 
(powerline-center-theme)
(setq powerline-arrow-shape 'curve)
(add-to-list 'load-path "~/.emacs.d/modules/emacs-powerline")

;;(custom-set-faces
;; '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;; '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

;; (setq powerline-color1 "#073642")
;; (setq powerline-color2 "#abb7ba")
;; ;;(setq powerline-color2 "#002b36")

(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DarkOrange"
                    :box nil)

(set-face-attribute 'mode-line-inactive nil
                    :background "Blue"
                    :box nil)


(setq powerline-color1 "grey22")
(setq powerline-color2 "grey40")

(custom-set-faces
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

;;settings
(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

(setq show-paren-style 'expression)
(show-paren-mode 2)

(menu-bar-mode -1)
(tool-bar-mode -1)

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

(global-set-key (kbd "C->") 'ace-jump-mode)

(require 'yalinum)
(setq yalinum-format "%4d  ")
(global-yalinum-mode t)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-mathing t)

(require 'bs)
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

(global-set-key [f2] 'bs-show)

(defun my-merge-imenu ()
  (interactive)
  (let ((mode-imenu (imenu-default-create-index-function))
        (custom-imenu (imenu--generic-function imenu-generic-expression)))
    (append mode-imenu custom-imenu)))

(require 'autopair)
(autopair-global-mode)

(global-font-lock-mode 1)


(global-auto-revert-mode t)

(setq-default indent-tabs-mode nil)

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c l") 'mc/edit-lines)
(global-set-key (kbd "C-c .") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c ,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m") 'mc/mark-all-like-this)

;; comment/uncomment
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)
;; git blame
(global-set-key (kbd "C-C \\") 'vc-annotate)


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

;; optional key binding
(global-set-key "\C-c\C-k" 'copy-line)

;; scala language
(require 'scala-mode)
(global-set-key (kbd "<f8>")
                (lambda ()
                  (interactive)
                  (dired "")))

(require 'neotree)
(global-set-key (kbd "C-x \\") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))


;; orgmode set up
(require 'org-install)

(setq org-log-done 'time)
(setq org-log-done 'note)
(setq org-todo-keywords
      '((sequence "TODO (t)" "WAIT (w@/!)" "|" "DONE (d!)" "CANCELED(c@)")))

(defun org-summary-todo (n-done n-not-done)
       "Switch entry to DONE when all subentries are done, to TODO otherwise."
       (let (org-log-done org-log-states)   ; turn off logging
         (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
     
     (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setq org-todo-keyword-faces
           '(("TODO" . org-warning) ("STARTED" . "yellow")
             ("CANCELED" . (:foreground "blue" :weight bold))))

(setq org-tag-alist '(("@progress" . ?p)
                      ("@algorithms" . ?a)
                      ("@family" . ?f)
                      ("@pratice" . ?r)
                      ("@theory" . ?t)
                      ("@programming" . ?g)
                      ("@english" . ?w)))

;; tramp mode
(setq tramp-default-method "ssh")
(provide 'init_common)

(require 'dired-k)
(define-key dired-mode-map (kbd "K") 'dired-k)

;; line highlite
(global-hl-line-mode 1)
