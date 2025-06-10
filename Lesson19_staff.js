db.staff.insertMany([
  {
    _id: 1,
    name: "Ivan Petrov",
    position: "Manager",
    address: {
      city: "Moscow",
      street: "Lenina",
      house: 10
    },
    contacts: [
      { type: "email", value: "ivan.petrov@example.com" },
      { type: "phone", value: "+7 900 123 4567" }
    ],
    projects: [
      { name: "Alpha", hours: 120 },
      { name: "Beta", hours: 80 },
      { name: "Gamma", hours: 60 }
    ]
  },
  {
    _id: 2,
    name: "Elena Smirnova",
    position: "Developer",
    address: {
      city: "Saint Petersburg",
      street: "Nevsky",
      house: 45
    },
    contacts: [
      { type: "email", value: "elena.smirnova@example.com" }
    ],
    projects: [
      { name: "Alpha", hours: 150 },
      { name: "Delta", hours: 70 }
    ]
  },
  {
    _id: 3,
    name: "Sergey Ivanov",
    position: "Tester",
    address: {
      city: "Kazan",
      street: "Tverskaya",
      house: 25
    },
    contacts: [
      { type: "phone", value: "+7 901 987 6543" }
    ],
    projects: [
      { name: "Beta", hours: 100 }
    ]
  },
   {
    _id: 4,
    name: "Anna Volkova",
    position: "Designer",
    address: {
      city: "Sochi",
      street: "Kurortny",
      house: 7
    },
    contacts: [
      { type: "email", value: "anna.volkova@example.com" },
      { type: "phone", value: "+7 902 345 6789" }
    ],
    projects: [
      { name: "Gamma", hours: 95 },
      { name: "Zeta", hours: 110 }
    ]
  },
  {
    _id: 5,
    name: "Dmitry Orlov",
    position: "Developer",
    address: {
      city: "Moscow",
      street: "Tverskaya",
      house: 12
    },
    contacts: [
      { type: "email", value: "d.orlov@example.com" }
    ],
    projects: [
      { name: "Alpha", hours: 130 },
      { name: "Epsilon", hours: 85 },
      { name: "Zeta", hours: 50 }
    ]
  },
  {
    _id: 6,
    name: "Marina Sokolova",
    position: "HR",
    address: {
      city: "Kazan",
      street: "Pushkina",
      house: 33
    },
    contacts: [
      { type: "phone", value: "+7 903 222 1111" }
    ],
    projects: [
      { name: "HR-Platform", hours: 200 }
    ]
  }
])
