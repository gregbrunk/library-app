Rails.application.routes.draw do
	# Users and Auth
	root to: "users#index"
	get "/users", to: "users#index", as: "users"
	get "/users/new", to: "users#new", as: "new_user"
	post "/users", to: "users#create"
	get "/users/:id", to: "users#show", as: "user"
	get "/sign_in", to: "sessions#new", as: "new_session"
	post "/sessions", to: "sessions#create"
	delete "/sessions", to: "sessions#destroy", as: "logout"

	# Libraries
	get "/libraries", to: "libraries#index", as: "libraries"
	get "/libraries/new", to: "libraries#new", as: "new_library"
	post "/libraries", to: "libraries#create", as: "create_library"
	get "libraries/:id", to: "libraries#show", as: "library"
	get "libraries/:id/edit", to: "libraries#edit", as: "edit_library"
	patch "libraries/:id", to: "libraries#update", as: "update_library"
	delete "libraries/:id", to: "libraries#destroy", as: "destroy_library"

	# Library Users
	get "/users/:user_id/libraries", to: "library_users#index", as: "user_libraries"
	post "/libraries/:library_id/users", to: "library_users#create", as: "library_users"
end
