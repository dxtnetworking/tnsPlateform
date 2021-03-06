class ProfileSocialsController < ApplicationController
  before_action :set_profile
  before_action :set_profile_social, only: [:update, :destroy]

  # POST /profile_socials
  def create
    @profile_social = @profile.profile_socials.new(profile_social_params)

    if @profile_social.save
      render json: @profile_social, status: :created, location: @profile_social
    else
      render json: @profile_social.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profile_socials/1
  def update
    if @profile_social.update(profile_social_params)
      render json: @profile_social
    else
      render json: @profile_social.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profile_socials/1
  def destroy
    @profile_social.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end
    
    def set_profile_social
      @profile_social = @profile.profile_socials.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profile_social_params
      params.require(:profile_social).permit(:lien_profile, :profile_id, :reseau_social_id)
    end
end
