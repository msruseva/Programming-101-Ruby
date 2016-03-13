require 'sinatra'

class Post
  attr_reader :id, :title, :post

  def initialize(id, title, post)
    @id = id
    @title = title
    @post = post
  end

end

posts = []

get '/' do
  posts.map {|e| "#{e.title} има съдържание #{e.post}"}.join(', ')
end

get '/new' do
  erb :style
end

get '/id' do

end

post '/new' do
  posts << Post.new(0, params[:title], params[:post])
  redirect '/'
end
