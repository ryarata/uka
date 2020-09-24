class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy,:entry]
  before_action :authenticate_user!,only: [:new,:edit,:entry]

  # GET /competitions
  # GET /competitions.json
  def index
    @competitions = Competition.all
  end

  # GET /competitions/1
  # GET /competitions/1.json
  def show
    user_id = user_signed_in? ? current_user.id : nil
    @competition.content_reading.readings.create(user_id: user_id,reading_type: 1)
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  # POST /competitions.json
  def create
    @competition = Competition.new(competition_params)

    respond_to do |format|
      if @competition.save
        format.html { redirect_to @competition, notice: 'Competition was successfully created.' }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { render :new }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitions/1
  # PATCH/PUT /competitions/1.json
  def update
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to @competition, notice: 'Competition was successfully updated.' }
        format.json { render :show, status: :ok, location: @competition }
      else
        format.html { render :edit }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1
  # DELETE /competitions/1.json
  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to _competitions_url, notice: 'Competition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def entry
    ce = @competition.competition_entries.where(user_id: current_user.id)
    if ce.blank?
      @competition.competition_entries.create(user_id: current_user.id)
      @competition.content_reading.readings.create(user_id: current_user.id,reading_type: 4)
    else
      ce.destroy_all
      @competition.content_reading.readings.create(user_id: current_user.id,reading_type: 5)
    end
    redirect_to competition_path(@competition)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_params
      params.fetch(:competition, {}).permit(competition_attributes).merge(user: current_user)
    end

    def competition_attributes
      [
        :title,:description,:apply_guideline,:competition_type,movie_attributes: movie_attributes
      ]
    end
end
