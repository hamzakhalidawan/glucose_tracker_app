class GlucosesController < ApplicationController
    def new
        @glucose = Glucose.new
    end

    def create
        glucose = Glucose.new(glucose_params.merge(user_id: current_user.id))
        if glucose.save
            redirect_to root_path, notice: 'Your record successfully saved!'
        else
            redirect_to root_path, alert: '' + glucose.errors.full_messages.first
        end
    end

    def generate_report

    end

    def report_details
        if params[:date].present?
            @readings = current_user.glucoses&.where(reading_date: params[:date])
        elsif params[:start_date].present?
            @readings = current_user.glucoses&.where(reading_date: params[:start_date]..params[:end_date])
        else
            redirect_to generate_report_path, alert: 'In valid options selected!'
        end 
        flash.now[:alert] = 'There is no data available in this period' unless @readings.present?
        if @readings.present?
            levels = @readings.pluck(:level)
            @maximum = levels.max
            @minimum = levels.min
            @average = levels.inject{ |sum, el| sum + el }.to_f / levels.size
        end
    end

    private
    
    def glucose_params
        params.require(:glucose).permit(:level, :reading_date)
    end
end
