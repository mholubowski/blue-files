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
      respond_to do |format|
        format.html do    
          flash.now[:success] = "Successful document upload!"
          redirect_to documents_path
        end
        format.js
      end
     else
      flash.now[:error] = "Please try again"
      render 'new'
    end
  end

end
