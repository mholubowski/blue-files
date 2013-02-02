class SubscriptionsController < ApplicationController
  def new
  	@subscription = current_account.build_subscription if signed_in?
  end

  def create
  	@subscription = current_account.build_subscription(params[:subscription])
  	if @subscription.save_with_payment
  		flash[:success] = "Successful account signup!"
  		redirect_to root_path
  	else
  		render :new
  	end
  end

end
