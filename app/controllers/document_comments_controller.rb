class DocumentCommentsController < ApplicationController
  def new
  end

  def create
  	    @comment = Document.find(params[:document_comment][:document_id]).document_comments.build(params[:document_comment])
		if @comment.save
			respond_to do |format|
				format.html do    
					flash[:success] = "Posted comment!"
					redirect_to Document.find(params[:document_comment][:document_id])
				end
			   # TODO AJAX-ifx comment posting to save S3 down on page reload
     		   # format.js
	    	end
		else
			flash[:error] = "Please try posting again"
			redirect_to Document.find(params[:document_comment][:document_id])
		end

  end

  def destroy
  end
end
