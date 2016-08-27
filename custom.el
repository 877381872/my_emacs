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
;;; org-mode config
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;;; css 显示颜色
(defun xah-syntax-color-hex ()
  "Syntax color text of the form 「#ff1100」 and 「#abc」 in current buffer.
URL `http://ergoemacs.org/emacs/emacs_CSS_colors.html'
Version 2016-07-04"
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[ABCDEFabcdef[:digit:]]\\{3\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background
                      (let* (
                       (ms (match-string-no-properties 0))
                       (r (substring ms 1 2))
                       (g (substring ms 2 3))
                       (b (substring ms 3 4)))
                  (concat "#" r r g g b b))))))
     ("#[ABCDEFabcdef[:digit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer))
(add-hook 'css-mode-hook 'xah-syntax-color-hex)
(add-hook 'less-mode-hook 'xah-syntax-color-hex)
;;; find-file-responsty
(global-set-key (kbd "C-x f") 'find-file-in-repository)
;;; 设置保存前自动清除多余空格
(global-whitespace-cleanup-mode t)
(provide 'custom)
;;; custom.el ends here
