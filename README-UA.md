![Project-logo](https://github.com/isachenko-andrii/Marketing-and-Conversion-Analytics-Dashboard/blob/main/Project-logo.png)
#### [EN](https://github.com/isachenko-andrii/Marketing-and-Conversion-Analytics-Dashboard/blob/main/README.md) | [UA](https://github.com/isachenko-andrii/Marketing-and-Conversion-Analytics-Dashboard/blob/main/README-UA.md) Цей матеріал також доступний англійською мовою.
---  
<div align="center">  
    
## Панель керування маркетинговою та конверсійною аналітикою <br>(Tableau Public)   
  
</div>  
  
## Опис проекту  
    
Цей проєкт присвячений аналізу поведінки користувачів інтернет-магазину на основі реальних (знеособлених) даних Google Analytics 4 (GA4).  
**Мета проєкту** — дослідити шлях клієнта від першого візиту до здійснення покупки, візуалізувати воронку конверсії та визначити ключові фактори, які впливають на падіння конверсії на кожному з етапів.  

## Використаний технологічний стек  
  
*   **База даних & SQL**: Google BigQuery (робота з сирими даними `bigquery-public-data.ga4_obfuscated_sample_ecommerce`)  
*   **BI-інструмент**: Tableau Public (побудова інтерактивного дашборду)  
*   **Очищення та трансформація даних**: Створення плоских агрегованих таблиць на рівні сесій за допомогою складних CTE та віконних функцій SQL.  
  
---  
   
## Структура проекту  
  
**Marketing and Conversion Analytics Dashboard**/ — каталог проекту  
├── data/ — дані проєкту  
├── sql/ — код запиту за BigQuery  
├── doc/ — технічне завдання  
├── img/ — збережені графіки та дашборди  
├── twbx/ — файли проекту  
├── LICENSE — MIT Ліцензія  
├── project-logo.png — обкладинка проекту  
├── README-UA.md — опис проекту українською мовою   
└── README.md — опис проекту англійською мовою  
  
## Як переглянути проєкт  
  
1. Завантажте файл проєкту `Marketing and Conversion Analytics Dashboard.twbx` з цього репозиторію.  
2. Відкрийте його за допомогою безкоштовного [Tableau Reader](https://www.tableau.com/products/reader) або Tableau Desktop.  
3. Проєкт також опубліковано на Tableau Public: [Marketing and Conversion Analytics Dashboard(https://lnk.ua/SEwCSEvTA)  
  
## Контакти  
    
**Автор:** [Andrii Isachenko](https://isachenko-andrii.github.io)   
**Посада:** Junior Data Analyst  
**LinkedIn:** [Andrii Isachenko](https://www.linkedin.com/in/isachenko-andrii/)  
**E-mail:** andrii.isachenko@gmail.com   
  
## Подяки    
  
- Дякую курсу [Аналітик даних/GoIT](https://goit.global/ua/courses/data-analytics/), частиною якого була робота над цим проектом.  
  
---  
  
**Статус проекту:** Завершено.  
    
**Ліцензія:** MIT Ліцензія.  
  
