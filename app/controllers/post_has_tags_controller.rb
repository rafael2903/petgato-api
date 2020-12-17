class PostHasTagsController < ApplicationController

    before_action :set_post, only: [:show, :destroy, :update]

    def index
        @post_has_tags = Post_has_tags.all
        render json: @post_has_tags
    end

    def show
        render json: @post_has_tags
    end

    def create
        @post_has_tags = Post_has_tags.new(post_has_tags_params)

        if @post_has_tags.save
            render json: @post_has_tags, status: :created
        else
            render json: @post_has_tags.errors
        end
    end

    def destroy
        @post_has_tags.destroy
    end

    def update
        unless @post_has_tags.update(post_has_tags_params)
            render json: {errors: @post_has_tags.errors.full_messages},
                        status: :unprocessable_entity
        end
    end

    private

    def set_post_has_tags
        @post_has_tags = Post_has_tags.find(params[:id])
    end
        
    def post_has_tags_params
        params.permit(:post_id, :tag_id)
    end

end
