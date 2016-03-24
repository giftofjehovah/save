class DashboardController < LoginController

  def index
  	@transactions = Transaction.where(user_id: current_user.id).reverse_order
  	@daily_budget = daily_budget
 	  @transaction = Transaction.new
    @accounts = Account.where(user_id: current_user.id)
    @catergories = Catergory.all
  end

  def daily_budget
    @monthly = 10000/20
    @monthly -= day_expenses
  # 	transactions = RecurringTransaction.where(user_id: current_user.id)
  # 	@monthly = 0
  # 	transactions.each do |income|
  # 		if income.kind == "income"
  # 			@monthly += income.amount 			
  # 		end
  # 	end
 	# daily = @monthly/(Time.days_in_month Date.today.month)
  # daily.round(2)
 end

def day_expenses
  @day_expenses = 0;
  # transactions = Transaction.find(:all, conditions: ["DATE(created_at) = ?", Date.today])
  # transactions = Transaction.where(["created_at < ?", Time.zone.now.beginning_of_day])
  transactions = @transactions.where("created_at >= ?", Time.zone.now.beginning_of_day)
  if transactions
    transactions.each do |transaction|
      if transaction.kind == 'expenses'
        @day_expenses += transaction.amount
      elsif transaction.kind == 'income'
        @day_expenses -= transaction.amount
      end
  end
end
return @day_expenses
end

def day_income

end

end

