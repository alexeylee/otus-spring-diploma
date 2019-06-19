# Система он-лайн продаж полисов страхования путешественников.
Предварительная функциональность: 
1. Система имеет веб-интерфейс, позволяющий рассчитать стоимость полиса, оформить и  “оплатить” полис, скачать pdf файл с полисом при желании. Продажа полисов клиентам осуществляется без аутентификации. 
2. Система имеет веб-интерфейс менеджера страховой компании. Этот интерфейс требует авторизацию сотрудника, позволяет найти договор(ы) по параметрам поиска, просмотреть отдельный договор, внести и сохранить изменения в договор. Так же имеется возможность просмотреть статистику продаж за период.
3. Предполагается, что система будет разделена на отдельные проекты: бэкенд, предоставляющий REST сервисы и фронт, включающий в себя веб интерфейсы клиента и менеджера. 
4. Данные предполагается хранить в реляционном виде в PostgreSQL. Схема данных будет содержать не менее 10 таблиц.  
5. Бэкенд системы использует в своей работе информацию о курсах валют. Предполагается вынести этот функционал в отдельный сервис. Этот сервис по расписанию будет запрашивать курсы валют у сервиса ЦБ РФ и сохранять их в своей БД. Можно, наверное, оформить этот функционал как микросервис. В качестве БД, для разнообразия, использовать MongoDB.
6. Бэкенд системы онлайн продажи полисов должен предоставлять следующие сервисы: 

| Сервис  | Методы сервиса  |
| ------------- | ------------- |
| сервис справочников   | получения списка стран   |
| калькулятор  | получение списка предлагаемых страховых тарифов   |
|              | окончательный расчёт стоимости полиса  |
| сервис договоров   | создание договора    |
|              | получение pdf файла полиса  |
| сервис менеджера | получение договора по id |
|              | поиск договоров по параметрам   |
|              | изменение и сохранение договора   |
|              | получение статистики продаж за период  |
