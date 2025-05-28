//  Работа с объектами и массивами

// use GT081024

// Коллекция restaurants
// https://github.com/annykh/GT081024-m/blob/main/restaurants.txt

db.restaurants.insertMany([
    {
      "name": "Restaurant 1",
      "cuisine": "Italian",
      "location": "New York",
      "menu": [
        { "name": "Pizza Margherita", "price": 12 },
        { "name": "Spaghetti Carbonara", "price": 15 },
        { "name": "Tiramisu", "price": 8 }
      ]
    },
    {
      "name": "Restaurant 2",
      "cuisine": "Mexican",
      "location": "Los Angeles",
      "menu": [
        { "name": "Tacos", "price": 10 },
        { "name": "Burritos", "price": 12 },
        { "name": "Guacamole", "price": 6 }
      ]
    },
    {
      "name": "Restaurant 3",
      "cuisine": "Japanese",
      "location": "Tokyo",
      "menu": [
        { "name": "Sushi", "price": 20 },
        { "name": "Ramen", "price": 15 },
        { "name": "Matcha Ice Cream", "price": 7 }
      ]
    }
  ])

// 'array.index' - вложенный массив
// 'object.key' - вложенный объект

// 'array.index.key' - массив из объектов, с указанием конкретного индекса
// 'array.key' - массив из объектов, без индекса (проверяем все элементы массива)

// $slice: N - кол/во эл. которое нужно вывести 
// $slice: [M, N] - кол/во эл. которое нужно пропустить, кол/во эл. которое нужно вывести 

// Вывести рестораны, где название первого блюда 'Tacos'.
db.restaurants.find({'menu.0.name': 'Tacos'})

// Вывести рестораны, где в меню есть 'Tiramisu'.
db.restaurants.find({'menu.name': 'Tiramisu'})

// Вывести рестораны, где стоимость первого блюда больше 10, а стоимость третьего блюда меньше 10.
db.restaurants.find({'menu.0.price': {$gt: 10}, 'menu.2.price': {$lt: 10}})

// Вывести рестораны, где есть блюда со стоимостью выше 10.
db.restaurants.find({'menu.price': {$gt: 10}})

// Вывести рестораны, где блюда стоят меньше 8, оставляя в меню только последный элемент(блюдо).
db.restaurants.find({'menu.price': {$lt: 8}}, {menu: {$slice: -1}})

// Вывести рестораны с кухней 'Mexican' и вернуть одно блюдо из меню, пропуская первые два
db.restaurants.find({cuisine: 'Mexican'}, {menu: {$slice: [2, 1]}})

// Вывести рестораны, где блюда стоят меньше 8, вывести последние два блюдо/элемента.
db.restaurants.find({'menu.price': {$lt: 8}}, {menu: {$slice: -2}})

// Пагинация документов

// mysql
// select *
// from table
// where ...
// limit N / limit M, N

// db.collection_name.find().limit(N) // где N - кол/во документов, которое нужно вывести
// db.collection_name.find().skip(M) // где M -  кол/во документов, которое нужно пропустить
// db.collection_name.find().skip(M).limit(N)

// https://github.com/annykh/GT081024-m/blob/main/students.js
db.students.insertMany([
  {
    firstName: "Bob",
    lastName: "Smith",
    age: 22,
    course: "Mathematics",
    subjects: ["Calculus", "Algebra", "Statistics"],
    averageGrade: 90
  },
  {
    firstName: "Charlie",
    lastName: "Brown",
    age: 21,
    course: "Physics",
    subjects: ["Quantum Mechanics", "Thermodynamics", "Optics"],
    averageGrade: 78
  },
  {
    firstName: "David",
    lastName: "Williams",
    age: 23,
    course: "Chemistry",
    subjects: ["Organic Chemistry", "Inorganic Chemistry", "Biochemistry"],
    averageGrade: 82
  },
  {
    firstName: "Eva",
    lastName: "Davis",
    age: 19,
    course: "Biology",
    subjects: ["Genetics", "Microbiology", "Ecology"],
    averageGrade: 88
  },
  {
    firstName: "Frank",
    lastName: "Miller",
    age: 24,
    course: "Engineering",
    subjects: ["Mechanics", "Electronics", "Material Science"],
    averageGrade: 92
  },
  {
    firstName: "Grace",
    lastName: "Wilson",
    age: 20,
    course: "Medicine",
    subjects: ["Anatomy", "Physiology", "Pathology"],
    averageGrade: 87
  },
  {
    firstName: "Henry",
    lastName: "Moore",
    age: 21,
    course: "Economics",
    subjects: ["Microeconomics", "Macroeconomics", "Econometrics"],
    averageGrade: 80
  },
  {
    firstName: "Isabella",
    lastName: "Taylor",
    age: 22,
    course: "Law",
    subjects: ["Criminal Law", "Civil Law", "International Law"],
    averageGrade: 86
  },
  {
    firstName: "Jack",
    lastName: "Anderson",
    age: 23,
    course: "Philosophy",
    subjects: ["Ethics", "Metaphysics", "Logic"],
    averageGrade: 89
  }
])

// Вывести студентов, у которых средняя оценка больше 80.
db.students.find({averageGrade: {$gt: 80}})

// Вывести первых трех студентов, у которых средняя оценка больше 80.
db.students.find({averageGrade: {$gt: 80}}).limit(3)

// Вывести трех студенов, у которых средняя оценка больше 80, пропуская первых двух.
db.students.find({averageGrade: {$gt: 80}}).skip(2).limit(3)
db.students.find({averageGrade: {$gt: 80}}).limit(3).skip(2) // работает, но не рекомендуется

// Вывести двух студентов, которым меньше 23, пропуская первого.
db.students.find({age: {$lt: 23}}).skip(1).limit(2)

// Вывести первых двух студентов из коллекции students.
db.students.find().limit(2)

// Сортировка

// mysql
// select *
// from table
// where ...
// order by column_name asc/desc;

// db.collection_name.find().sort({column_name: 1(по возр.)/-1(по убыв.)})

// Вывести студентов, у которых средняя оценка больше 80. Отсортировать по возр. средних оценок.
db.students.find({averageGrade: {$gt: 80}}).sort({averageGrade: 1})

// Вывести всех студентов и отсортировать документы по именам по алф. порядку.
db.students.find().sort({firstName: 1})

// Вывести студентов со средней оценкой выше 85. Отсортировать по убыв. средних оценок.
db.students.find({averageGrade: {$gt: 85}}).sort({averageGrade: -1})

// Вывести студента с самой высокой средней оценкой.
db.students.find().sort({averageGrade: -1}).limit(1)

// Вывести трех студентов с самыми низкими средними оценками
db.students.find().sort({averageGrade: 1}).limit(3)

// https://github.com/annykh/GT081024-m/blob/main/emp.js

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


// Найти сотрудников, которые зарабатывают больше 2000 и меньше 5000. Вывести одного сотрудника, пропуская первого.
db.emp.find({salary: {$gt: 2000, $lt: 5000}}).skip(1).limit(1)

// Найти сотрудников, которые зарабатывают больше 2000, вывести только первых двух.
db.emp.find({salary: {$gt: 2000}}).limit(2)

// Вывести трех сотрудников, которые зарабатывают меньше всего.
db.emp.find().sort({salary: 1}).limit(3)


// Обновление данных

// db.collection_name.updateOne({filter}, {update}) - обновляет только один документ
// db.collection_name.updateMany({filter}, {update}) - обновляет множество документов

// {filter} - условие
// {update} - обновление

// $set - если нужно обновить отдельное поле, или если обновляемого поля нет, то оно создается
// $inc - для увеличения значения числового поля на определенное кол/во единиц, если обновляемого поля нет, то оно создается
// $unset - для удаления поля

// {$set: {key: value}} 
// {$inc: {key: N/-N}} 
// {$unset: {key: 1}} - 1 true

// Изменить должность на 'Manager' для сотурдника Ivan.
db.emp.updateOne(
    {firstname: 'Ivan'}, 
    {$set: {position: 'Manager'}}
)

// Output
// {
//   acknowledged: true,
//   insertedId: null,
//   matchedCount: 1,
//   modifiedCount: 1,
//   upsertedCount: 0
// }

// Добавить свойство department со значением 'HR' для сотрудников с _id 1, 3, 5.
db.emp.updateMany(
    {_id: {$in: [1, 3, 5]}},
    {$set: {department: 'HR'}}
)

// Добавить свойство department со значением 'Sales' для сотрудников с _id 2, 4
db.emp.updateMany(
    {_id: {$in: [2, 4]}},
    {$set: {department: 'Sales'}}
)

// Изменить _id сотрудника Ivan на 10.
db.emp.updateOne(
    {firstname: 'Ivan'},
    {$set: {_id: 10}}
)
// Error: Performing an update on the path '_id' would modify the immutable field '_id'

// Добавить новое поле commission со значением 0 для всех сотудников
db.emp.updateMany(
    {},
    {$set: {commission: 0}}
)

// Увеличить зарплату сотрудника с именем Boris на 2000.
db.emp.updateOne(
    {firstname: 'Boris'},
    {$inc: {salary: 2000}}
)

// Уменьшить зарплату сотрудника с именем Marina на 500.
db.emp.updateOne(
    {firstname: 'Marina'},
    {$inc: {salary: -500}}
)

// Увеличить значение поля commission на 10 для сотрудников из департамента HR.
db.emp.updateMany(
    {department: 'HR'},
    {$inc: {commission: 10}}
)

// Для всех сотурдников изменить значение поля commission на 10.
db.emp.updateMany(
    {},
    {$set: {commission: 10}}
)

// Удалить поле commission для всех сотрудников.
db.emp.updateMany(
    {},
    {$unset: {commission: 1}}
)
