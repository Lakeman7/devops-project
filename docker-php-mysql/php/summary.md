I built a local web application using Docker, PHP, MySQL, and Apache.
I created a project folder with separate folders for PHP and MySQL.
I used Dockerfiles to build two images: one for the MySQL database and one for the PHP–Apache web server.
The MySQL container creates a database and a users table and adds a test user.
The PHP app connects to the database and checks the login details.
I tested the application in the browser at http://localhost:8080/login.php
Using the username admin and password 12345, and the login worked successfully.
