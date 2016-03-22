class TransactionsController < LoginController
  def edit
  end

  def create
  	transaction = Transaction.new(transaction_params)
  	transaction.user = current_user
  	transaction.catergory = Catergory.find(1) 
  	if transaction.save
  		redirect_to dashboard_path
  	end
  end

  def delete
  end

 private 
  def transaction_params
      params.require(:transaction).permit(:name, :amount, :kind)
    end
end
