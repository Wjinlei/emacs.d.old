;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;========================================================================================
;;                                   配置文件模块化配置
;;========================================================================================
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

;;========================================================================================
;;                                       快捷函数
;;========================================================================================
(defun open-my-init-file()
;; 定义快速打开init.el的函数
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-my-keybinds-file()
;; 定义快速打开init-keybindings.el文件的函数
  (interactive)
  (find-file "~/.emacs.d/lisp/init-keybinds.el"))

(defun open-my-packages-file()
;; 定义快速打开init-packages.el文件的函数
  (interactive)
  (find-file "~/.emacs.d/lisp/init-packages.el"))

(defun open-my-custom-file()
;; 定义快速打开init-customize-groups.el文件的函数
  (interactive)
  (find-file "~/.emacs.d/lisp/init-customize-groups.el"))

(defun open-my-org-file()
;; 定义快速打开init-org.el文件的函数
  (interactive)
  (find-file "~/.emacs.d/lisp/init-org.el"))

(defun open-my-ui-file()
;; 定义快速打开init-ui.el文件的函数
  (interactive)
  (find-file "~/.emacs.d/lisp/init-ui.el"))

(defun open-my-built-file()
;; 定义快速打开init-built-in-exts.el文件的函数
  (interactive)
  (find-file "~/.emacs.d/lisp/init-built-in-exts.el"))

(defun open-my-gtd-file()
;; 定义快速打开gtd.org文件的函数
  (interactive)
  (find-file "~/.emacs.d/org/gtd.org"))

;;========================================================================================
;;                                       启动环境设置
;;========================================================================================
;; 设置环境为UTF-8编码
(set-language-environment "UTF-8")
