(provide 'init-keybinds)

;; Evil 模式下的快捷键绑定
(global-evil-leader-mode)
;; 键前缀空格
(setq evil-leader/leader "SPC")
(evil-leader/set-key
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
(define-key global-map (kbd "C-x s r") 'iedit-mode)
(define-key global-map (kbd "C-x C-r") 'nil)
(define-key global-map (kbd "C-x C-r") 'recentf-open-files)
(define-key global-map (kbd "C-x ?") 'youdao-dictionary-search)
(define-key global-map (kbd "C-x U") 'elpamr-create-mirror-for-installed)
(define-key global-map (kbd "C-x p i") 'package-install)
(define-key global-map (kbd "C-x p r") 'package-autoremove)
(define-key global-map (kbd "C-x p l") 'package-list-packages)
(define-key global-map (kbd "C-x p x") 'customize-group)
(define-key global-map (kbd "C-x F F") 'indent-region-or-buffer)
(define-key global-map (kbd "C-x F D") 'remove-dos-eol)
;; 键前缀Ctrl+c

;; 键前缀Ctrl+h
