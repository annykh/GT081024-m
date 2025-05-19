// 1. Создать базу данных company.
// 2. Создать коллекцию employees и заполнить её одним документом:
  // id - 1
  // name - "John Doe"
  // age - 30
  // department - "IT" 
  // salary - 7000
  // location - "New York"
// 3. С помощью скрипта заполнить коллекцию остальными документами:
// db.employees.insertMany([
//     { id: 2, name: "Jane Smith", age: 25, department: "HR", salary: 5000, location: "Los Angeles" },
//     { id: 3, name: "Michael Johnson", age: 35, department: "Finance", salary: 8500, location: "Chicago" },
//     { id: 4, name: "Emily Brown", age: 28, department: "IT", salary: 7200, location: "San Francisco" },
//     { id: 5, name: "Daniel White", age: 40, department: "Sales", salary: 6000, location: "New York" },
//     { id: 6, name: "Sophia Taylor", age: 32, department: "HR", salary: 5200, location: "Miami" },
//     { id: 7, name: "Liam Williams", age: 29, department: "IT", salary: 6800, location: "Austin" },
//     { id: 8, name: "Olivia Martinez", age: 27, department: "Finance", salary: 7700, location: "Chicago" },
//     { id: 9, name: "Noah Brown", age: 45, department: "Sales", salary: 9000, location: "Seattle" },
//     { id: 10, name: "Emma Davis", age: 38, department: "Marketing", salary: 5500, location: "Los Angeles" }
// ])
// 4. Найти сотрудника с точным возрастом 30 лет.
// 5. Найти всех сотрудников, чей возраст не равен 30 лет.
// 6. Найти сотрудников, чей возраст меньше 35 лет.
// 7. Найти сотрудников, чей возраст меньше или равен 29 лет.
// 8. Найти сотрудников, которые имеют зарплату больше 5000.
// 9. Найти сотрудников, чей возраст больше или равен 35 лет.
// 10. Найти сотрудников, которые работают в департаментах "IT", "HR" или "Finance".
