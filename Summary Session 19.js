// 10. Найти все заказы, где сумма заказа находится в диапазоне от 9 до 18 включительно.
db.orders.find({amount: {$gte: 9, $lte: 18}})
// 12. Вывести только поля customer и product, исключив остальные.
db.orders.find({}, {customer: 1, product: 1, _id: 0})
// 16. Найти всех сотрудников, проживающих в городе "Moscow".
db.staff.find({'address.city': 'Moscow'})
// 17. Найти сотрудников, у которых адрес включает город "Kazan" и улицу "Tverskaya".
db.staff.find({'address.city': 'Kazan', 'address.street': 'Tverskaya'})
// 18. Найти сотрудников, у которых среди контактов есть номер телефона.
db.staff.find({'contacts.type': 'phone'})
// 21. Вывести информацию о первом проекте у каждого сотрудника.
db.staff.find({}, {projects: {$slice: 1}})
// 26. Добавить новый контакт { type: "telegram", value: "@ivanpetrov" } сотруднику с именем Ivan Petrov. (коллекция staff)
db.staff.updateOne({name: 'Ivan Petrov'}, {$push: {contacts: {type: "telegram", value: "@ivanpetrov"}}})
// 28. Удалить из массива contacts у сотрудника Anna Volkova все элементы с типом "phone". (коллекция staff)
db.staff.updateOne({name: 'Anna Volkova'}, {$pull: {contacts: {type: 'phone'}}})
// 31. Посчитать, сколько раз был куплен продукт "Apple". (коллекция orders)
db.orders.find({product: 'Apple'}).count()

db.orders.aggregate([
    {$match: {product: 'Apple'}},
    {$group: {_id: '$product', count: {$sum: 1}}}
])
// 33. Посчитать, сколько всего было потрачено на каждый продукт. (коллекция orders)
db.orders.aggregate([
    {$group: {_id: '$product', totalAmount: {$sum: '$amount'}}}
])
// 35. Посчитать общее количество заказов в каждом городе. (коллекция orders)
db.orders.aggregate([
    {$group: {_id: '$city', orderCount: {$sum: 1}}}
])
