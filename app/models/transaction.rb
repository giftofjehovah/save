class Transaction < ActiveRecord::Base
	belongs_to :account
	belongs_to :user
	belongs_to :catergory
end
