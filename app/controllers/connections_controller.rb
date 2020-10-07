class ConnectionsController < ApplicationController

    def show
        @connection = Connection.find(params[:id])
        @connection_year = ConnectionYear.new
        @connection_years = @connection.connection_years
        @years = Year.all
    end

    def new
        @company = Company.find(params[:company_id])
        @connections = Connection.all
        @connection = Connection.new
    end

    def create
        @connection = Connection.new(connection_params)
        @connections = Connection.all
        @company = Company.find(params[:company_id])
        @connection.company = @company
        if @connection.save
            redirect_to company_path(@company)
        else
            render 'new'
        end
    end

    def destroy
        @connection = Connection.find(params[:id])
        @connection_year = ConnectionYear.new
        @years = Year.all
        @company = @connection.company

        @connection.destroy
        redirect_to company_path(@company)
    end

    private

    def connection_params
        params.require(:connection).permit(:name)
    end
end