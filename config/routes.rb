# == Route Map
#
#                   Prefix Verb   URI Pattern                                 Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                    devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                    devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                   devise/sessions#destroy
#            user_password POST   /users/password(.:format)                   devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)               devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)              devise/passwords#edit
#                          PATCH  /users/password(.:format)                   devise/passwords#update
#                          PUT    /users/password(.:format)                   devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                     devise/registrations#cancel
#        user_registration POST   /users(.:format)                            devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                    devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                       devise/registrations#edit
#                          PATCH  /users(.:format)                            devise/registrations#update
#                          PUT    /users(.:format)                            devise/registrations#update
#                          DELETE /users(.:format)                            devise/registrations#destroy
#                     home GET    /home(.:format)                             pages#home
#                    about GET    /about(.:format)                            pages#about
#           category_posts GET    /categories/:category_id/posts(.:format)    posts#index
#             edit_profile GET    /profile/edit(.:format)                     profile#edit
#                  profile GET    /profile(.:format)                          profile#show
#                          PATCH  /profile(.:format)                          profile#update
#                          PUT    /profile(.:format)                          profile#update
#            post_comments GET    /posts/:post_id/comments(.:format)          comments#index
#                          POST   /posts/:post_id/comments(.:format)          comments#create
#         new_post_comment GET    /posts/:post_id/comments/new(.:format)      comments#new
#        edit_post_comment GET    /posts/:post_id/comments/:id/edit(.:format) comments#edit
#             post_comment GET    /posts/:post_id/comments/:id(.:format)      comments#show
#                          PATCH  /posts/:post_id/comments/:id(.:format)      comments#update
#                          PUT    /posts/:post_id/comments/:id(.:format)      comments#update
#                          DELETE /posts/:post_id/comments/:id(.:format)      comments#destroy
#                    posts GET    /posts(.:format)                            posts#index
#                          POST   /posts(.:format)                            posts#create
#                 new_post GET    /posts/new(.:format)                        posts#new
#                edit_post GET    /posts/:id/edit(.:format)                   posts#edit
#                     post GET    /posts/:id(.:format)                        posts#show
#                          PATCH  /posts/:id(.:format)                        posts#update
#                          PUT    /posts/:id(.:format)                        posts#update
#                          DELETE /posts/:id(.:format)                        posts#destroy
#                     root GET    /                                           pages#home
#

Rails.application.routes.draw do
  devise_for :users

  scope "(:locale)", locale: /en|es/ do
    get 'home' => "pages#home"
    get 'about' => "pages#about"
  end

  resources :categories, only: :none do
    resources :posts, only: [:index]
  end

  resource :profile, only: [:show, :edit, :update], controller: :profile

  resources :posts do
      resources :comments, only: [:create, :destroy], module: :posts
  end

  resources :movies do
    resources :comments, only: [:create, :destroy], module: :movies
  end

  root to: "pages#home"

end
