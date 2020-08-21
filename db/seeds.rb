User.create(name: "Nguyen Xuan Phuc", email: "user1@gmail.com",
  company_name: "ABC", identity_number: "123412345", phone_number: "0987987987",
  password: "123456", password_confirmation: "123456")

Role.create(name: "Admin")

Role.create(name: "Manager")

Unit.create(name: "Store Management")

Unit.create(name: "Flight Management")

Unit.create(name: "BA")

Unit.create(name: "AC")

Unit.create(name: "SM")

Employee.create(role_id: 1, unit_id: 1, name: "Vu Duc Nguyen", email: "employee1@gmail.com",
  password: "123456", password_confirmation: "123456")
Employee.create(role_id: 1, unit_id: 1, name: "ABC", email: "employee2@gmail.com",
  password: "123456", password_confirmation: "123456")
Employee.create(role_id: 1, unit_id: 2, name: "DEF", email: "employee3@gmail.com",
  password: "123456", password_confirmation: "123456")

Terminal.create(name: "Terminal 1", area: "1000", employee_id: 1)

Terminal.create(name: "Terminal 2",area: "1200", employee_id: 1)

Terminal.create(name: "Terminal 3",area: "1500", employee_id: 1)

Terminal.create(name: "Terminal 4",area: "1400",  employee_id: 1)

Category.create(name: "Drink")

Category.create(name: "Fast food")

Category.create(name: "Clothes")

Category.create(name: "Present")

Slot.create(terminal_id: 1, name: "Slot 1", area: 200, price: 200, is_empty: false)

Slot.create(terminal_id: 1, name: "Slot 2", area: 200, price: 200, is_empty: false)

Slot.create(terminal_id: 1, name: "Slot 3", area: 200, price: 250, is_empty: false)

Slot.create(terminal_id: 1, name: "Slot 4", area: 200, price: 200)

Slot.create(terminal_id: 2, name: "Slot 5", area: 200, price: 200)

Slot.create(terminal_id: 2, name: "Slot 6", area: 200, price: 260)

Slot.create(terminal_id: 2, name: "Slot 7", area: 200, price: 200)

Slot.create(terminal_id: 2, name: "Slot 8", area: 200, price: 200)

Slot.create(terminal_id: 3, name: "Slot 9", area: 200, price: 200)

Slot.create(terminal_id: 3, name: "Slot 10", area: 200, price: 200)

Slot.create(terminal_id: 3, name: "Slot 11", area: 200, price: 200)

Slot.create(terminal_id: 3, name: "Slot 12", area: 200, price: 200)

Slot.create(terminal_id: 4, name: "Slot 13", area: 200, price: 200)

Slot.create(terminal_id: 4, name: "Slot 14", area: 200, price: 200)

Slot.create(terminal_id: 4, name: "Slot 15", area: 200, price: 200)

Slot.create(terminal_id: 4, name: "Slot 16", area: 200, price: 200)

Status.create(name: "Pending")

Status.create(name: "Approve")

Status.create(name: "Deny")

Status.create(name: "Expire")

Store.create(slot_id: 1, user_id: 1, category_id: 1, name: "Pepsi", description: "Pepsi")

Store.create(slot_id: 2, user_id: 1, category_id: 3, name: "Gucci", description: "Gucci")

Store.create(slot_id: 3, user_id: 1, category_id: 4, name: "Bamboo", description: "Bamboo")

Contract.create(store_id: 1, status_id: 1, start_date: "2020/05/20", end_date: "2021/05/20")

Contract.create(store_id: 2, status_id: 2, start_date: "2020/05/20", end_date: "2022/05/20")

Contract.create(store_id: 3, status_id: 3, start_date: "2020/06/20", end_date: "2021/06/20")
