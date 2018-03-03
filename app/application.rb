class Application < Item

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      @@item.each do |item|
        if @@item.include?(item)
          resp.write "#{item}"
        else
          resp.status = 400
        end
      end
    else
      resp.status = 404
    end
    resp.finish
  end
end
