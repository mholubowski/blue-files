class AccountsController < ApplicationController

  def new
  	@account = Account.new
  end

  def create
  	@account = Account.new(params[:account])
  	if @account.save
  		flash[:success] = "Successful account signup!"
      sign_in(@account)
      redirect_to root_path
    else
      flash[:error]   = "Please try again"
      render 'new'
    end
  end

  def show 
  	@account = Account.find(params[:id])
  	#add if signed_in?
    @documents = @account.documents
  end

  def index #for SUPERADMIN
  	@accounts = Account.all
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      sign_in @account
      redirect_to root_path
    else
      render 'edit'
    end
  end

  

end