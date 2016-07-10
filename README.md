## 使用[prucell](https://github.com/purcell/emacs.d)的配置

### 按照上面的github上面的安装好之后，在 ```~/.emacs.d/lisp/``` 中把init-local.el放进去

#### 需要的package
* 需要安装ternjs
* neotree
* js2-mode
* tern
* tern-auto-complete
* web-mode

## 我的zsh配置文件
### 配置了一下快捷键，还有iterm中使用emacsGUI的快捷键
* zsh
* oy-my-zsh
* emacs（高版本）：配置中不使用默认的emacs

## 添加golang的自动补全
* 使用gocode补全。
## 修改js2-mode和js2-jsx－mode的ternjs补全

### remove the go-autocomplete.el file to the .emacs.d/list-lisp/. 
* add the commands in .emacs.d/custom.el:
```
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(provide 'custom)
;;; custom.el ends here
```
