(provide 'init-company)

;;========================================================================================
;;                                        company
;;========================================================================================
;; 全局加载company-mode
(global-company-mode t)
;; 让补全列表里的各项左右对齐
(setq company-tooltip-align-annotations t)
;; 补全列表里的项按照使用的频次排序，这样经常使用到的会放在前面，减少按键次数
(setq company-transformers '(company-sort-by-occurrence))
;; 补全时间
(setq company-idle-delay 0.1)
;; 输入一个字符就补全
(setq company-minimum-prefix-length 1)
;; 解决删除一个字符后补全提示就没有了的问题
(add-to-list 'company-begin-commands  'backward-delete-char-untabify)
(add-to-list 'company-begin-commands  'backward-kill-word)

