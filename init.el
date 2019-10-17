;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-myelpa)
(require 'init-packages)
(require 'init-theme)
(require 'init-ui)
(require 'init-org)
(require 'init-evil)
(require 'init-built-in)
(require 'init-company)
(require 'init-lsp)
(require 'init-web)
(require 'init-javascript)
(require 'init-python)
(require 'init-go)
(require 'init-keybinds)
;; 设定customize-group自动设置的变量的值存放到哪个文件中
(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))
(load-file custom-file)


;; 设置环境为UTF-8编码
(set-language-environment "UTF-8")
