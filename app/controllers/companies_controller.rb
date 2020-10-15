class CompaniesController < ApplicationController
    before_action :find_company, only: [:show]

    def index 
        @companies = Company.all
    end

    def new
        @company = Company.new
    end

    def show
        @connection = Connection.new
        @connections = @company.connections
        @years = Year.all
        @connection_year = ConnectionYear.new
    end

    def create
        @company = Company.new(company_params)
        if @company.save
            redirect_to company_path(@company), notice: 'Company was successfully'
        else
            render :new
        end
    end

    private

    def company_params
        params.require(:company).permit(:name, :category)
    end

    def find_company
        @company = Company.find(params[:id])
    end
end