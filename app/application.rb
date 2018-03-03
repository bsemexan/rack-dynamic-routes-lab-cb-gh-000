class Application < Item

  @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      is_item = @@items.find{|s| s.name == item_name}
      if @@items.include?(is_item)
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
