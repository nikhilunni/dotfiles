; color theme
(load-theme 'zenburn t)

; helm
(helm-mode 1)

; auto-complete
(require 'auto-complete-config)
(auto-complete-mode)
(ac-config-default)

; ac-helm
;(ac-complete-with-helm)
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)


; pair mode
(show-paren-mode)
(electric-pair-mode)
