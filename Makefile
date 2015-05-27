links:
	ln -s `pwd`/.zshrc ~/.zshrc
	ln -s `pwd`/.bash_profile ~/.bash_profile
	ln -s `pwd`/.zsh/viking.zsh-theme ~/.oh-my-zsh/themes/viking.zsh-theme
	rm ~/.oh-my-zsh/plugins/git/git.plugin.zsh && ln -s `pwd`/.zsh/git.plugin.zsh ~/.oh-my-zsh/plugins/git/git.plugin.zsh
	ln -s `pwd`/.bin ~/.bin

rmlinks:
	rm ~/.zshrc
	rm ~/.bash_profile
	rm ~/.oh-my-zsh/themes/viking.zsh-theme
	rm ~/.oh-my-zsh/plugins/git/git.plugin.zsh

zsh:
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	rm ~/.zshrc

rmzsh:
	rm -rf ~/.oh-my-zsh

.PHONY: links,rmlinks,zsh,rmzsh