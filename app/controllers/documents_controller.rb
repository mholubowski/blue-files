class DocumentsController < ApplicationController
before_filter :signed_in_user
before_filter :admin_user, only: [:destroy, :edit, :update]
before_filter :correct_document, only: [:show, :edit, :update, :destroy]

  def index
   @current_account_documents = current_account.documents
  end

  def views #to show docs ordered by views
    @docsByViews = current_account.documents.all(
              order: 'views DESC'
              ) if signed_in?

      @recent_documents = current_account.documents.all(
              order: 'created_at DESC'
              ) if signed_in?
       @docsByComments = current_account.documents.all(
                      order: 'comment_count DESC')
  end

  def comments
    # @docsByComments = Document.all.sort{ |a,b| a.document_comments.count <=> b.document_comments.count }
    @docsByComments = current_account.documents.all(
                      order: 'comment_count DESC')
  end


  def show
   	@document = Document.find(params[:id])
    view = @document.views + 1
    @document.update_attributes(views: view)


    @comments = Document.find(params[:id]).document_comments.all
    # for new comment
    @comment  = Document.find(params[:id]).document_comments.build if signed_in?
    # appends to recently_viewed cookie array
    recently_viewed params[:id]
  end

  def new
    @list_of_majors = ["Anthropology", "Art", "Art History", "Asian American Studies", "Biochemistry", "Biological Sciences", "Biopsychology", "Black Studies", "Cell & Developmental Biology", "Chemistry", "Chicano & Chicana Studies", "Classics", "Communication", "Comparative Literature", "Dance", "Earth Science", "Ecology and Evolution", "Economics", "Economics and Accounting", "Economics/Mathematics", "English", "Environmental Studies", "Feminist Studies", "Film & Media Studies", "Financial Math and Statistics", "French", "Geography", "German", "Global Studies", "History", "History of Public Policy", "Interdisciplinary Studies", "Italian Studies", "Japanese", "Latin American & Iberian Studies", "Linguistics", "Mathematics", "Mathematical Sciences", "Medieval Studies", "Microbiology", "Middle East Studies", "Music", "Pharmacology", "Philosophy", "Physical Geography", "Physics", "Physiology", "Political Science", "Portuguese", "Psychology", "Religious Studies", "Renaissance Studies", "Slavic Languages & Literature", "Sociology", "Spanish", "Statistical Sciences", "Theater"]
    @list_of_courses = ["1","2A","3A","3B","34C","5","5E","8","10","10a","10b","34A","34B","34C","40","162C","100B","101","162","170","122D","101EE","6F","20G","19H","99"] 
    # moved this into form for unique id's!!! :)
    # @document = current_account.documents.build if signed_in?
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

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      flash.now[:success] = "Successfully Updated"
      render 'edit'
    else
      flash.now[:error] = "Please try again"
      render 'edit'
    end
  end

  private

    def correct_document
      unless current_account.id == Document.find(params[:id]).account_id
        flash[:error] = "You do not have permission to access that document"
        redirect_to root_path
      end
    end

end
