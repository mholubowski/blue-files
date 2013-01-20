class SubscriptionsController < ApplicationController
  def new
  	@subscription = current_account.subscriptions.build if signed_in?
  end

  def create
  	@subscription = Subscription.new(params[:subscription])
  	if @subscription.save_with_payment
  		flash[:success] = "Successful account signup!"
  		redirect_to root_path
  	else
  		render :new
  	end
  end

end
