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
(global-set-key "\C-c\C-k" 'copy-line)
;;neotree
(global-set-key (kbd "C-x \\") 'neotree-toggle)
;;bs 
(global-set-key [f2] 'bs-show)

(provide 'init_keymap)



