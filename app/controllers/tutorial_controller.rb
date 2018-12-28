class TutorialController < ApplicationController
  before_action :authenticate_user!
  def step1
  	@profile = current_user.profile.blank? ? current_user.build_profile : current_user.profile
  end

  def step1_post
  	logger.debug("step1_post")
  	@profile = current_user.build_profile(profile_params)
  	logger.debug(@profile.inspect)
  	if @profile.save
  		redirect_to tutorial_step2_path
  	else
  		logger.debug(@profile.errors.messages)
  		render :step1
  	end
  end

  def step2
  	@profile = current_user.profile.blank? ? current_user.build_profile : current_user.profile
  end

  def step2_post
  	if current_user.profile.update_attributes(profile_params)
  		redirect_to root_path
  	else
  		render :step2
  	end
  end

  private
  	# Never trust parameters from the scary internet, only allow the white list through.
	def profile_params
	  params.fetch(:profile, {}).permit(profile_attributes)
	end

	def profile_attributes
		[
			:user_name,:introduction,movie_attributes: movie_attributes
		]
	end

	def check_action?
		false
	end
end
