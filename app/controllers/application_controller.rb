class ApplicationController < ActionController::Base
	before_action :set_profile_tutorial ,if: :check_action?

	def set_profile_tutorial
		if user_signed_in?
			if current_user.profile.blank?
				redirect_to tutorial_step1_path
			end
		end
	end

	def check_action?
	    true
	end

	def movie_attributes
		[
			:id,:file,:_destroy
		]
	end
end
