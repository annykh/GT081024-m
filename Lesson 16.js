//  https://github.com/annykh/GT081024-m/blob/main/emp.js

// use GT081024

db.emp.insertMany([
    {
      _id: 1,
      firstname: 'Inga',
      lastname: 'Petrova',
      age: 27,
      position: 'Barista',
      salary: 1500,
      skills: ['preparing drinks', 'cleaning equipment']
    },
    {
      _id: 2,
      firstname: 'Boris',
      lastname: 'Orlov',
      age: 36,
      position: 'Server',
      salary: 2400,
      skills: ['taking orders', 'suggesting meals', 'taking payments']
    },
    {
      _id: 3,
      firstname: 'Ivan',
      lastname: 'Demidov',
      age: 32,
      position: 'Chef',
      salary: 3200,
      skills: ['preparing food', 'baking bread']
    },
    {
      _id: 4,
      firstname: 'Marina',
      lastname: 'Sidorov',
      age: 22,
      position: 'Hostess',
      salary: 1700,
      skills: ['greeting guests', 'seating guests', 'answering phone calls']
    },
    {
      _id: 5,
      firstname: 'Olga',
      lastname: 'Ivanova',
      age: 43,
      position: 'Sommelier',
      salary: 2500,
      skills: ['curating a wine list', 'creating wine pairings']
    }
  ])

//   Вывести все документы
db.emp.find()

// Вывести сотрудников где position 'Chef'
db.emp.find({position: 'Chef'})

// Найти сотрудников, чьи зарлаты больше 2000
db.emp.find({salary: {$gt: 2000}})

// Вывести сотрудников с именами Ivan, Olga, Boris
db.emp.find({firstname: {$in: ['Ivan', 'Olga', 'Boris']}})


// Логические операторы

// $and : возвращает документы, в которых выполняются оба условия
// $or : возвращает документы, в которых выполняется хотя бы одно условие
// $nor : возвращает документы, в которых оба условия не выполняются

// $not : возвращает документы, в которых условие не выполняется

// db.collection_name.find({
//     $лог_оп: [
//         {Условие1}, 
//         {Условие2}
//     ]
// })

// $лог_оп - $and, $or, $nor


// Вывести сотрудников, которым либо больше 35, либо меньше 25.

db.emp.find({
        $or: [
            {age: {$gt: 35}},
            {age: {$lt: 25}}
        ]
})

// Вывести сотрудников, которым меньше 30 и больше 20.
db.emp.find({
    $and: [
        {age: {$gt: 20}},
        {age: {$lt: 30}}
    ]
})

db.emp.find({age: {$gt: 20, $lt: 30}})

// Вывести сотрудников, которым больше 20 и зарплата меньше 5000.
db.emp.find({
    $and: [
        {age: {$gt: 20}},
        {salary: {$lt: 5000}}
    ]
})

db.emp.find({
    age: {$gt: 20}, 
    salary: {$lt: 5000}
})

// Найти сотрудников, чьи зарплаты находятся в диапазоне от 2000(не вкл.) до 3000(вкл.).
db.emp.find({salary: {$gt: 2000, $lte: 3000}})

// Найти сотрудников, которым больше 30 либо должность Hostess.
db.emp.find({
    $or: [
        {age: {$gt: 30}},
        {position: 'Hostess'}
    ]
})

// Вывести сотрудников, которые не зарабатывают больше 3000 и position не Chef.
db.emp.find({
    $nor: [
        {salary: {$gt: 3000}},
        {position: 'Chef'}
    ]
})

db.emp.find({salary: {$lte: 3000}, position: {$ne: 'Chef'}})

// Найти сотрудников, которым не меньше 25.
db.emp.find({age: {$not: {$lt: 25}}})

db.emp.find({age: {$gte: 25}})

// Найти всех работников, чья зарплата меньше 3000 и имя либо Ivan либо Olga.
db.emp.find({
    salary: {$lt: 3000},
    firstname: {$in: ['Olga', 'Ivan']}
})


// Работа с вложенным масивом 

// Вывести сотрудников, у которых в навыках есть baking bread.
db.emp.find({skills: 'baking bread'})

// Вывести сотрудников, у которых навык равен baking bread (только baking bread)
db.emp.find({skills: ['baking bread']})

// Вывести сотрудников, у которых навык равен ['preparing food', 'baking bread'].
db.emp.find({skills: ['preparing food', 'baking bread']})

// Вывести сотрудников, у которых в навыках есть taking orders, taking payments или seating guests
db.emp.find({skills: {$in: ['taking orders', 'taking payments', 'seating guests']}})

db.emp.find({
    $or: [
        {skills: 'taking orders'},
        {skills: 'taking payments'},
        {skills: 'seating guests'}
    ]
})

// Вывести сотрудников, у которых навык равен либо ['curating a wine list', 'creating wine pairings'], либо ['taking orders', 'suggesting meals', 'taking payments']
db.emp.find({skills: {$in: [
    ['curating a wine list', 'creating wine pairings'], 
    ['taking orders', 'suggesting meals', 'taking payments']
]}})

db.emp.find({
    $or: [
        {skills: ['curating a wine list', 'creating wine pairings']},
        {skills: ['taking orders', 'suggesting meals', 'taking payments']}
    ]
})

// Вывести сотрудников, у которых в навыках нет baking bread.
db.emp.find({skills: {$ne: 'baking bread'}})

// Вывести сотрудников, у которых навык не равен ['curating a wine list', 'creating wine pairings']
db.emp.find({skills: {$ne: ['curating a wine list', 'creating wine pairings']}})


// 'array.index'

// вывести сотрудников, у которых первый навык 'taking orders'.
db.emp.find({'skills.0': 'taking orders'})

// вывести сотрудников, у которых второй навык seating guests
db.emp.find({'skills.1': 'seating guests'})


// Работа с вложенными объектами

db.emp.insertOne({
      _id: 6,
      firstname: 'Yulya',
      lastname: 'Ivanova',
      age: 43,
      position: 'Sommelier',
      salary: 2500,
      skills: ['curating a wine list', 'creating wine pairings'],
      company_adr: {
        country: 'USA',
        city: 'New York',
        street: '5th avenue'
      }
})

'object.key'

// Вывести сотрудников, которые работают в USA.
db.emp.find({'company_adr.country': 'USA'})

// Вывести сотрудников, которые не работают в городе New York.
db.emp.find({'company_adr.city': {$ne: 'New York'}})


// Проекция - вывод конкретных полей/свойств

// mysql
// select column_name1, column_name2
// from table1;

// db.collection_name.find({Условие}, {Проекция})

// Проекция - {key1: 1, key2: 0}
// 1(true) - поле, которое нужно вывести
// 0(false) - поле, которое не нужно вывести

// Вывести только имена и фамилии сотрудников (без _id), которым больше 30.
db.emp.find({age: {$gt: 30}}, {firstname: 1, lastname: 1, _id: 0})

// Вывести все поля, кроме _id и salary коллекции emp.
db.emp.find({}, {_id: 0, salary: 0})

// Вывести имена, фамилии, возраст всех сотрудников.
db.emp.find({}, {firstname: 1, lastname: 1, age: 1, _id: 0})

//  Найти всех работников, чья зарплата больше 2000 и возраст больше 20. Вывести только имя, фамилию и зарплату, без _id.
db.emp.find({salary: {$gt: 2000}, age: {$gt: 20}}, {firstname: 1, lastname: 1, salary: 1, _id: 0})

// Найти всех работников, чья зарплата меньше 3000 или возраст больше 40. Вывести все поля, кроме зарплаты и _id.
db.emp.find({
    $or: [
        {salary: {$lt: 3000}},
        {age: {$gt: 40}}
    ]
}, {salary: 0, _id: 0})


// Пагинация массива
// Оператор $slice

// db.collection_name.find({Условие}, {Прокеция/Пагинация массива})

// {array_name: {$slice: N}} // N - кол/во элементов, которое нужно вывести

// {array_name: {$slice: [M, N]}} // M - кол/во элементов, которое нужно пропустить,  N - кол/во элементов, которое нужно вывести

// Найти сотрудников, которым больше 20. Вывести их имена, фамилии и первые два навыка.
db.emp.find({age: {$gt: 20}}, {firstname: 1, lastname: 1, _id: 0, skills: {$slice: 2}})

// Найти всех сотрудников. Вывести их имена, фамилии и последний навык из skills.
db.emp.find({}, {firstname: 1, lastname: 1, _id: 0, skills: {$slice: -1}})

// Вывести сотрудников, которые зарабатывают больше 3000 оставляя в навыках только один элемент пропуская первый.
db.emp.find({salary: {$gt: 3000}}, {skills: {$slice: [1, 1]}})

// Вывести всех сотрудников оставляя в навыках только два элемента пропуская первый
db.emp.find({}, {skills: {$slice: [1, 2]}})
