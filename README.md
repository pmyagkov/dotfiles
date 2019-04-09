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

Устанавливаем tmuxinator
```
make mux
```

Устанавливаем симлинки на конфиги
```
make links
```

Меняем дефолтный шелл
```
chsh -s /bin/zsh
```

Делаем скрипты исполняемыми
```
chmod +x ~/Projects/dotfiles/.bin/*
```

Настраиваем git
```
make git
```
