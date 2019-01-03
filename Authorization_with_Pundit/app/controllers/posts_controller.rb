class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:destroy]
  after_action :verify_policy_scoped, only: [:user_posts]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new
    @post.update_attributes(permitted_attributes(@post))

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(permitted_attributes(@post))
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    if @post.present?
      authorize @post
      @post.destroy
    else
      skip_authorization
    end

    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def user_posts
    @posts = policy_scope(Post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(policy(@post).permitted_attributes)
    end
end
