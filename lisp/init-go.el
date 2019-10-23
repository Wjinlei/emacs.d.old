;; Golang
(with-eval-after-load 'go-mode
  ;; 配置开启golang语法检查
  (add-hook 'go-mode-hook 'flycheck-mode)
  ;; 保存时自动格式化代码和自动导包,需要安装goimports
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(provide 'init-go)
