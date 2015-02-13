Репозиторий для хранения конфигов и dot-файлов
---------------------------------------------------------


### Установка
Устанавливаем oh-my-zsh
```
curl -L http://install.ohmyz.sh | sh
```

Клонируем этот репозиторий и подтягиваем сабмодули
```
git clone git@https://github.com.ru/pmyagkov/etc.git ~/etc && cd ~/etc
git submodule update --init
```

Создаем симлинк на .zshrc
```
ln -s ~/etc/zsh/.zshrc ~/.zshrc
```
