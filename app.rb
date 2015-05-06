require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
#require('spec_helper')
require('./lib/train')
require('./lib/city')
require('pg')

DB = PG.connect({:dbname => "train_schedule_test"})

get("/") do
  erb(:index)
end

get("/trains") do
  @trains = Train.all()
  erb(:trains)
end

get("/trains_form") do
  erb(:trains_form)
end

post("/trains") do
  name = params.fetch("name")
  train = Train.new({:name => name, :id => nil})
  train.save()
  @trains = Train.all()
  erb(:trains)
end
