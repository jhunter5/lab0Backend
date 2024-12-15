Rails.application.routes.draw do
  resources :personas do
    member do
      get :vivienda_actual
      get :viviendas_propietarias
      get :empleado
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
      get :alcaldia
      get :alcalde
    end
  end

  resources :alcaldias do
    member do
      get :empleados
    end
  end

  resources :roles do
    member do
      get :empleados
    end
  end
end
