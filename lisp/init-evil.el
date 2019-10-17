(provide 'init-evil)

;=========================================================================================
;;                             配置Evil,Evil是一个模拟Vim的插件
;;=========================================================================================
(require 'evil)
(evil-mode t)
(setcdr evil-insert-state-map nil)
(setq evil-want-C-u-scroll t)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; 开启 evil-nerd-commenter,它是一个快速注释和取消注释的插件
(evilnc-default-hotkeys)
