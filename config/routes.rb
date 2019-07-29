Rails.application.routes.draw do
  # [...]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stories, only: [:index, :show, :update]
    end
  end
end
