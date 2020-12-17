class TagsController < ApplicationController

    before_action :set_tag, only: [:show, :destroy, :update]

    def index
        @tags = Tag.all
        render json: @tags
    end

    def show
        render json: @tag
    end

    def create
        @tag = Tag.new(tag_params)

        if @tag.save
            render json: @tag, status: :created
        else
            render json: @tag.errors
        end
    end

    def destroy
        @tag.destroy
    end

    def update
        unless @tag.update(tag_params)
            render json: {errors: @tag.errors.full_messages},
                        status: :unprocessable_entity
        end
    end

    private

    def set_tag
        @tag = Tag.find(params[:id])
    end
        
    def tag_params
        params.permit(:name, :description)
    end

end
