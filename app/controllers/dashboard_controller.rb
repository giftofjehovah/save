class DashboardController < LoginController

  def index
  	@transactions = Transaction.where(user_id: current_user.id)
  	puts @transactions
  end
end

