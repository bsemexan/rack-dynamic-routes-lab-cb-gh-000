class Application < Item

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path"/items"
    else
      resp.status = 404
  end
end
