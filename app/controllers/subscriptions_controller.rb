class SubscriptionsController < ApplicationController
  def new
  	@subscription = current_account.subscriptions.build if signed_in?
  end

  def create
  end
end
