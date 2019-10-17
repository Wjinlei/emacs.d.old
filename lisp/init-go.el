;; 设置tab宽度为4个空格
(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)))

(provide 'init-go)
