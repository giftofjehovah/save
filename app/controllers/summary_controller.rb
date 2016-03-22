class SummaryController < ApplicationController
  def index
  	@summary = []
  	summaries = Catergory.all
  	summaries.each do |summary|
  		hash = {
  			catergory: summary.name,
  			total: summary.transactions.sum(:amount)
  		}
  		@summary << hash
  	end
  end
end
