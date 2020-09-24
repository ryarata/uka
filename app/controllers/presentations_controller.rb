class PresentationsController < ApplicationController
  before_action :set_presentation, only: [:show, :edit, :update, :destroy,:vote]
  before_action :authenticate_user!,only: [:new,:edit,:vote]

  # GET /presentations
  # GET /presentations.json
  def index
    @presentations = Presentation.all
  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
    user_id = user_signed_in? ? current_user.id : nil
    @presentation.content_reading.readings.create(user_id: user_id,reading_type: 1)
  end

  # GET /presentations/new
  def new
    @presentation = Presentation.new
  end

  # GET /presentations/1/edit
  def edit
  end

  # POST /presentations
  # POST /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)

    respond_to do |format|
      if @presentation.save
        format.html { redirect_to @presentation, notice: 'Presentation was successfully created.' }
        format.json { render :show, status: :created, location: @presentation }
      else
        format.html { render :new }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentations/1
  # PATCH/PUT /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to @presentation, notice: 'Presentation was successfully updated.' }
        format.json { render :show, status: :ok, location: @presentation }
      else
        format.html { render :edit }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @presentation.destroy
    respond_to do |format|
      format.html { redirect_to _presentations_url, notice: 'Presentation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote
    exist = @presentation.votes.where(user_id: current_user.id)
    if exist.blank?
      @presentation.votes.create(user_id: current_user.id,vote_type: params[:vote_type] )
    else
      exist.destroy_all
      @presentation.votes.create(user_id: current_user.id,vote_type: params[:vote_type] )
    end
    @presentation.content_reading.readings.create(user_id: current_user.id,reading_type: 3)
    redirect_to presentation_path(@presentation)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_params
      params.fetch(:presentation, {}).permit(presentation_attributes).merge(user: current_user)
    end

    def presentation_attributes
      [
        :title,:description,movie_attributes: movie_attributes
      ]
    end
end
