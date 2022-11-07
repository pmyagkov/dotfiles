# make commands not fall when one of them has fallen

links:
	ln -s `pwd`/.zshrc ~/.zshrc
	ln -s `pwd`/.bash_profile ~/.bash_profile
	ln -s `pwd`/.gitconfig ~/.gitconfig
	rm ~/.oh-my-zsh/plugins/git/git.plugin.zsh && ln -s `pwd`/.zsh/git.plugin.zsh ~/.oh-my-zsh/plugins/git/git.plugin.zsh
	ln -s `pwd`/.bin ~/.bin
	ln -s `pwd`/.gitignore_global ~/.gitignore_global
	ln -s `pwd`/.tmuxinator ~/.tmuxinator

rmlinks:
	rm ~/.zshrc
	rm ~/.bash_profile
	rm ~/.gitconfig
	rm ~/.oh-my-zsh/plugins/git/git.plugin.zsh
	rm ~/.gitignore_global

zsh:
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
	rm ~/.zshrc

rmzsh:
	rm -rf ~/.oh-my-zsh

mux:
	sudo gem install tmuxinator

git: python
	pip install git-up
	git config --global user.name "Pasha Myagkov"
	git config --global user.email "p.a.myagkov@yandex.ru"
	git config --global core.excludesfile ~/.gitignore_global

update-shell:
	supdate

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

node: brew
	brew install nvm

python: brew
	brew install pyenv
	pyenv install 2.7.18
	pyenv global 2.7.18

clojure:
	# brew install openjdk
	curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > "$(shell pwd)/.bin/lein"
	chmod a+x "$(shell pwd)/.bin/lein"
	lein

all: python node zsh links git update-shell

.PHONY: links,rmlinks,zsh,rmzsh,git,update-shell
