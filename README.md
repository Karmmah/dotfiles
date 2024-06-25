# dotfiles

## setup

### vim, tmux

- link vimrc and tmux conf to home directory (run command in home directory)
```
ln -s dotfiles/.vimrc ~/.vimrc
ln -s dotfiles/.tmux.conf ~/.tmux.conf
```

### Firefox

- set up firefox:
	- search "about:config" and set "toolkit.legacyUserProfileCustomizations.stylesheets" to true
	- 
- link firefox css file to remove tabs
	- navigate to /home/<user>/.var/app/org.mozilla.firefox/.mozilla/firefox/<release>.<profile>/chrome/ (make folder chrome if it doesn't exist)

```
ln ~/dotfiles/userChrome.css .
```
