class SavingsController < ApplicationController

    def show
        @company = Company.find(params[:company_id])
        @years = Year.all
    end
end