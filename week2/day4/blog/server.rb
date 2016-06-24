require "sinatra"
require "sinatra/reloader"
require "./lib/models/ironBlog1.1.rb"
require "pry"



list=[
p1 = Post.new("title-1",92011,"aaaaaaaaaaaaaaa"),
p2 = Post.new("title-2",82012,"bbbbbbbbbbbbbbb","Moritz"),
p3 = Post.new("title-3",72013,"ccccccccccccccc"),
p4 = Post.new("title-4",62014,"ddddddddddddddd"),
p5 = Post.new("title-5",52009,"eeeeeeeeeeeeeee"),
p6 = Post.new("title-6",42001,"aaaaaaaaaaaaaaa"),
p7 = Post.new("title-7",32022,"bbbbbbbbbbbbbbb","Damm"),
p8 = Post.new("title-8",21993,"ccccccccccccccc"),
p9 = Post.new("title-9",11994,"ddddddddddddddd"),
p10 = Post.new("title-10",1994,"ddddddddddddddd"),
p11 = Post.new("title-11",219,"ccccccccccccccc"),
p12= Post.new("title-12",11,"ddddddddddddddd"),
p13 = Post.new("title-13",1,"ddddddddddddddd")
]

blog1 = Blog.new(list)


get "/" do

  @post_list = blog1.post_list
  @current_page = blog1.current_page
  @first_blogs_to_display = blog1.blogs_to_display

  @title1 = @post_list[@first_blogs_to_display].title
  @date1 = @post_list[@first_blogs_to_display].date
  @sponsor1 = @post_list[@first_blogs_to_display].sponsor
  @text1 = @post_list[@first_blogs_to_display].text

  @title2 = @post_list[@first_blogs_to_display+1].title
  @date2 = @post_list[@first_blogs_to_display+1].date
  @sponsor2 = @post_list[@first_blogs_to_display+1].sponsor
  @text2 = @post_list[@first_blogs_to_display+1].text

  @title3 = @post_list[@first_blogs_to_display+2].title
  @date3 = @post_list[@first_blogs_to_display+2].date
  @sponsor3 = @post_list[@first_blogs_to_display+2].sponsor
  @text3 = @post_list[@first_blogs_to_display+2].text



  erb :home

end
