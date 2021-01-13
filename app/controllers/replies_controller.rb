class RepliesController < ApplicationController

        before_action :set_reply, only: [:show, :destroy, :update]
    
        def index
            @replys = Reply.all
            render json: @replys
        end
    
        def show
            render json: @reply
        end
    
        def create
            @reply = Reply.new(reply_params)
    
            if @reply.save
                render json: @reply, status: :created
            else
                render json: @reply.errors
            end
        end
    
        def destroy
            @reply.destroy
        end
    
        def update
            unless @reply.update(reply_params)
                render json: {errors: @reply.errors.full_messages},
                            status: :unprocessable_entity
            end
        end
    
        private
    
        def set_reply
            @reply = Reply.find(params[:id])
        end
            
        def reply_params
            params.permit(:description, :user_id, :comment_id)
        end
    
    end
    
end
