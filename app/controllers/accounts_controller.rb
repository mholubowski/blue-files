class AccountsController < ApplicationController

  def new
  	@account = Account.new
  end

  def create
  	@account = Account.new(params[:account])
  	if @account.save
  		flash[:success] = "Successful account signup!"
  		redirect_to account_path (@account)
  	else
  		flash[:error]   = "wtf.."
  		render 'new'
  	end
  end

  def show 
  	@account = Account.find(params[:id])

  end

  def index #for SUPERADMIN
  	@accounts = Account.all
  end

end