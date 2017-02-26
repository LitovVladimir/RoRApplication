# RoRApplication

[![N|Solid](http://findicons.com/files/icons/1607/ruby_on_rails/256/ror_folder_256_v2.png)](https://gentle-bayou-79224.herokuapp.com/)

Реализация тестового задания на Ruby on Rails

#### Установка

Для запуска данного веб приложения необходимо скачать папку с проектом.

Перейдите в скаченную папку
```sh
$ сd download/RoRApplication
```
Создайте базу данных для проекта
```sh
$ rake db:create
```
Запустите migrate для создания таблиц и их связей
```sh
$ rake db:migrate
```
Запустите seed для заполнения таблиц тестовыми данными
```sh
$ rake db:seed
```
Запустите rails sever
```sh
$ rails s
```
Перейдите в бразуре по ссылке http://localhost:3000 

Пользуйтесь данным приложеним.
#### P.S. 
Для запуска тестов используйте команду
```sh
$ rails test
```