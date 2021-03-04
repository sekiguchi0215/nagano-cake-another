Rails.application.routes.draw do
  namespace :public do
    get 'homes/about'
  end
	root "public/homes#top"

	devise_for :members, controllers: {
		sessions:       "members/sessions",
		passwords:      "members/passwords",
		registrations:  "members/registrations"
	}
end
