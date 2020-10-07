class SavingsController < ApplicationController

    def show
        @company = Company.find(params[:company_id])
    end
end