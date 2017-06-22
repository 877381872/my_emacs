```
;;; package --- Summary
;;; Commentary

;;; display setting
(display-time-mode 1) ; 显示时间
(setq display-time-24hr-format t) ; 24小时格式
(setq display-time-day-and-date t) ; 显示日期
(global-auto-complete-mode t) ;;; globel auto-complete
(global-flycheck-mode t) ;;; global flycheck-mode
;;; undo-tree
(global-undo-tree-mode)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)
;;; icons自定义
(setq neo-theme 'icons)
;; Setting English Font
(set-face-attribute
 'default nil :font "Operator Mono 13")
(load-theme 'solarize-darak t)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;; 快捷键设置
(global-set-key [f9] 'neotree-toggle)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-c C-;") 'avy-goto-char)
(global-set-key (kbd "C-'") 'dash-at-point-with-docset)
(global-set-key (kbd "C-c C-q") 'tern-find-definition)
;;; helm-swoop-config 功能强大，函数跳转
;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
(global-set-key [f6] 'xah-run-current-file)
;;; 设置保存前自动清除多余空格
(global-whitespace-cleanup-mode)
(add-hook 'before-save-hook 'whitespace-cleanup)
(global-set-key (kbd "C-x C") 'whitespace-cleanup)
()
;;; set the avy-goto-line
(global-set-key (kbd "C-c C-l") 'avy-goto-line)

;;; web config
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
(add-to-list 'auto-mode-alist '("\\.vue?\\'" . vue-html-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'css-mode-hook 'xah-css-mode)
(add-hook 'less-mode-hook 'xah-css-mode)
(add-hook 'scss-mode-hook 'xah-css-mode)
(setq-default
 ;; js2-mode
 js2-basic-offset 2
 ;; web-mode
 css-indent-offset 2
 scss-indent-offset 2
 web-mode-markup-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-attr-indent-offset 2)
(with-eval-after-load 'web-mode
 (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
 (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
 (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

;;; org-mode config
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(eval-after-load "org"
'(require 'ox-md nil t))

;;; config the dash in emacs
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;;; goalng setting
(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)
;;; 跳转定义之后再跳转回文件
(global-set-key (kbd "C-c C-b") 'pop-tag-mark)

;;; typescript配置
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;;; format options
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;;; (add-hook 'js2-mode-hook #'setup-tide-mode)
;;; (add-hook 'web-mode-hook
          ;;; (lambda ()
          ;;;  (when (string-equal "jsx" (file-name-extension buffer-file-name))
              ;;; (setup-tide-mode))))
;;; -------------------------------

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
(provide 'user)
```
---
1. 使用[ohai-emacs](https://github.com/bodil/ohai-emacs)
2. 然后把此文件中的代码部分保存为文件`user.el`放在`.emacs.d`文件夹中
---
## 需要安装的package
* 需要安装ternjs
* neotree
* js2-mode
* js2-jsx-mode
* tern
* tern-auto-complete
* undo-tree
* go-mode
* flymake-go
* go-auto-complete
* web-mode
* helm-go-package
* xah-css-mode
* go-snippets
* whitespace-clearup-mode
* linum-relative
* dash-at-point
* all-the-icons
* helm-swoop
* tide
* solarize-theme
* rainbow-delimiters

---
备注
1. 要安装aspell(用brew就可以)
2. [all-file-icons](https://github.com/domtronn/all-the-icons.el)需要安装fonts里面的所有字体
3. Mac安装[Operator Mono]字体, **字体文件在百度网盘的`/全部文件/我的文档`**，解压之后安装light的字体就可以,并且在.spcacemacs中设置相应字体
