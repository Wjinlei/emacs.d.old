(provide 'init-ui)

;;========================================================================================
;;                        GUI模式下才有用,非GUI模式不要开启,会报错
;;========================================================================================
;; 设置标题
(setq frame-title-format '("sEmacs - %b")
      icon-title-format frame-title-format)

;; 设置背景色
;; (set-background-color "black")

;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭侧边滚动栏
(scroll-bar-mode -1)

;; 关闭启动画面
(setq inhibit-splash-screen t)

;; 设置光标的样式为竖线
;;(setq-default cursor-type 'bar)

;; 启动时全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
