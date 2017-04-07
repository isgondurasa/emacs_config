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

(provide 'init_orgmode)
