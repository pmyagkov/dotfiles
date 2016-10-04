Репозиторий для хранения конфигов и dot-файлов
---------------------------------------------------------

### Установка
Клонируем репозиторий и подтягиваем сабмодули
```
git clone git@github.com:pmyagkov/dotfiles.git ~/Projects/dotfiles
```

Устанавливаем oh-my-zsh
```
make zsh
```

Устанавливаем симлинки на конфиги
```
make links
```

Меняем дефолтный шелл
```
chsh -s /bin/zsh
```

Устанавливаем tmuxinator
```
sudo gem install tmuxinator
```

Делаем скрипты исполняемыми
```
chmod +x ~/Projects/dotfiles/.bin/*
```

Настраиваем git
```
make git
```
