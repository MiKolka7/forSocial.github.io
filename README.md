## Дизайн 
https://cloud.mail.ru/public/BYvq/uw3CUwZac

## Інструкція по запуску проекту
- встановити https://nodejs.org/ (перевірити чи стоїть галочка біля npm)
- запустити термінал (консоль у win) і перевірити чи все ок, для цього написати команду node -v, потім npm -v (якщо напише версію, а не якусь фігню, то все ок)
- встановити головні пакети, послідовно ввести команди (якщо mac то перед командою писати sudo)
  - npm install -g gulp
  - npm install -g bower
  
- відкрити проект в терміналі
  - cd шлях до проекту (наприклад: cd /Applications/MAMP/htdocs/forSocial.github.io) (шлях можна не писати, достатньо папку перетягнути у вікно терміналу)
  - npm install (будуть завантажені всі пакети, для збірки проекта, доведеться зачекати)
  - bower install (будуть завантажені бібліотеки)

- після всіх дій в терміналі написати команду gulp, відкрити в браузері http://localhost:8080/ (термінал не закривати, після додавання нових файлів, повторити цей пункт)

### Рекомендовані консолі
- для mac iterm https://www.iterm2.com/
- для win https://www.iterm2.com/ (download https://github.com/cmderdev/cmder/releases/tag/v1.2)

### Доступні сторінки
- івенти: http://localhost:8080/#/
- повідомлення: http://localhost:8080/#/messages
- коло знайомств: http://localhost:8080/#/friends
- реєстарція http://localhost:8080/#/registration
- організації http://localhost:8080/#/organizations
