(provide 'init-python)

;;========================================================================================
;;                                        Python
;;========================================================================================
;; 配置python3环境,要保证在shell中可以直接敲python3进入python shell
(setq py-python-command "python3")
(setq python-shell-interpreter "python3")
(setq python-indent-guess-indent-offset nil)

;; Python,延迟加载anaconda-mode及其backends
(with-eval-after-load 'python
  ;; (add-to-list 'company-backends 'company-anaconda)
  ;; 让代码自动遵循PEP8规范
  ;; 需要安装autopep8, brew install autopep8
  ;; pip也需安装pip install autopep8
  ;; 要保证能找到autopep8的可执行文件,就是直接敲autopep8能使用这个命令
  ;; (require 'py-autopep8)
  ;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
 
  ;; 语法检查,需要安装pylint
  ;; (add-hook 'python-mode-hook 'flycheck-mode)
  ;; (add-hook 'python-mode-hook 'anaconda-mode)

  ;; 取消python-mode中原来的C-c C-c避免和全局的kebinds冲突
  (define-key python-mode-map (kbd "C-c C-c") nil)
  )
