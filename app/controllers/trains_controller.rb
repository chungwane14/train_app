class TrainsController < ApplicationController
    
    def new 
        @train = Train.new
    end

    def create
        @train = Train.create(train_params)
        redirect_to root_path

    end

    private

    def train_params
        params.require(:train).permit(:ident_number, :model, :max_pax, train_routes_attributes: [:destination, :departing, :train_id])
    end
end