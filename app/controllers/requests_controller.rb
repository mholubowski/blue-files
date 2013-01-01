class RequestsController < ApplicationController

  def new
  	@request = current_account.requests.build if signed_in?
  end

  def create

  end

  def edit
  end

  def destroy
  end
end
