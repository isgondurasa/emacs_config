(require 'spaceline-config)
(spaceline-spacemacs-theme)

(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DarkOrange"
                    :box nil)

(set-face-attribute 'mode-line-inactive nil
                    :background "Blue"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "White"
                    :background "grey22"
                    :box nil)
                    
(set-face-attribute 'powerline-active2 nil
                    :foreground "Black"
                    :background "Green"
                    :box nil)

(pomodoro-add-to-mode-line)
(provide 'init_powerline)
