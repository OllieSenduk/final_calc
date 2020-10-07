class ConnectionYearsController < ApplicationController
    before_action :find_connection, only: [:create]

    def create 
        @connection_year = ConnectionYear.new(connection_year_params)
        @connection_year.connection = @connection
        @connection_years = @connection.connection_years
        @years = Year.all
        @connection_year.price_sub_cents = Calculators::YearlyEnergyPriceCalculator.new(@connection_year.kwh, @connection_year.year).total_price_sub_cents
        if @connection_year.save
            redirect_to connection_path(@connection)
        else
            render 'connections/show'
        end
    end

    def update
    end

    def destroy
        @connection_year = ConnectionYear.find(params[:id])
        @connection = @connection_year.connection
        @connection_year.destroy
        redirect_to connection_path(@connection)
    end

    private

    def connection_year_params
        params.require(:connection_year).permit(:year_id, :kwh)
    end

    def find_connection
        @connection = Connection.find(params[:connection_id])
    end
end