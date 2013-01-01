class WelcomeController < ApplicationController
  def index
  	@request = current_account.requests.build if signed_in?
  	@recent_requests = current_account.requests.all(limit: 5)

  end
end
