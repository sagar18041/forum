class CommentsController < ApplicationController
  load_and_authorize_resource
  # GET /comments
  # GET /comments.json
  before_filter :get_topic
  def index
    @comments = @topic.comments.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = @topic.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = @topic.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = @topic.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @topic.comments.new(params[:comment])
    current_user.add_role :author, @comment
    respond_to do |format|
      if @comment.save
        format.js 
      else
        format.html { render action: "new" }
        format.js { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = @topic.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to :back, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = @topic.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  protected 

  def get_topic
    @topic = Topic.find(params[:topic_id])
  end
end
