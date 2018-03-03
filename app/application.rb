class Application < Item

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/items"
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
  end
end
