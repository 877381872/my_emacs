;;; self-config
(add-hook 'prog-mode-hook 'linum-mode)  ;显示行数
(display-time-mode 1) ; 显示时间
(setq display-time-24hr-format t) ; 24小时格式
(setq display-time-day-and-date t) ; 显示日期
(global-auto-complete-mode t) ;;; globel auto-complete
(global-set-key [f9] 'neotree-toggle(global-set-key (kbd "C-c C-q") 'tern-find-definition) ;;; 设定js跳转跳转快捷键
;;; emacs config
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-js2x-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))
;;; js config
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
;;; undo-tree
(global-undo-tree-mode)
;;; go-config
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
;;; 第三方插件
(add-to-list 'load-path (concat dotfiles-dir "selfPlugins"))
(provide 'custom)
;;; custom.el ends here
