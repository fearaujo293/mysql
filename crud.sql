create database biblioteca;

spring.datasource.url=jdbc:mysql://localhost:3306/biblioteca?useTimezone=true&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=sua_senha

spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect;