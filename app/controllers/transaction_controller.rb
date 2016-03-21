class TransactionController < LoginController
  def edit
  end

  def expenses
  	transaction = Transaction.new(transaction_params)
  	transaction.user = current_user
  	transaction.kind = "expenses"
  	transaction.catergory = Catergory.find(1) 
  	if transaction.save
  		redirect_to dashboard_path
  	end
  end

  def income
  	transaction = Transaction.new(transaction_params)
  	transaction.user = current_user
  	transaction.kind = "income"
  	transaction.catergory = Catergory.find(1) 
  	if transaction.save
  		redirect_to dashboard_path
  	end
  end


  def delete
  end

 private 
  def transaction_params
      params.require(:transaction).permit(:name, :amount)
    end
end
