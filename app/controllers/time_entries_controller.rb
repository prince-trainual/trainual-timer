class TimeEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_time_entry, only: %i[edit update]

  def index
    @time_entries = current_user.time_entries.order(id: :desc)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @time_entry.update(time_entry_params)
        format.html { redirect_to @time_entry, notice: "Time entry was successfully updated." }
        format.json { render :show, status: :ok, location: @time_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def start_timer
    @time_entry = current_user.time_entries.new(starts_at: Time.now)
    if @time_entry.save
      flash[:notice] = "Timer was successfully started"
    else
      flash[:notice] = "Timer can't be started"
    end
    redirect_to time_entries_path
  end

  def stop_timer
    @time_entry = current_user.current_timer
    if @time_entry && @time_entry.update(finishes_at: Time.now)
      flash[:notice] = "Timer was successfully stopped"
    else
      flash[:notice] = "Timer can't be stopped"
    end  
    redirect_to time_entries_path
  end

  private
    def set_time_entry
      @time_entry = current_user.time_entries.find(params[:id])
    end

    def time_entry_params
      params.require(:time_entry).permit(:starts_at, :finishes_at)
    end
end
