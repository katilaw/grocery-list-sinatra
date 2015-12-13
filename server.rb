require 'pry'
require 'csv'
require 'sinatra'

get '/groceries' do
  @grocery_list = CSV.readlines("grocery_list.csv", headers: true)

  erb :index
end

post "/groceries" do
  grocery_list = params["grocery_list"]
  unless params["grocery_number"].empty?
    grocery_number = params["grocery_number"]
  else
    grocery_number = "1"
  end


  unless grocery_list.strip.empty?
    CSV.open("grocery_list.csv","a") do |file|
      file << [ grocery_list, grocery_number]
    end
  end
  redirect "/groceries"
end

get '/' do
  redirect '/groceries'
end
