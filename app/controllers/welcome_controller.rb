class WelcomeController < ApplicationController
  def index
  	@request = current_account.requests.build if signed_in?
  	@recent_requests = current_account.requests.all(limit: 5)

  	@recent_documents = current_account.documents.all(
  						order: 'created_at DESC', 
  						limit:  5)
  end
end
