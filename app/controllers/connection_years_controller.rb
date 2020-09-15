class ConnectionYearsController < ApplicationController
    before_action :find_connection, only: :create

    def create 
        @connection_year = ConnectionYear.new(connection_year_params)
        @connection_year.connection = @connection
        @years = Year.all
        @connection_year.price_sub_cents = Calculators::YearlyEnergyPriceCalculator.new(@connection_year)
        if @connection_year.save
            redirect_to connection_path(@connection)
        else
            render 'connections/show'
        end
    end

    def update
    end

    private

    def connection_year_params
        params.require(:connection_year).permit(:year_id, :kwh)
    end

    def find_connection
        @connection = Connection.find(params[:connection_id])
    end
end