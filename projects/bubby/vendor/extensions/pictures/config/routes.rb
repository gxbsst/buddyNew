Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :pictures do
    resources :pictures, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pictures, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :pictures, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
