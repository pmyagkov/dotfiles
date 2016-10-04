links:
	ln -s `pwd`/.zshrc ~/.zshrc
	ln -s `pwd`/.bash_profile ~/.bash_profile
	ln -s `pwd`/.gitconfig ~/.gitconfig
	rm ~/.oh-my-zsh/plugins/git/git.plugin.zsh && ln -s `pwd`/.zsh/git.plugin.zsh ~/.oh-my-zsh/plugins/git/git.plugin.zsh
	ln -s `pwd`/.bin ~/.bin
	ln -s `pwd`/.gitignore_global ~/.gitignore_global

rmlinks:
	rm ~/.zshrc
	rm ~/.bash_profile
	rm ~/.gitconfig
	rm ~/.oh-my-zsh/themes/viking.zsh-theme
	rm ~/.oh-my-zsh/plugins/git/git.plugin.zsh
	rm ~/.gitignore_global

zsh:
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	rm ~/.zshrc

rmzsh:
	rm -rf ~/.oh-my-zsh

git:
	git config --global core.excludesfile ~/.gitignore_global

update-shell:
	supdate

all: zsh links git update-shell

.PHONY: links,rmlinks,zsh,rmzsh,git,update-shell
