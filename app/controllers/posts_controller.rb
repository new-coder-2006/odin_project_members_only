class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
    
        if @post.save
          redirect_to posts_path
        else
          puts post_params
          render :new, status: :unprocessable_entity
        end
    end

    def index
        @posts = Post.all
    end 

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end
'''
    def require_login
        unless current_user&.logged_in?
            redirect_to posts_path
        end
    end
'''
end
