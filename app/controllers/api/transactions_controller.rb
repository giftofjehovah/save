module API
	class TransactionsController < ApiController

		def index
			render json: Transaction.all
		end

	end
end