Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://tu-front-end-domain.com', 'http://localhost:3000' # Cambia esto por el dominio del frontend y otros dominios necesarios

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
