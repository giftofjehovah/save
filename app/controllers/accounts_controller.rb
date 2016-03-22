class AccountsController < ApplicationController
  def index
  	@accounts = Account.where(user_id: current_user.id)
  	@bank = []
  	@cash = []
  	@credit = []
  	@accounts.each do |account|
  		if account.type_of_account == 'bank'
  			@bank << account
  		elsif account.type_of_account == 'cash'
  			@cash << account
  		elsif account.type_of_account == 'credit'
  			@credit << account
  		end
  	end
  end
end
