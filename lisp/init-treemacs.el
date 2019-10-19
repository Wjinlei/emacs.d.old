
;; Treemacs 项目管理, Ctrl-x d
;; ? 查看命令帮助
(with-eval-after-load 'treemacs-mode
  (require 'treemacs-evil)
  (require 'treemacs-icons-dired)
  (treemacs-icons-dired-mode t)
  )

(provide 'init-treemacs)
