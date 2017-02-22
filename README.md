## 使用[prelude](https://github.com/bbatsov/prelude)的配置

*给git加上http和https代理[git加翻墙代理](https://segmentfault.com/q/1010000000118837)*

### 推荐使用spacemacs(直接github搜索安装)
**安装之后直接把.spacemacs里面的代码放到生成的.spacemacs的用户配置中**

Mac安装[Mocaco](https://github.com/todylu/monaco.ttf)字体, 并且在.spcacemacs中设置相应字体

### 按照上面的github上面的安装好之后，在 ```~/.emacs.d/personal``` 中把```custom.el```放进去

#### 需要的package
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
* highlight-indent-guides**记不清了，可以去melpa搜索**
* linum-relative
* dash-at-point
* eslint-fix

## 修改js2-mode和js2-jsx－mode的ternjs补全
