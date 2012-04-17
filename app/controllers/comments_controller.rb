class CommentsController < ApplicationController

  def index
    @comments = Comment.paginate(:page => params[:page]).per_page(5)
  end


  def show
    @comment = Comment.find(params[:id])
  end


  def new
    @comment = Comment.new
  end


  def edit
    @comment = Comment.find(params[:id])
  end


  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = 'comment was successfully created.'
      redirect_to comment_path(@comment)
    else
      render :action => "new"
    end
  end


  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'comment was successfully updated.'
      redirect_to comment_path(@comment)
    else
      render :action => "edit"
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end
  
end
