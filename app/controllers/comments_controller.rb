class CommentsController < ApplicationController
  # before_action :set_shot, only: [:create, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @shot = Shot.find(params[:shot_id])
    @comment = @shot.comments.create(comment_params)
    @comment.user_id = current_user.id if current_user
    @comment.save!
    redirect_to shot_path(@shot)
  end

  def destroy
    @shot = Shot.find(params[:shot_id])
    @comment = @shot.comments.find(params[:id])
    @comment.destroy
    redirect_to shot_path(@shot)
  end

  private

  # def set_shot
  #   @shot = Shot.find(params[:shot_id])
  # end

  def comment_params
    params.require(:comment).permit(:reply, :user_id, :shot_id)
  end
end

# class CommentsController < ApplicationController
#   before_action :set_comment, only: [:show, :edit, :update, :destroy]
#
#   # GET /comments
#   # GET /comments.json
#   def index
#     @comments = Comment.all
#   end
#
#   # GET /comments/1
#   # GET /comments/1.json
#   def show
#   end
#
#   # GET /comments/new
#   def new
#     @comment = Comment.new
#   end
#
#   # GET /comments/1/edit
#   def edit
#   end
#
#   # POST /comments
#   # POST /comments.json
#   def create
#     @comment = Comment.new(comment_params)
#
#     respond_to do |format|
#       if @comment.save
#         format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
#         format.json { render :show, status: :created, location: @comment }
#       else
#         format.html { render :new }
#         format.json { render json: @comment.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   # PATCH/PUT /comments/1
#   # PATCH/PUT /comments/1.json
#   def update
#     respond_to do |format|
#       if @comment.update(comment_params)
#         format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
#         format.json { render :show, status: :ok, location: @comment }
#       else
#         format.html { render :edit }
#         format.json { render json: @comment.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   # DELETE /comments/1
#   # DELETE /comments/1.json
#   def destroy
#     @comment.destroy
#     respond_to do |format|
#       format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end
#
#   private
#   # Use callbacks to share common setup or constraints between actions.
#   def set_comment
#     @comment = Comment.find(params[:id])
#   end
#
#   # Only allow a list of trusted parameters through.
#   def comment_params
#     params.require(:comment).permit(:reply, :user_id, :shot_id)
#   end
# end