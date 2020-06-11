class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
  end 
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
  
  
    if @post.save
     redirect_to @post
    else
     render 'new'
    end
  end

 
# def show
#   @post = Post.find(params[:id])
# end
# ===被下面的代替，可能是因为上面的before action+下面的find post方程式
 def show
 end
 
 def edit
 end
 
 def update
  if @post.update(post_params)  
   redirect_to @post
  else
   render 'edit'
  end
 end
 
 def destroy
   @post.destroy
   redirect_to root_path
 end
 
 def find_post
  @post = Post.find(params[:id])
 end
 


 
  private
    def post_params
    params.require(:post).permit(:title, :content)
    end
end
