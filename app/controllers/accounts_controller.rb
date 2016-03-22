class AccountsController < LoginController
  def index
  	@accounts = Account.where(user_id: current_user.id)
  	@account = Account.new
  	@current_account = Account.find(1)
  	
  	@bank = []
  	@cash = []
  	@credit = []
  	@bank_transactions = []
  	@cash_transactions = []
  	@credit_transactions = []
  	@accounts.each do |account|
  		if account.type_of_account == 'bank'
  			@bank << account
  			account.transactions.each do |transaction|
  				@bank_transactions << transaction
  			end
  		elsif account.type_of_account == 'cash'
  			@cash << account
  			account.transactions.each do |transaction|
  				@cash_transactions << transaction
  			end
  		elsif account.type_of_account == 'credit'
  			@credit << account
  			account.transactions.each do |transaction|
  				@credit_transactions << transaction
  			end
  		end
  	end
  end

  def create
  	@account = Account.new(account_params)
  	@account.user = current_user
  	if @account.save
  		redirect_to accounts_path
  	end
  end

  private 
  def account_params
      params.require(:account).permit(:name, :balance, :type_of_account, :limit)
    end
end
