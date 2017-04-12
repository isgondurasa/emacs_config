;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c l") 'mc/edit-lines)
(global-set-key (kbd "C-c .") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c ,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m") 'mc/mark-all-like-this)

;; comment/uncomment
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)
;; git annotate
(global-set-key (kbd "C-C \\") 'vc-annotate)
;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; optional key binding
(defun copy-line (&optional arg)
      "Do a kill-line but copy rather than kill.  This function directly calls
    kill-line, so see documentation of kill-line for how to use it including prefix
    argument and relevant variables.  This function works by temporarily making the
    buffer read-only."
      (interactive "P")
      (let ((buffer-read-only t)
            (kill-read-only-ok t))
        (kill-line arg)))
(global-set-key "\C-c\C-k" 'copy-line)
;;neotree
(global-set-key (kbd "C-x \\") 'neotree-toggle)
;;bs 
(global-set-key [f2] 'bs-show)
;;direx
;;(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
;;vimish mode
(global-set-key (kbd "C-x v f") #'vimish-fold)
(global-set-key (kbd "C-x v v") #'vimish-fold-delete)

(provide 'init_keymap)



