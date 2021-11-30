class ShiftsController < ApplicationController
  
  def index
      @shift = Shift.new
      
      @organisation = Organisation.find(current_user.organisation_id)
   
      @shifts = Shift.includes(:user).where(users: {organisation_id: current_user.organisation_id}).order(created_at: :desc)      
      @names = {}
      @hours_worked = {}
      @shift_costs = {}

      @shifts.each do |shift|
          @names[shift] = User.find(shift.user_id).name
          shift_length = (shift.finish - shift.start) / 60 / 60
          hours_worked = shift_length - Float(shift.break_length) / 60
          shift_cost = hours_worked * @organisation.hourly_rate
          @hours_worked[shift] = hours_worked.round(2)
          @shift_costs[shift] = shift_cost.round(2)
      end
  end

  def create
      date = shift_params[:date]
      start_datetime = DateTime.parse(date + " " + shift_params[:start])
      finish_datetime = DateTime.parse(date + " " + shift_params[:finish])
      shift = Shift.create(user_id: current_user.id, start: start_datetime, finish: finish_datetime, break_length: shift_params[:break_length])
      if shift.save
          redirect_to shifts_path
      end
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    date = shift_params[:date]
    start_datetime = combine_date_time(date, shift_params[:start])
    finish_datetime = combine_date_time(date, shift_params[:finish])
    Shift.update(params[:id], start: start_datetime, finish: finish_datetime, break_length: shift_params[:break_length])
    redirect_to shifts_path
  end

  def destroy
    Shift.destroy(params[:id])
    redirect_to shifts_path
  end

  private
  def shift_params
    params.require(:shift).permit(:date, :start, :finish, :break_length)
  end

  def combine_date_time(date, time)
    Time.zone.parse(date + " " + time)
  end
end