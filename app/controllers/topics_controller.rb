class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json
  before_filter :get_category
  def index
    @topics = @category.topics.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = @category.topics.find(params[:id])
    @comment = @topic.comments.new
    @comments = @topic.comments
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = @category.topics.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = @category.topics.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    binding.pry
    @topic = @category.topics.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to category_topic_path(@category,@topic), notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = @category.topics.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to category_topics_path(@category,@topic), notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = @category.topics.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end

  protected

  def get_category
    @category = Category.find(params[:category_id])
  end
end
