;; multiple cursors
(require 'multiple-cursors)

;; functions
(defun copy-line (arg)
  "Copy line function"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t)
  (message "copied to buffer"))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t)
  (message "paste from buffer"))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end))
  (message "cut to buffer"))

(defun python-add-breakpoint ()
  "Add a break point"
  (interactive)
  (newline-and-indent)
  (insert "import ipdb; ipdb.set_trace()")
  (highlight-lines-matching-regexp "^[ ]*import ipdb; ipdb.set_trace()"))

(defun annotate-pdb ()
  (interactive)
  (highlight-lines-matching-regexp "import ipdb")
  (highlight-lines-matching-regexp "ipdb.set_trace()")
  (highlight-lines-matching-regexp "import pdb")
  (highlight-lines-matching-regexp "pdb.set_trace()")
 )

(defun duplicate-current-line (&optional n)
  "duplicate current line, make more than 1 copy given a numeric argument"
  (interactive "p")
  (save-excursion
    (let ((nb (or n 1))
      (current-line (thing-at-point 'line)))
      ;; when on last line, insert a newline first
      (when (or (= 1 (forward-line 1)) (eq (point) (point-max)))
    (insert "\n"))
      ;; now insert as many time as requested
      (while (> n 0)
    (insert current-line)
    (decf n)))))

(defun ipdb-cleanup ()
    (interactive)
    (save-excursion
      (replace-regexp ".*ipdb.set_trace().*\n" "" nil (point-min) (point-max))
      ;; (save-buffer)
      ))

;; end functions

;; mark lines
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
;; duplicate current line
(global-set-key (kbd "C-c d") 'duplicate-current-line)
;; copy line
(global-set-key (kbd "C-c f") 'copy-line)
;;neotree
(global-set-key (kbd "C-x \\") 'neotree-toggle)
;;bs
(global-set-key (kbd "C-x C-]") 'bs-show)
;;direx
;;(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
;;vimish mode
;; (global-set-key (kbd "C-x v f") #'vimish-fold)
;; (global-set-key (kbd "C-x v v") #'vimish-fold-delete)

;; buffer copy-paste 
(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c x") 'pbcut)

(add-hook 'python-mode-hook 'annotate-pdb)
(add-hook 'python-mode-hook 'ipdb-cleanup)

(provide 'init_keymap)
