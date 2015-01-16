module Rack
  class Request
    alias _params params if method_defined? :params
    def params
      data = _params rescue {}
      data.merge(env['rack.route_params'])
    end
  end
end