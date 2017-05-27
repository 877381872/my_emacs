使用vscode(先安装一个插件[setting sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync), 然后使用GitHub上的key(保存在1password的github项中)同步配置)
Mac激活vim的连按模式，在终端下执行`defaults write -g ApplePressAndHoldEnabled -bool false`

~[emacs配置](https://github.com/zongUMR/-mac-/blob/master/user.el.md)~

## iterm2配置
在个性化配置中的Profiles中的Command的login shell设置Send text at start为`tmux attach -t init || tmux new -s init`
