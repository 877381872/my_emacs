;;; =========================== ;;; Comentary: ;;; ============================

;;; =========== ;;; package --- Summary ;;; ============

;;; self-config
(add-hook 'prog-mode-hook 'linum-mode)  ;显示行数
(display-time-mode 1) ; 显示时间
(setq display-time-24hr-format t) ; 24小时格式
(setq display-time-day-and-date t) ; 显示日期
(global-auto-complete-mode t)
;;; neotree配置
(add-to-list 'load-path "/directory/containing/neotree/")
(require 'neotree)
(global-set-key [f9] 'neotree-toggle)
;;; emacs config
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))
;;; js config
(add-to-list 'auto-mode-alist '("\\.jsx?\\'\\'" . js2-mode))

(setq-default
 ;; js2-mode
 js2-basic-offset 2
 ;; web-mode
 css-indent-offset 2
 web-mode-markup-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-attr-indent-offset 4
 web-mode-enable-current-element-highlight t
 web-mode-enable-current-column-highlight t
 web-mode-enable-css-colorization t
 web-mode-enable-auto-pairing t
 web-mode-enable-block-face t)

(provide 'init-local)
