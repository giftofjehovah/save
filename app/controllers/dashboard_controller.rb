class DashboardController < LoginController

  def index
  	@transactions = Transaction.where(user_id: current_user.id).reverse_order
  	@daily_budget = daily_budget
 	  @transaction = Transaction.new
    @accounts = Account.where(user_id: current_user.id)
    @catergories = Catergory.all
  end

  def daily_budget
  	transactions = RecurringTransaction.where(user_id: current_user.id)
  	@monthly = 0
  	transactions.each do |income|
  		if income.kind == "income"
  			@monthly += income.amount 			
  		end
  	end
 	daily = @monthly/(Time.days_in_month Date.today.month)
  daily.round(2)
 end

def day_expenses

end

def day_income

end

end

