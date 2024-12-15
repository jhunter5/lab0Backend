Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://lab0-limitless.vercel.app/', 'https://lab0-limitless.vercel.app/', 'http://localhost:3000'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
