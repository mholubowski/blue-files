class WelcomeController < ApplicationController
  def index
  	@request = current_account.requests.build if signed_in?
  	@recent_requests = current_account.requests.all(limit: 5) if signed_in?

  	@recent_documents = current_account.documents.all(
  						order: 'created_at DESC', 
  						limit:  5) if signed_in?

  	@docsByViews = current_account.documents.all(
  						order: 'views DESC',
  						limit:  5) if signed_in?

    @docsByComments = current_account.documents.all(
              order: 'comment_count DESC',
              limit: 5) if signed_in?

    @DocumentCount = Document.count
  end

  def security
    @DocumentCount = Document.count
  end

  def simplicity
    @DocumentCount = Document.count
  end

  def pricing
    @DocumentCount = Document.count
  end

  def technology
    @DocumentCount = Document.count
  end

end
