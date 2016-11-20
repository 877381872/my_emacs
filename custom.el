(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("4f2ede02b3324c2f788f4e0bad77f7ebc1874eff7971d2a2c9b9724a50fb3f65" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "b0ab5c9172ea02fba36b974bbd93bc26e9d26f379c9a29b84903c666a5fde837" "e84d2525390667a81aeca2397dc41d2a3484de8984b51d943bf739b2f7dd8f52" "e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" default)))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(js3-curly-indent-offset 2)
 '(js3-enter-indents-newline t)
 '(js3-expr-indent-offset 2)
 '(js3-highlight-level 3)
 '(js3-indent-dots t)
 '(js3-indent-tabs-mode t)
 '(ohai-personal-taste/paredit nil)
 '(ohai-personal-taste/run-wizard nil)
 '(ohai-personal-taste/splash nil)
 '(ohai-personal-taste/style (quote dark))
 '(ohai-personal-taste/training-wheels nil)
 '(ohai-personal-taste/window-state (quote normal))
 '(ohai/modules
   (quote
    (ohai-appearance ohai-fonts ohai-general ohai-splash ohai-ido ohai-navigation ohai-editing ohai-complete ohai-snippets ohai-codestyle ohai-dired ohai-project ohai-flycheck ohai-git ohai-orgmode ohai-help ohai-elisp)))
 '(package-selected-packages
   (quote
    (dash-at-point whitespace-cleanup-mode find-file-in-repository tide tss typescript-mode xah-css-mode less-css-mode json-mode markdown-mode markdown-mode+ markdown-preview-mode helm-swoop company-lua lua-mode flymake-lua helm-flycheck helm-go-package flymake-go go-autocomplete go-mode go-snippets undo-tree ac-html web-mode auto-complete js2-mode neotree tern tern-auto-complete highlight-parentheses discover-my-major which-key org-cliplink org-bullets org-plus-contrib git-gutter-fringe gist magit flycheck-color-mode-line flycheck projectile dired+ ethan-wspace yasnippet company-try-hard company-emoji company-quickhelp company volatile-highlights shrink-whitespace expand-region multiple-cursors anzu ace-window avy flx-ido ido-vertical-mode smex ido-ubiquitous web nyan-mode hlinum exec-path-from-shell f use-package paradox)))
 '(send-mail-function (quote smtpmail-send-it))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; self-config
(add-hook 'prog-mode-hook 'linum-mode)  ;显示行数
(display-time-mode 1) ; 显示时间
(setq display-time-24hr-format t) ; 24小时格式
(setq display-time-day-and-date t) ; 显示日期
(global-auto-complete-mode t) ;;; globel auto-complete
(global-flycheck-mode t) ;;; global flycheck-mode
(global-set-key [f9] 'neotree-toggle)
(global-set-key (kbd "C-c C-q") 'tern-find-definition)
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
;;; helm-swoop-config 功能强大，函数跳转
;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)
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
;;; typescript-mode
;; If use bundled typescript.el,
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(require 'tss)

;; Key binding
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")

;; Do setting recommemded configuration
(tss-config-default)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; format options
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;;; find-file-responsty
(global-set-key (kbd "C-x f") 'find-file-in-repository)
;;; 设置保存前自动清除多余空格
(global-whitespace-cleanup-mode)
(global-set-key (kbd "C-x C") 'whitespace-cleanup)
;;; set the avy-goto-line
(global-set-key (kbd "C-l") 'avy-goto-line)
;;; config the dash in emacs
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;;; golang程序保存前自动format
(add-hook 'before-save-hook #'gofmt-before-save)
;;; 跳转定义之后再跳转回文件
(global-set-key (kbd "C-c C-b") 'pop-tag-mark)

;;; 直接在emacs运行当前文件，比如go程序，js程序

(defun xah-run-current-file ()
  "Execute the current file.
For example, if the current buffer is the file x.py, then it'll call 「python x.py」 in a shell.
The file can be Emacs Lisp, PHP, Perl, Python, Ruby, JavaScript, Bash, Ocaml, Visual Basic, TeX, Java, Clojure.
File suffix is used to determine what program to run.

If the file is modified or not saved, save it automatically before run.

URL `http://ergoemacs.org/emacs/elisp_run_current_file.html'
version 2016-01-28"
  (interactive)
  (let (
         (-suffix-map
          ;; (‹extension› . ‹shell program name›)
          `(
            ("php" . "php")
            ("pl" . "perl")
            ("py" . "python")
            ("rb" . "ruby")
            ("go" . "go run")
            ("js" . "node") ; node.js
            ("sh" . "bash")
            ("rkt" . "racket")
            ("ml" . "ocaml")
            ("vbs" . "cscript")
            ("tex" . "pdflatex")
            ("latex" . "pdflatex")
            ;; ("pov" . "/usr/local/bin/povray +R2 +A0.1 +J1.2 +Am2 +Q9 +H480 +W640")
            ))

         -fname
         -fSuffix
         -prog-name
         -cmd-str)

    (when (null (buffer-file-name)) (save-buffer))
    (when (buffer-modified-p) (save-buffer))

    (setq -fname (buffer-file-name))
    (setq -fSuffix (file-name-extension -fname))
    (setq -prog-name (cdr (assoc -fSuffix -suffix-map)))
    (setq -cmd-str (concat -prog-name " \""   -fname "\""))

    (cond
     ((string-equal -fSuffix "el") (load -fname))
     ((string-equal -fSuffix "java")
      (progn
        (shell-command -cmd-str "*xah-run-current-file output*" )
        (shell-command
         (format "java %s" (file-name-sans-extension (file-name-nondirectory -fname))))))
     (t (if -prog-name
            (progn
              (message "Running…")
              (shell-command -cmd-str "*xah-run-current-file output*" ))
          (message "No recognized program file suffix for this file."))))))
(global-set-key (kbd "C-c C-r") 'xah-run-current-file)
(provide 'custom)
;;; custom.el ends here
