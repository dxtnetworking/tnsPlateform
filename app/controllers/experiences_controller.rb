class ExperiencesController < ApplicationController
  before_action :set_profile
  before_action :set_experience, only: [:update, :destroy]

  
  # POST /experiences
  def create
    @experience = @profile.experiences.new(experience_params)

    if @experience.save
      render json: @experience, status: :created, location: @experience
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /experiences/1
  def update
    if @experience.update(experience_params)
      render json: @experience
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  # DELETE /experiences/1
  def destroy
    @experience.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end
    
    def set_experience
      @experience = @profile.experiences.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def experience_params
      params.require(:experience).permit(:titre_poste, :description, :poste_actuel, :type_poste, :nom_societe, :localisation, :debut_occupation_poste, :fin_occupation_poste, :profile_id)
    end
end
