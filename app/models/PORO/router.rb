class Router < ActionDispatch::Routing::Mapper
  def initialize(controller)
    get "/#{controller}/find_all", to: "#{controller}#search_all"
    get "/#{controller}/find", to: "#{controller}#search"
    get "/#{controller}/random", to: "#{controller}#random"
  end
end
