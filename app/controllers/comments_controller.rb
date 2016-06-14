class CommentsController < InheritedResources::Base

  # GET /produits/:produit_id/comments/new
  # GET /produits/:produit_id/comments/new.xml
  def new
    produit = produit.find(params[:produit_id])
    @comment = produit.comments.build
  end

  # GET /produits/:produit_id/comments/:id/edit
  def edit
    @produit = Produit.find(params[:produit_id])
    @comment = @produit.comments.find(params[:id])
    if session[:user_id] != @comment.user_id
      flash[:notice] = "Sorry, you can’t edit this comment"
      redirect_to(@produit)
    end
  end

  # produit /produits/:produit_id/comments
  # produit /produits/:produit_id/comments.xml
  def create
    @produit = Produit.find(params[:produit_id])
    @comment = @produit.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save!
      redirect_to(@produit, :notice => 'Comment was successfully created.')
    else
      redirect_to(@produit, :notice => 'Comment was not successfully created.')
    end
  end

  # PUT /produits/:produit_id/comments/:id
  # PUT /produits/:produit_id/comments/:id.xml
  def update
    @produit = Produit.find(params[:produit_id])
    @comment = @produit.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to produit_path(@produit)
    else
      render 'edit'
    end
  end

  # DELETE /produits/:produit_id/comments/1
  # DELETE /produits/:produit_id/comments/1.xml
  def destroy
    produit = Produit.find(params[:produit_id])
    @comment = produit.comments.find(params[:id])
    @comment.destroy
    redirect_to(produit)
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user_id, :produit_id)
    end
end

