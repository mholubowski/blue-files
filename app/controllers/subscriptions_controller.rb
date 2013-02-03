class SubscriptionsController < ApplicationController
  before_filter :correct_subscription, only: [:edit, :show, :update, :destroy]
  def new
  	@subscription = current_account.build_subscription if signed_in?
  end

  def create
  	@subscription = current_account.build_subscription(params[:subscription])
  	if @subscription.save_with_payment
      AccountMailer.signup_confirmation(@subscription).deliver
  		flash[:success] = "Successful account signup!"
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  def edit
    @subscription = Subscription.find(params[:id])
  end

private

    def correct_subscription
      unless current_account.id == Subscription.find(params[:id]).account_id
        flash[:error] = "You do not have permission to edit that"
        redirect_to root_path
      end
    end

end
