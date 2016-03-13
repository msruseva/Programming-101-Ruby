require 'sinatra'

class Post
  attr_reader :id, :title, :content

  def initialize(id, title, content)
    @id = id
    @title = title
    @content = content
  end

end

posts = []
counter = 0

get '/' do
  posts.map {|e| "#{e.title} има съдържание #{e.content}"}.join(', ')
end

get '/new' do
  erb :style
end

get '/:id' do
  post = posts.find{ |post| post.id == params[:id].to_i }
  #erb :posts
  <<-HTML
    <h2>#{post && post.title} </h2>
    <p>#{post && post.content} </p>
  HTML
end


post '/new' do
  posts << Post.new(counter += 1, params[:title], params[:content])
  redirect '/'
end

delete '/:id' do
  posts.each do |post|
    post.id == params[:id].to_i
    posts[0] = post.id
  end

  posts.slice!(0)
end
