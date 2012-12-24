class DocumentsController < ApplicationController
  def index
    #TODO change this so it reads just files for logged in!
    # @account = Account.first
    #add if signed_in?
   # @documents = @account.documents
   @current_account_documents = current_account.documents
  end

  def show
  end

  def new
  end

  def create
  end
end
