(require 'lsp-mode)
(require 'lsp-python-ms)
(require 'lsp-java)
;; 加载bash的lsp-mode
(add-hook 'sh-mode-hook #'lsp)
;; 加载golang的lsp-mode
(add-hook 'go-mode-hook #'lsp)
;; 加载python的lsp-mode
(add-hook 'python-mode-hook #'lsp)
;; 加载python的lsp-mode
(add-hook 'java-mode-hook #'lsp)

;; 关闭默认的语法检查
(setq lsp-prefer-flymake nil)
;; 配置开启bash语法检查
(add-hook 'sh-mode-hook 'flycheck-mode)
;; 配置开启golang语法检查
(add-hook 'go-mode-hook 'flycheck-mode)
;; 配置开启python语法检查
(add-hook 'python-mode-hook 'flycheck-mode)
;; 配置开启java的语法检查
(add-hook 'java-mode-hook 'flycheck-mode)

;; lsp-ui
(require 'lsp-ui)
(add-hook 'lsp-mode 'lsp-ui-mode)

;; 将lsp-mode添加到company的后端
(require 'company-lsp)
(push 'company-lsp company-backends)

(provide 'init-lsp)
