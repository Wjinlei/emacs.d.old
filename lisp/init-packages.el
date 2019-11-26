(provide 'init-packages)

;;========================================================================================
;;      基础快捷键说明: M (Alt) C (Ctrl) S(shift) s(super) M-x (Alt+x) C-x (Ctrl+x)
;;========================================================================================
;;                                  插件管理器配置
;;========================================================================================
;;
;;  M-x package-list-packages 列出插件列表
;;  i  - 选择要安装的包
;;  d  - 选择要删除的包
;;  U  - 升级已安装的包
;;  x  - 执行操作
;;  M-x package－install 插件名(这种方法也可以安装插件)
;;  C-s 搜索插件,再次按则向下继续搜索
;;  M-x package-autoremove 自动移除不需要的插件
;;========================================================================================
(require 'cl)

;; 配置elpa和melpa源
(when (>= emacs-major-version 24)
  ;; 稳定版仓库
  (add-to-list 'package-archives '("gnu-elpa-china" . "https://elpa.emacs-china.org/gnu/") t)
  ;; (add-to-list 'package-archives '("melpa-stable-china" . "https://elpa.emacs-china.org/melpa-stable/") t)
  ;; 最新版仓库
  (add-to-list 'package-archives '("melpa-china" . "https://elpa.emacs-china.org/melpa/") t)
  )

;; 列表中定义的插件,如果没安装则自动安装
(defvar wangjl/packages '(
                          ;; 主题
                          doom-themes
                          ;; 基础mode
                          nyan-mode
                          css-mode
                          js2-mode
                          web-mode
                          emmet-mode
                          python-mode
                          go-mode
                          grip-mode
                          ;; Evil
                          evil
                          evil-leader
                          evil-nerd-commenter
                          ;; 代码补全插件
                          company
                          company-lsp
                          ;; Mac系统下保持和系统的环境变量一致
                          exec-path-from-shell
                          ;; 增强搜索功能的插件
                          swiper
                          counsel
                          ;; python开发自动遵循pep8规范,需要安装autopep8
                          py-autopep8
                          ;; 快速选择一个区域的插件
                          expand-region
                          ;; 超快速搜索插件
                          helm-ag
                          ;; 让Org-mode生成的html文件带颜色的插件
                          htmlize
                          ;; 代码重构插件
                          iedit
                          ;; 优化Org-Mode标题样式的插件
                          org-bullets
                          ;; Org番茄工作法
                          org-pomodoro
                          ;; 当打开一个新窗口时,自动移动到该新窗口的插件
                          popwin
                          ;; 在finder中打开当前文件
                          reveal-in-osx-finder
                          ;; 自动匹配括号的插件
                          smartparens
                          ;; 可以显示当前组合键下所有可以使用的全部组合键的选项
                          which-key
                          ;; 快速切换窗口插件
                          window-numbering
                          ;; 代码块补全插件
                          yasnippet
                          ;; 有道词典
                          youdao-dictionary
                          ;; git支持
                          magit
                          ;; lsp-mode
                          lsp-mode
                          lsp-ui
                          lsp-python-ms
                          lsp-java
                          ;; 目录树
                          lsp-treemacs
                          treemacs-evil
                          treemacs-icons-dired
                          treemacs-magit
                          treemacs-projectile
                          helm-lsp
                          ;; 代码检查器
                          flycheck
                          ) "Default packages")
(setq package-selected-packages wangjl/packages)
(defun wangjl/packages-installed-p ()
  (loop for pkg in wangjl/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))
(unless (wangjl/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg wangjl/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;;========================================================================================
;;                                   全局开启语法检查
;;========================================================================================
(require 'flycheck)
(global-flycheck-mode t)

;;========================================================================================
;;                                 buffer进度条彩虹猫插件
;;========================================================================================
(nyan-mode t)

;;========================================================================================
;;                                   快速切换窗口插件
;;========================================================================================
(window-numbering-mode t)

;;========================================================================================
;;                            swiper是一款能够增强搜索功能的插件
;;========================================================================================
(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;========================================================================================
;;           smartparens是一款自动匹配符号的插件,当你输入左边的自动生成右边的
;;========================================================================================
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
(sp-local-pair 'org-mode "'" nil :actions nil)

;;========================================================================================
;;                 当是Mac OS系统的时候,开启exec-path-from-shell这个插件
;;                参考连接:https://github.com/purcell/exec-path-from-shell
;;========================================================================================
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;========================================================================================
;;               当打开一个新窗口时,自动移动到该新窗口的插件,按q可以退出
;;========================================================================================
(require 'popwin)
(popwin-mode t)

;;========================================================================================
;;                            org-pomodoro番茄时间管理法的插件
;;========================================================================================
(require 'org-pomodoro)
(add-hook 'org-mode-hook 'org-bullets-mode)

;;========================================================================================
;;                                     配置YASnippet
;;========================================================================================
;; YASnippet 是一个代码块补全的插件,使用下面的配置文件将其在所有的编程语言的模式中激活
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)  ;; 对于所有编程语言开启

;;========================================================================================
;;            which-key 可以显示当前组合键下所有可以使用的全部组合键的选项
;;========================================================================================
(which-key-mode t)

;;=========================================================================================
;;   如果是MAC OSX 系统,想要在finder中打开当前文件,直接输入M-x reveal-in-osx-finder即可
;;=========================================================================================


;;=========================================================================================
;;                            Github风格的Markdown预览插件
;;=========================================================================================
(add-hook 'markdown-mode-hook #'grip-mode)
(add-hook 'org-mode-hook #'grip-mode)
;; A GitHub username for API authentication
(setq grip-github-user "Wjinlei")
;; A GitHub password or auth token for API auth
(setq grip-github-password "")
