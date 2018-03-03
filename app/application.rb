class Application < Item

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      is_item = @@item.find{|s| s.name == item_name}
      if @@item.include?(is_item)
        resp.write is_item.price
      else
        resp.status = 400
      end
    else
      resp.status = 404
    end
    resp.finish
  end
end
