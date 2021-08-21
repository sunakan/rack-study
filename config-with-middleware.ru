################################################################################
# [Browser: Google Chrome]          <->
# [Web Server: Nginx]               <->
# [Application Server: Puma]        <->
# [Middleware: Rack]                <->
# [Rack Middleware1: ????]          <->
# [Rack Middleware2: ????]          <->
# [Rack Middleware3...: ????]       <->
# [Rack Endpoint: Rack Application]
################################################################################

class RackEndpoint
  def call(env)
    status_code      = 200
    response_headers = { "Content-Type" => "text/plain" }
    response_body    = ["Hello Rack!"]
    [status_code, response_headers, response_body]
  end
end

# Rack Middlewareは以下の条件を満たす必要がある
# - classである
# - initializeでappを受け取る
# - callメソッドを実装
#   - Status/Headers/Bodyを返す(Rack Endpointと同じ条件)
class RackMiddleware1
  def initialize(app)
    @app = app
  end
  def call(env)
    status_code, headers, body = @app.call(env)
    new_body = ["りんご"] + body
    [
      status_code,
      headers,
      new_body,
    ]
  end
end

class RackMiddleware2
  def initialize(app)
    @app = app
  end
  def call(env)
    status_code, headers, body = @app.call(env)
    new_body = ["ばなな"] + body
    [
      status_code,
      headers,
      new_body,
    ]
  end
end

class RackMiddleware3
  def initialize(app)
    @app = app
  end
  def call(env)
    status_code, headers, body = @app.call(env)
    new_body = ["みかん"] + body
    [
      status_code,
      headers,
      new_body,
    ]
  end
end



# useの順番で変わるので注意
use RackMiddleware1
use RackMiddleware2
use RackMiddleware3
run RackEndpoint.new
