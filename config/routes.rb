Rails.application.routes.draw do

	  devise_for :users

	  namespace :main do
			get 'index' => 'page#index', :as => 'index'
			get 'theme' => 'page#theme', :as => 'theme'
	  end

		namespace :admin do
			root :to => "dim_regions#index"
	    AdminRouter.load.each do |r|
	    	obj_model = r.model_name
				resources obj_model.route_key.to_sym do
					collection do
						get :import
						post :do_import
					end
				end
	    end
	  end

		root :to => 'main/page#index'
end
