class AccountsController < LoginController
  def index
  	@accounts = Account.where(user_id: current_user.id)
  	@account = Account.new
  	
  	
  	@bank = []
  	@bank_total = 0;
  	@cash = []
  	@cash_total = 0;
  	@credit = []
  	@credit_total = 0;
  	@bank_transactions = []
  	@cash_transactions = []
  	@credit_transactions = []
  	@accounts.each do |account|
  		if account.type_of_account == 'bank'
  			@bank << account
  			@bank_total += account.balance
  			account.transactions.each do |transaction|
  				@bank_transactions << transaction
  			end
  		elsif account.type_of_account == 'cash'
  			@cash << account
  			@cash_total += account.balance
  			account.transactions.each do |transaction|
  				@cash_transactions << transaction
  			end
  		elsif account.type_of_account == 'credit'
  			@credit << account
  			@credit_total += account.balance
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

  def destroy
  	@account = Account.find(params[:id])

  	if @account.destroy
		redirect_to accounts_path
	end
  	
  end

  private 
  def account_params
      params.require(:account).permit(:name, :balance, :type_of_account, :limit)
    end
end
