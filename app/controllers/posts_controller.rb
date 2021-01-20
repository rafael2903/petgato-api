class PostsController < ApplicationController
    include ActionController::Serialization

    before_action :set_post, only: [:show, :destroy, :update]

    def index
        #@posts = Post.all
        # render json: @posts
    end

    def show
        #render json: @post.as_json({ src: url_for(@post.banner_image) })
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            if @post.banner_image.attached?
                @url_banner_image = url_for(@post.banner_image)
                # Rails.application.routes.url_helpers.url_for(@post.banner_image)
                puts(@url_banner_image)
            end
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
        params.permit(:name, :content, :banner_image)
    end
    
end
