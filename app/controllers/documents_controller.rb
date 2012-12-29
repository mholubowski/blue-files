class DocumentsController < ApplicationController

  def index
   @current_account_documents = current_account.documents
  end

  def show
   	@document = Document.find(params[:id])
  end

  def new
    @document = current_account.documents.build if signed_in?
  end

 def create
    @document = current_account.documents.build(params[:document])
    if @document.save
      flash.now[:success] = "Successful document upload!"
      render 'new'

      # redirect_to documents_path
     else
      flash.now[:error] = "Please try again"
      render 'new'
    end
  end

end
