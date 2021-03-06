# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Account.destroy_all
Catergory.destroy_all
RecurringTransaction.destroy_all
Transaction.destroy_all
User.destroy_all
[
	{
		name: "POSB",
		balance: 5000,
		type_of_account: "bank",
		user_id: 1
	},
	{
		name: "wallet",
		balance: 100,
		type_of_account: "cash",
		user_id: 1
	},
	{
		name: "UOB",
		balance: 10000,
		type_of_account: "bank",
		user_id: 1
	},
	{
		name: "Amex",
		balance: -1000,
		type_of_account: "credit",
		user_id: 1,
		limit: 5000
	}
].each do |account|
  Account.create!(account)
end

[
	{
		name: "Shopping",
		icon: "shopping-bag"
	},
	{
		name: "Dining",
		icon: "cutlery"
	},
	{
		name: "Travel",
		icon: "plane"
	},
	{
		name: "Transport",
		icon: "car"
	},
	{
		name: "Bills",
		icon: "credit-card"
	},
	{
		name: "Others",
		icon: "random"
	}
].each do |catergory|
	Catergory.create!(catergory)
end

[
	{
		name: "AIA Life Plan",
		amount: 170,
		kind: "expenses",
		duration: "monthly",
		start_date: 20,
		user_id: 1,
		account_id: 1
	},
	{
		name: "Gym Membership",
		amount: 100,
		kind: "expenses",
		duration: "monthly",
		start_date: 10,
		user_id: 1,
		account_id: 1
	},
	{
		name: "Rental",
		amount: 2000,
		kind: "expenses",
		duration: "monthly",
		start_date: 1,
		user_id: 1,
		account_id: 3
	},
	{
		name: "Salary",
		amount: 5000,
		kind: "income",
		duration: "monthly",
		start_date: 1,
		user_id: 1,
		account_id: 3
	}
].each do |recurring|
	RecurringTransaction.create!(recurring)
end

[
	{
		name: "Singtel Bill",
		amount: 132,
		kind: "expenses",
		user_id: 1,
		catergory_id: 5,
		account_id: 1
	},
	{
		name: "Lunch",
		amount: 3.5,
		kind: "expenses",
		user_id: 1,
		catergory_id: 2,
		account_id: 2
	},
	{
		name: "Nike Shoe",
		amount: 200,
		kind: "expenses",
		user_id: 1,
		catergory_id: 1,
		account_id: 3
	},
	{
		name: "Dinner",
		amount: 32,
		kind: "expenses",
		user_id: 1,
		catergory_id: 2,
		account_id: 2
	},
	{
		name: "Buy GF flowers",
		amount: 30,
		kind: "expenses",
		user_id: 2,
		catergory_id: 6,
		account_id: 3
	}
].each do |transaction|
	Transaction.create!(transaction)
end

[
	{
		email: "yo@yo.com",
		password: "qwertyui",
		password_confirmation: "qwertyui",
		first_name: "jon",
		last_name: "phoon"
	},
	{
		email: "yo@you.com",
		password: "qwertyui",
		password_confirmation: "qwertyui",
		first_name: "joanne",
		last_name: "lo"
	}
].each do |user|
	User.create!(user)
end






