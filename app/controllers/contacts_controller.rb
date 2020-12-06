class ContactsController < ApplicationController

    before_action :set_contact, only: [:show, :destroy]

    def index
        @contacts = Contact.all
        render json: @contacts
    end

    def show
        render json: @contact
    end

    def create
        @contact = Contact.new(contact_params)

        if @contact.save
            render json: @contact, status: :created
        else
            render json: @contact.errors
        end
    end

    def destroy
        @contact.destroy
    end

    private

    def set_contact
        @contact = Contact.find(params[:id])
    end
        
    def contact_params
        params.require(:contact).permit(:name, :email, :description)
    end

end
