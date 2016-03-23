class TransactionsController < LoginController

  def update
    transaction = Transaction.find(params[:id])

    
    
    if transaction.update(transaction_params)
      redirect_to dashboard_path
    end

  end

  def create
  	transaction = Transaction.new(transaction_params)
  	transaction.user = current_user
    account = Account.find(transaction_params[:account_id])
  
    if transaction_params[:kind] == 'expenses'
      account.balance -= transaction_params[:amount].to_f
    elsif transaction_params[:kind] == 'income'
      account.balance += transaction_params[:amount].to_f
    end

  	transaction.catergory = Catergory.find(1) 
  	if transaction.save
      if account.save
  		redirect_to dashboard_path
      end
  	end
  end

  def destroy
     transaction = Transaction.find(params[:id])
     @account = transaction.account

    if transaction.kind == "expenses"
      @account.balance += transaction.amount
    elsif transaction.kind == "income"
      @account.balance -= transaction.amount
    end
      @account.save
    if transaction.destroy
      redirect_to dashboard_path
    end
  end

 private 
  def transaction_params
      params.require(:transaction).permit(:name, :amount, :kind, :account_id)
    end
end
