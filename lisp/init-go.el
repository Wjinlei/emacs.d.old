;; go
(with-eval-after-load 'go

  ;; 配置开启golang语法检查
  (add-hook 'go-mode-hook 'flycheck-mode)

  ;; 设置tab宽度为4个空格
  (add-hook 'go-mode-hook
            (lambda ()
              (setq tab-width 4)))
)

(provide 'init-go)
