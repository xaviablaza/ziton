class ProfessionsController < ApplicationController
  before_action :set_profession, only: [:show, :edit, :update, :destroy]

  # GET /professions
  def index
    @professions = Profession.order_by_status
    @active_apps = Profession.where.not({status: [1,6,7,0]}).count
  end

  # GET /professions/1
  def show
  end

  # GET /professions/new
  def new
    @profession = Profession.new
  end

  # GET /professions/1/edit
  def edit
  end

  # POST /professions
  def create
    @profession = Profession.new(profession_params)

    if @profession.save
      redirect_to @profession, notice: 'Profession was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /professions/1
  def update
    if @profession.update(profession_params)
      redirect_to @profession, notice: 'Profession was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /professions/1
  def destroy
    @profession.destroy
    redirect_to professions_url, notice: 'Profession was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profession
      @profession = Profession.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profession_params
      params.require(:profession).permit(:company, :website, :title, :job_url, :status, :location, :cover_letter_id)
    end
end
