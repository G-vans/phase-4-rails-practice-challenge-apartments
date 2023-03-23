class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all 
        render json: apartments
    end

    def create 
        apartment = Apartment.create(apartment_params)
        render json: apartment
    end

    def show
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            render json: apartment
        else
            render json: { error: "No apartment found"}, status: :not_found
        end
    end

    def patch
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment = Apartment.update!(apartment_params)
            render json: apartment
        else
            render json:{error: "Apartment not found"}, status: :not_found
        end
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else
            render json: {error: "Apartment not found"}, status: :not_found
        end
    end

    private

    def apartment_params
        params.permit([:number])
    end
end
