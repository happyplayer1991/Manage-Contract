class JobAreasController < ApplicationController
  access all: [], user: [], superadmin: :all
  before_action :set_job_area, only: [:edit, :show, :update, :destroy]

  def new
    @job_area = JobArea.new
  end

  def create
    @job_area = JobArea.new(job_area_params)

    respond_to do |format|
      if @job_area.save
        format.html { redirect_to settings_path, notice: 'Your Job Area was created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @job_area.update(job_area_params)
        format.html { redirect_to settings_path, notice: 'The Job Area was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @job_area.destroy
    respond_to do |format|
      format.html { redirect_to settings_path, notice: 'The Job Area was removed.' }
    end
  end

  private
    def set_job_area
      @job_area = JobArea.find(params[:id])
    end

    def job_area_params
      params.require(:job_area).permit(:title)
    end
end
