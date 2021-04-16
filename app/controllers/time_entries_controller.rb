class TimeEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_time_entry, only: %i[edit update]

  # GET /time_entries or /time_entries.json
  def index
    @time_entries = current_user.time_entries
  end

  # GET /time_entries/1/edit
  def edit
  end

  # POST /time_entries or /time_entries.json
  def create
    @time_entry = current_user.time_entries.new(time_entry_params)

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to @time_entry, notice: "Time entry was successfully created." }
        format.json { render :show, status: :created, location: @time_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_entries/1 or /time_entries/1.json
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_entry
      @time_entry = current_user.time_entries.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_entry_params
      params.require(:time_entry).permit(:starts_at, :finishes_at)
    end
end
