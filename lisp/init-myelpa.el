(provide 'init-myelpa)

;;========================================================================================
;;                             陈斌大神的elpa镜像本地化插件
;;========================================================================================
(add-to-list 'load-path "~/.emacs.d/elpa-mirror")
(require 'elpa-mirror)
(setq package-archives '(("myelpa" . "~/.emacs.d/myelpa/")))
(setq elpamr-default-output-directory "~/.emacs.d/myelpa")
;; 使用方法
;; M-x elpamr-create-mirror-for-installed 初始化本地仓库
;; 注意: 只有已安装的软件包才会打包到本地存储库中
;; 如果要更新本地仓库,再次执行 M-x elpamr-create-mirror-for-installed 即可

