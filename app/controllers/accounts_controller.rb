class AccountsController < LoginController
  def index
  	@accounts = Account.where(user_id: current_user.id)
  	@account = Account.new
  	@current_account = Account.find(1)
  	
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

  def create
  	@account = Account.new(account_params)
  	@account.user = current_user
  	if @account.save
  		redirect_to accounts_path
  	end
  end

  private 
  def account_params
      params.require(:account).permit(:name, :balance, :type_of_account)
    end
end
