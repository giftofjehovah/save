class Transaction < ActiveRecord::Base
	belongs_to :account
	belongs_to :user
	belongs_to :catergory

	def as_json(options={})
		options[:except] = [:created_at, :updated_at]
		super(options)
		# super(except: [:wholesale_price, :created_at, :updated_at])
	end
end
