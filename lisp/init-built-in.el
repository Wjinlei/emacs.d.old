(provide 'init-built-in)

;; 让Emacs到达顶部和底部时不要发出声音
(setq ring-bell-function 'ignore)

;; 在mode-line显示文件大小
(size-indication-mode t)

;; 开启行号显示
(global-linum-mode t)
(setq linum-format "%d ")
;; (set-face-foreground 'linum "#CD661D")

;; 高亮显示当前行
(global-hl-line-mode t)
(set-face-background 'hl-line "#BEBEBE")
(set-face-foreground 'hl-line "#000000")

;; 高亮显示选中的区域
(transient-mark-mode t)
(set-face-background 'region "#8DEEEE")
(set-face-foreground 'region "#000000")

;; 禁止生成~备份文件
(setq make-backup-files nil)

;; 禁止auto-save
(setq auto-save-default nil)

;; 加载recentf minor mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; 选中时修改整个单词,而不是尾部添加
(delete-selection-mode t)

;; 当文件被外部修改后,自动加载
(global-auto-revert-mode t)

;; 不要没完没了的询问我yes或no,直接 y 或 n
(fset 'yes-or-no-p 'y-or-n-p)

;; 删除目录的时候递归删除里面的文件
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 保存上次光标所在位置
(require 'saveplace)
(setq-default save-place t)
(save-place-mode 1)

;; 设置TAB的默认宽度
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil);

;; 在状态条显示当前光标在哪个函数体内部
;; (which-function-mode t)

;; 在 mode line 上显示时间,格式: 年-月-日 时:分
(setq display-time-format "%Y-%m-%d %H:%M")
(setq display-time-default-load-average nil)
(display-time-mode 1)

;;============================================================================================
;;                                         高亮匹配括号
;;============================================================================================
(show-paren-mode t)
;; 当光标在括号内的时候,显示两边的括号
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
        (t (save-excursion
             (ignore-errors (backward-up-list))
             ad-do-it)))
  )

;;============================================================================================
;;                                       格式化整个buffer
;;============================================================================================
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

;;============================================================================================
;;                                           别名表
;;============================================================================================
;; (setq-default abbrev-mode t)
;; 保存时将缩写配置写入缩写文件
;; (setq save-abbrevs 'silent)
;; 定义缩写文件的位置
;; (setq abbrev-file-name "~/.emacs.d/abbrev_defs") ;; 设置缩写文件存放地址
;; 设置别名,当输入wjl按空格,自动替换成wangjl,输入wjl/时自动替换为wangjl/
;; (define-abbrev-table 'global-abbrev-table '(
;;                                            ("wjl" "Wangjl")
;;                                            ))

;;============================================================================================
;;                                        org-mode配置
;;============================================================================================
;; 各级标题大小
(set-face-attribute 'org-level-1 nil :height 1.1)
(set-face-attribute 'org-level-2 nil :height 1.1)
(set-face-attribute 'org-level-3 nil :height 1.1)
(set-face-attribute 'org-level-4 nil :height 1.1)
(set-face-attribute 'org-level-5 nil :height 1.1)
(set-face-attribute 'org-level-6 nil :height 1.1)
(set-face-attribute 'org-level-7 nil :height 1.1)
(set-face-attribute 'org-level-8 nil :height 1.1)

;;============================================================================================
;;                                    显示空格及其颜色配置
;;====----====================================================================================
;; 显示空格
(require 'whitespace)
(global-whitespace-mode t)

;; 粉色代表超过80个字符的部分,由lines-tail 参数控制
;; space-mark 参数表示显示空格
;; newline-mark 表示显示末尾的$符号
;; lines-tail 表示显示超过80个字符后的部分,用粉色高亮
;; trailing 表示高亮显示行尾的空格
;; spaces 下面要控制whitespace-space就必须包含这个参数
;; newline 下面要控制whitespace-newline就必须包含这个参数

(setq whitespace-style
      '(face
        ;; trailing blanks
        trailing
        ;; empty lines at beginning and/or end of buffer
        ;; empty
        ;; line is longer `whitespace-line-column'
        lines-tail
        ;; tab or space at the beginning of the line according to
        ;; `indent-tabs-mode'
        indentation
        ;; show tab as » (see `whitespace-display-mappings')
        tab-mark
        ;; space-mark
        spaces
        ))

;; 设置空格字符的颜色
;; (set-face-attribute 'whitespace-space nil :background "black")
;; (set-face-attribute 'whitespace-space nil :foreground "dim gray")

;;自动清除行尾空格
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'whitespace-cleanup)

;;=========================================================================================
;;               Dired Mode 配置,Dired Mode是一个文件管理的Mode,非常方便
;;=========================================================================================
;; C-x d 打开Dired mode
;; + 创建目录
;; g 刷新目录
;; C 拷贝
;; D 删除
;; R 重命名
;; d 标记删除
;; u 取消标记
;; x 执行所有的标记
;; shift + 6 返回上一级目录
;;-----------------------------------------------------------------------------------------
;; 每一次你进入一个回车进入一个新的目录中是,一个新的缓冲区就会被建立.
;; 这使得我们的缓冲区列表中充满了大量没有实际意义的记录.
;; 我们可以使用下面的代码,让 Emacs 重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区.
(put 'dired-find-alternate-file 'disabled nil)
;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载 (使用延迟加载可以使编辑器加载速度有所提升)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; dired-x 可以让我们直接打开当前目录的Dired Mode,快捷键是C-x C-j
(require 'dired-x)

;; 当打开多个Dired Mode窗口时,复制文件时可以很方便的复制到另一个窗口的Dired Mode中
(setq dired-dwim-target t)

;; 删除在不同系统中的换行符
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
