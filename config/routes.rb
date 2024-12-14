Rails.application.routes.draw do
  resources :personas do
    member do
      get :vivienda_actual
      get :viviendas_propietarias
    end
  end

  resources :viviendas do
    member do
      get :habitantes
      get :propietarios
      get :municipio
    end
  end

  resources :municipios do
    member do
      get :viviendas
      get :alcaldia_activa
    end
  end

  resources :alcaldias
  resources :roles
end
