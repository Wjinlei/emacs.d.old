;; Golang
(with-eval-after-load 'go-mode
  ;; 配置开启golang语法检查
  (add-hook 'go-mode-hook 'flycheck-mode)
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(provide 'init-go)
