Репозиторий для хранения конфигов и dot-файлов
---------------------------------------------------------


### Установка
Устанавливаем oh-my-zsh
```
curl -L http://install.ohmyz.sh | sh
```

Клонируем этот репозиторий и подтягиваем сабмодули
```
git clone git@github.com:pmyagkov/etc.git ~/etc && cd ~/etc
git submodule update --init
```

Создаем симлинк на .zshrc, тему и плагины
```
ln -s ~/etc/zsh/.zshrc ~/.zshrc
ln -s ~/etc/zsh/viking.zsh-theme ~/.oh-my-zsh/themes/viking.zsh-theme
rm ~/.oh-my-zsh/plugins/git/git.plugin.zsh && ln -s ~/etc/zsh/git.plugin.zsh ~/.oh-my-zsh/plugins/git/git.plugin.zsh
```

Меняем дефольный шел
```
chsh -s /bin/zsh
```


