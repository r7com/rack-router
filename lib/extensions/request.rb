class Rack::Request
  alias _params params
  def params
    _params.merge(env['rack.route_params'])
  end
end
