class UsersController < ApplicationController

    before_action :set_user, only: [:show, :update, :destroy]
    before_action :authorize_request, except: [:create, :password_reset]
    
    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def show
        render json: @user, status: :ok
    end     

    def create
       @user = User.new(user_params)
       if @user.save
            render json: @user, status: :ok
       else
            render json: {errors: @user.errors.full_messages},
                            status: :unprocessable_entity
       end
    end

    def update
        unless @user.update(user_params)
            render json: {errors: @user.errors.full_messages},
                        status: :unprocessable_entity
        end
    end

    def password_reset
        begin
            @user = User.find_by_email!(params[:email])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'User not found' }, status: :not_found
        end
        new_password = rand(36**8).to_s(36)
        if @user.update(password: new_password)
            UserMailer.with(user: @user, new_password: new_password).reset_password_email.deliver_now
            render :ok
        else
            render json: {errors: @user.errors.full_messages},
                        status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
    end

    private

    def set_user
        @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
        params.permit(:name, :email, :password, :password_confirmation)
    end
end
