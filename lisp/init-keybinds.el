(provide 'init-keybinds)

;; Evil 模式下的快捷键绑定
(global-evil-leader-mode)
;; 键前缀空格
(setq evil-leader/leader "SPC")
(evil-leader/set-key
  ;; Move Window
  "0"   'select-window-0
  "1"   'select-window-1
  "2"   'select-window-2
  "3"   'select-window-3
  "4"   'select-window-4
  "5"   'select-window-5
  "6"   'select-window-6
  "7"   'select-window-7
  "8"   'select-window-8
  "9"   'select-window-9
  ;; Other
  ":"   'helm-M-x                     ;;增强M-x
  )

;; Emacs原生模式下的快捷键绑定
;; 键前缀Ctrl+s
(define-key global-map (kbd "C-s") 'swiper)

;; 键前缀Ctrl+x
(define-key global-map (kbd "C-x b") 'helm-buffers-list)
(define-key global-map (kbd "C-x C-f") 'counsel-find-file)
(define-key global-map (kbd "C-x g") 'magit-status)
(define-key global-map (kbd "C-x t t") 'treemacs)
(define-key global-map (kbd "C-x s") 'nil)
(define-key global-map (kbd "C-x s s") 'helm-do-ag-project-root)
(define-key global-map (kbd "C-x s g") 'counsel-git)
(define-key global-map (kbd "C-x s f") 'helm-imenu)
(define-key global-map (kbd "C-x s i") 'iedit-mode)
(define-key global-map (kbd "C-x C-r") 'nil)
(define-key global-map (kbd "C-x C-r") 'recentf-open-files)
(define-key global-map (kbd "C-x ?") 'youdao-dictionary-search)
(define-key global-map (kbd "C-x U") 'elpamr-create-mirror-for-installed)
(define-key global-map (kbd "C-x P i") 'package-install)
(define-key global-map (kbd "C-x P r") 'package-autoremove)
(define-key global-map (kbd "C-x P l") 'package-list-packages)
(define-key global-map (kbd "C-x P x") 'customize-group)
(define-key global-map (kbd "C-x p a") 'lsp-workspace-folders-add)
(define-key global-map (kbd "C-x p r") 'lsp-workspace-folders-remove)
(define-key global-map (kbd "C-x p s") 'lsp-workspace-folders-switch)
(define-key global-map (kbd "C-x p x") 'lsp-workspace-blacklist-remove)
(define-key global-map (kbd "C-x F F") 'indent-region-or-buffer)
(define-key global-map (kbd "C-x F D") 'remove-dos-eol)
(define-key global-map (kbd "C-x k") 'nil)
(define-key global-map (kbd "C-x k p") 'projectile-kill-buffers)
(define-key global-map (kbd "C-x k k") 'kill-buffer)

;; 键前缀Ctrl+c
(define-key global-map (kbd "C-c C-c") 'eshell)

;; 键前缀Ctrl+h
