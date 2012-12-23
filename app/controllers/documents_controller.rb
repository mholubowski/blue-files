class DocumentsController < ApplicationController
  def index
    #TODO change this so it reads just files for logged in!
    # @account = Account.first
    #add if signed_in?
   # @documents = @account.documents
   @all_documents = Document.all
  end

  def show
  end

  def new
  end

  def create
  end
end
