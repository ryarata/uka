# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                      root GET    /                                                                                        home#index
#          new_user_session GET    /users/sign_in(.:format)                                                                 users/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 users/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                users/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#           new_user_unlock GET    /users/unlock/new(.:format)                                                              devise/unlocks#new
#               user_unlock GET    /users/unlock(.:format)                                                                  devise/unlocks#show
#                           POST   /users/unlock(.:format)                                                                  devise/unlocks#create
#              profile_show GET    /profile/:id(.:format)                                                                   profile#show
#                room_index GET    /room(.:format)                                                                          room#index
#                 room_show GET    /room/:id(.:format)                                                                      room#show
#            tutorial_step1 GET    /tutorial/step1(.:format)                                                                tutorial#step1
#            tutorial_step2 GET    /tutorial/step2(.:format)                                                                tutorial#step2
#             presentations GET    /presentations(.:format)                                                                 presentations#index
#                           POST   /presentations(.:format)                                                                 presentations#create
#          new_presentation GET    /presentations/new(.:format)                                                             presentations#new
#         edit_presentation GET    /presentations/:id/edit(.:format)                                                        presentations#edit
#              presentation GET    /presentations/:id(.:format)                                                             presentations#show
#                           PATCH  /presentations/:id(.:format)                                                             presentations#update
#                           PUT    /presentations/:id(.:format)                                                             presentations#update
#                           DELETE /presentations/:id(.:format)                                                             presentations#destroy
#              competitions GET    /competitions(.:format)                                                                  competitions#index
#                           POST   /competitions(.:format)                                                                  competitions#create
#           new_competition GET    /competitions/new(.:format)                                                              competitions#new
#          edit_competition GET    /competitions/:id/edit(.:format)                                                         competitions#edit
#               competition GET    /competitions/:id(.:format)                                                              competitions#show
#                           PATCH  /competitions/:id(.:format)                                                              competitions#update
#                           PUT    /competitions/:id(.:format)                                                              competitions#update
#                           DELETE /competitions/:id(.:format)                                                              competitions#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :categories
      resources :category_contents
      resources :competitions
      resources :competition_entries
      resources :content_readings
      resources :icons
      resources :messages
      resources :movies
      resources :presentations
      resources :profiles
      resources :readings
      resources :rooms
      resources :room_members
      resources :votes

      root to: "users#index"
    end
	root to: "home#index"
	devise_for :users, controllers: {
    	sessions: 'users/sessions'
  	}

  	namespace :profile do
  		get ":id",action: :show,as: "show"
  	end

  	namespace :room do
  		get "/",action: :index,as: "index"
  		get ":id",action: :show,as: "show"
  	end

  	namespace :tutorial do
  		get "step1",action: :step1,as: "step1"
  		match "step1_post",action: :step1_post,as: "step1_post",via: [:post,:patch]
  		get "step2",action: :step2,as: "step2"
  		match "step2_post",action: :step2_post,as: "step2_post",via: [:post,:patch]
  	end

  	resources :presentations do
  		member do
  			get "vote"
  		end
  	end
  	resources :competitions do
  		member do
  			get "entry"
  		end
  	end
end
