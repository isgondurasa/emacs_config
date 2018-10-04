(require 'spaceline-config)
(require 'spaceline-all-the-icons)

(spaceline-emacs-theme)
(spaceline-all-the-icons--setup-git-ahead)


;; active
(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DarkOrange"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "Black"
                    :background "DarkOrange"
                    :box nil)
                    
(set-face-attribute 'powerline-active2 nil
                    :foreground "White"
                    :background "DarkOrange"
                    :box nil)

;; ;; inactive
(set-face-attribute 'mode-line-inactive nil
                    :background "grey22"
                    :foreground "Blue"
                    :box nil)

(set-face-attribute 'powerline-inactive1 nil
                    :background "grey22"
                    :foreground "Blue"
                    :box nil)
                    
(set-face-attribute 'powerline-inactive2 nil
                    :background "grey22"
                    :foreground "Blue"
                    :box nil)



(setq spaceline-separator-dir-left '(left . left))
(setq spaceline-separator-dir-right '(right . right))

(provide 'init_powerline)
