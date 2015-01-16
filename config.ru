require 'rack/router'
require 'rack/lobster'

hello = ->(env) do
  request = Rack::Request.new(env)
  [
    200,
    { "Content-Type" => "text/html" },
    ["<h1>Hello, #{request.params['name']}</h1><br/><h2>Params</h2><br/>#{request.params.inspect}"]
  ]
end

router = Rack::Router.new do
  get "/hello/:name" => hello
  get "/lobster" => Rack::Lobster.new, :as => "lobster"
end

run router
