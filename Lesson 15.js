// MongoDB 
// Работа с терминалом

// Enter - Запуск кода
// Shift+Enter - Перенос строки

// Создание бд/Активация бд
// use db_name

use GT081024

// Создание коллекции
// db.createCollection('collection_name')

db.createCollection('users')

// Создание и заполнение коллекции документами

// Добавление одного документа
// db.collection_name.insertOne({})

// Добавление нескольких документов(массив объектов)
// db.collection_name.insertMany([{}, {}, {}, ...])

// collection_name - название новой коллекции или существующей

// Пример документа
// {
//     ключ: значение, 
//     ключ: значение, 
//     ...
// }

// Очистить терминал
cls


db.users.insertOne({
		first_name: 'John',
		last_name: 'Smith',
		age: 20,
		email: 'jsmith@gmail.com'
})

db.users.insertOne({
		first_name: 'Bob',
		last_name: 'Brown',
		age: 25,
		email: 'bbrown@gmail.com'
})

// Стрелки UP и Down - переключиться между командами 


// Создать бд test_emp
use test_emp

// Создать коллекцию employees
// db.createCollection('employees')

// Заполнить документом
    // first_name - Jake
    // last_name - King
    // gender - m
    // age - 19

db.employees.insertOne({
    first_name: 'Jake',
    last_name: 'King',
    gender: 'm',
    age: 19
})    

// Показать все базы данных 
show databases

// Показать коллекции, которые есть в активной базе
show collections

db.users.insertMany([
    {
        first_name: 'Ben',
        last_name: 'Jameson',
        age: 30,
        email: 'bjameson@gmail.com'
    },
    {
        first_name: 'Jane',
        last_name: 'Brown',
        age: 26,
        email: 'jbrown@gmail.com'
    },
    {
        first_name: 'Derek',
        last_name: 'Thomson',
        age: 45,
        email: 'dthomson@gmail.com'
    }
])


// Выборка
// Вывести все документы 

// mysql
// select * from users;

db.users.find()

// Переключится в базу test_emp
// Заполнить коллекцию employees документами

    // first_name - Lara
    // last_name - Hardy
    // gender - f
    // age - 20

    // first_name - Max
    // last_name - Thomson
    // gender - m
    // age - 20

    // first_name - Lucas
    // last_name - Jameson
    // gender - m
    // age - 37

use test_emp

db.employees.insertMany([
    {
        first_name: 'Lara',
        last_name: 'Hardy',
        gender: 'f',
        age: 20
    },
    {
        first_name: 'Max',
        last_name: 'Thomson',
        gender: 'm',
        age: 20
    },
    {
        first_name: 'Lucas',
        last_name: 'Jameson',
        gender: 'm',
        age: 37
    }
])

db.employees.find()


// Удаление коллекции
// db.collection_name.drop()

db.employees.drop()

// Удаление активной базы данных
db.dropDatabase()


use GT081024


// Создать коллекцию fruits и заполнить документами со следующими свойствами: 
// title, price, count. Используйте следующие данные:

//  Apple 280 4
//  Lemon 300 8
//  Lime 500 3
//  Orange 200 8

db.fruits.insertMany([
    {
        title: 'Apple',
        price: 280,
        count: 4
    },
    {
        title: 'Lemon',
        price: 300,
        count: 8
    },
    {
        title: 'Lime',
        price: 500,
        count: 3
    },
    {
        title: 'Orange',
        price: 200,
        count: 8
    }
])

db.fruits.find()

// Выборка с условием
// select * from table
// where Условие;

// db.collection_name.find({Условие})

// Операторы сравнения

// $eq - equal - равно // {key: {$eq: value}}
// : - equal - равно // {key: value}
// $ne - not equal - не равно
// $gt - grater than - больше
// $gte - grater then equal - больше равно
// $lt - less then - меньше
// $lte - less then equal - меньше равно
// $in - значение соответствует одному из значений в массиве/списке 

// {key: {$op: value}}
// $op - операторы сравнения


// Из коллекции fruits вывести документы, где название Apple.
db.fruits.find({title: {$eq: 'Apple'}})
db.fruits.find({title: 'Apple'})

// Из коллекции fruits вывести документы, где стоимость 200.
db.fruits.find({price: 200})
db.fruits.find({price: {$eq: 200}})

// Из коллекции fruits вывести документы, где стоимость не 200.
db.fruits.find({price: {$ne: 200}})

// Из коллекции fruits вывести документы, где кол/во больше 5.
db.fruits.find({count: {$gt: 5}})

// Из коллекции fruits вывести документы, где кол/во больше равно 8.
db.fruits.find({count: {$gte: 8}})

// Из коллекции fruits вывести документы, где стоимость меньше 500.
db.fruits.find({price: {$lt: 500}})

// Из коллекции fruits вывести документы, где кол/во меньше равно 4.
db.fruits.find({count: {$lte: 4}})

// Из коллекции fruits вывести документы, где название Apple, Lime или Kiwi.
db.fruits.find({title: {$in: ['Apple', 'Lime', 'Kiwi']}})

// Из коллекции fruits вывести документы, где название не 'Lemon'.
db.fruits.find({title: {$ne: 'Lemon'}})

// Из коллекции fruits вывести документы, где кол/во или 3, или 8.
db.fruits.find({count: {$in: [3, 8]}})

// Пример документа
{
    id: 1,
    first_name: 'Ben',
    last_name: 'Jameson',
    skills: ['Teamworking', 'Creativity', 'Leadership'],
    date_of_hire: '28.05.2014',
    address: {
        country: 'Armenia',
        city: 'Yerevan',
        street: 'Stepanyan',
        building: 5
    }
}
