class DocumentsController < ApplicationController
  def index

   @current_account_documents = current_account.documents
  end

  def show
  end

  def new
  end

  def create
  end
end
