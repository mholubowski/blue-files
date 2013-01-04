class DocumentCommentsController < ApplicationController
  def new
  end

  def create
  	    @comment = Document.find(params[:document_comment][:document_id]).document_comments.build(params[:document_comment])
		if @comment.save
			respond_to do |format|
				format.html do    
					flash[:success] = "Successful request posted!"
					redirect_to Document.find(params[:document_comment][:document_id])
				end
        # format.js
	    	end
		else
			flash.now[:error] = "Please try again"
			render 'new'
		end

  end

  def destroy
  end
end
