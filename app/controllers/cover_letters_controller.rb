class CoverLettersController < ApplicationController
  before_action :set_cover_letter, only: [:show, :edit, :update, :destroy]

  # GET /cover_letters
  def index
    @cover_letters = CoverLetter.all
  end

  # GET /cover_letters/1
  def show
  end

  # GET /cover_letters/new
  def new
    @cover_letter = CoverLetter.new
  end

  # GET /cover_letters/1/edit
  def edit
  end

  # POST /cover_letters
  def create
    @cover_letter = CoverLetter.new(cover_letter_params)

    if @cover_letter.save
      redirect_to @cover_letter, notice: 'Cover letter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cover_letters/1
  def update
    if @cover_letter.update(cover_letter_params)
      redirect_to @cover_letter, notice: 'Cover letter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cover_letters/1
  def destroy
    @cover_letter.destroy
    redirect_to cover_letters_url, notice: 'Cover letter was successfully destroyed.'
  end

  def download
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cover_letter
      @cover_letter = CoverLetter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cover_letter_params
      params.require(:cover_letter).permit(:body, :name)
    end
end
