(provide 'init-custom)

;;===============================================================================================
;;                                        设置字体相关
;;===============================================================================================
;; 设置默认字体
(set-frame-font "Ubuntu Mono-16")
;; (set-frame-font "Consolas-15")

;;===============================================================================================
;;                                        设置变量相关
;;===============================================================================================
 (custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-scratch-message ";; Welcome back Happy hacking!!!")
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-selection ((t (:background "steel blue" :weight normal))))
 '(iedit-occurrence ((t (:inherit region))))
 '(linum ((t (:inherit default :foreground "chocolate" :strike-through nil :underline nil :slant italic :weight normal))))
 '(show-paren-match ((t (:background "green" :foreground "#e74c3c" :weight normal)))))
