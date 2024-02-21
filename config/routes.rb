Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :restaurants, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:new, :create]
  end
  # resources :reviews insofar INDEPENDENT from parent (eg destroy)

end

# -- ROUTES
# restaurants             GET  /restaurants(.:format)                             restaurants#index
# new_restaurant          GET  /restaurants/new(.:format)                         restaurants#new
#                         POST /restaurants(.:format)                             restaurants#create
# restaurant              GET  /restaurants/:id(.:format)                         restaurants#show
# restaurant_reviews      POST /restaurants/:restaurant_id/reviews(.:format)      reviews#create
# new_restaurant_review   GET  /restaurants/:restaurant_id/reviews/new(.:format)  reviews#new

# -- USER STORIES
# [X] A visitor can see the list of all restaurants. - GET "restaurants"
# [X] A visitor can add a new restaurant, and be redirected to the show view of that new restaurant. - GET "restaurants/new" - POST "restaurants"
# [X] A visitor can add a new review to a restaurant - GET "restaurants/38/reviews/new" - POST "restaurants/38/reviews"
# [X] A visitor can see the details of a restaurant, with all the reviews related to the restaurant. - GET "restaurants/38"
# * Hint: to handle the route GET "restaurants/38/reviews/new", you will have to use nested resources. *

# Coding in Silo: Route/Controller/View
# Implement each user story separately! Start by writing the route (you can look at the routes above 😉), then coding the corresponding controller action and finally the view.
