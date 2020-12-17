class PostsController < ApplicationController

    before_action :set_post, only: [:show, :destroy, :update]

    def index
        @posts = Post.all
        # render json: @posts
    end

    def show
        # render json: @post
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            render json: @post, status: :created
        else
            render json: @post.errors
        end
    end

    def destroy
        @post.destroy
    end

    def update
        unless @post.update(post_params)
            render json: {errors: @post.errors.full_messages},
                        status: :unprocessable_entity
        end
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end
        
    def post_params
        params.permit(:name, :content, :banner_image, :views)
    end
    
end
