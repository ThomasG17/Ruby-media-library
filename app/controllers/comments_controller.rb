class CommentsController < InheritedResources::Base

  # GET /produits/:produit_id/comments
  # GET /produits/:produit_id/comments.xml
  def index
    produit = Produit.find(params[:produit_id])
    @comments = produit.comments

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /produits/:produit_id/comments/:id
  # GET /comments/:id.xml
  def show
    produit = produit.find(params[:produit_id])
    @comment = produit.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /produits/:produit_id/comments/new
  # GET /produits/:produit_id/comments/new.xml
  def new
    produit = produit.find(params[:produit_id])
    @comment = produit.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /produits/:produit_id/comments/:id/edit
  def edit
    produit = produit.find(params[:produit_id])
    @comment = produit.comments.find(params[:id])
  end

  # produit /produits/:produit_id/comments
  # produit /produits/:produit_id/comments.xml
  def create
    #1st you retrieve the produit thanks to params[:produit_id]
    produit = produit.find(params[:produit_id])
    #2nd you create the comment with arguments in params[:comment]
    @comment = produit.comments.create(params[:comment])

    respond_to do |format|
      if @comment.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@comment.produit, @comment], :notice => 'Comment was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
        format.xml  { render :xml => @comment, :status => :created, :location => [@comment.produit, @comment] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /produits/:produit_id/comments/:id
  # PUT /produits/:produit_id/comments/:id.xml
  def update
    produit = produit.find(params[:produit_id])
    @comment = produit.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to([@comment.produit, @comment], :notice => 'Comment was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /produits/:produit_id/comments/1
  # DELETE /produits/:produit_id/comments/1.xml
  def destroy
    produit = produit.find(params[:produit_id])
    @comment = produit.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(produit_comments_url) }
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user_id, :produit_id)
    end
end

