class JobTypesController < ApplicationController
  access all: [], user: [], superadmin: :all
  before_action :set_job_type, only: [:edit, :show, :update, :destroy]

  def new
    @job_type = JobType.new
  end

  def create
    @job_type = JobType.new(job_type_params)

    respond_to do |format|
      if @job_type.save
        format.html { redirect_to settings_path, notice: 'Your Job Type was created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @job_type.update(job_type_params)
        format.html { redirect_to settings_path, notice: 'The Job Type was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @job_type.destroy
    respond_to do |format|
      format.html { redirect_to settings_path, notice: 'The Job Type was removed.' }
    end
  end

  private
    def set_job_type
      @job_type = JobType.find(params[:id])
    end

    def job_type_params
      params.require(:job_type).permit(:title)
    end
end
