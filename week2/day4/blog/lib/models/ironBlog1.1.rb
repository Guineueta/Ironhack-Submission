require 'pry'


class Post

  attr_reader :title, :date, :text, :sponsor
  def initialize (title, date, text, sponsor="")
    @title = title
    @date = date
    @text = text
    @sponsor = sponsor
  end
end

class Blog

attr_accessor :post_list

def initialize(post_list=[])
  @post_list = post_list
  @blogs_per_page = 3 #numero de post por pagina
  @num_pages_blog = (post_list.length.to_f/ @blogs_per_page).ceil
  @current_page = 1
  @first_blogs_to_display = 0
  @user_action = ""
end

def current_page
  case @user_action
    when"next"
     if @current_page == @num_pages_blog
      @current_page = 1
    else
      @current_page +=1
    end
    when "back"
      if @current_page == 1
       @current_page = @num_pages_blog
     else
       @current_page -=1
     end
   else
     @current_page
   end
 end

 def blogs_to_display
   @first_blogs_to_display = (@current_page * @blogs_per_page)-(@blogs_per_page)
 end

  def add(post)
    @post_list.push(post)
  end

  def sort
    @post_list = @post_list.sort { |dt1,dt2| dt2.date <=> dt1.date}
  end

  def delete(post)
    @post_list.delete(post)
    @post_list
  end
end

# module Blog_display
#
#     def current_page
#       case @user_action
#         when"next"
#          if @current_page == @num_pages_blog
#           @current_page = 1
#         else
#           @current_page +=1
#         end
#         when "back"
#           if @current_page == 1
#            @current_page = @num_pages_blog
#          else
#            @current_page -=1
#          end
#        end
#      end
#      def blogs_to_display
#        @first_blogs_to_display = (@current_page * @blogs_per_page)-(1+@blogs_per_page)
#      end
#   end





list=[
p1 = Post.new("title-1",92011,"aaaaaaaaaaaaaaa"),
p2 = Post.new("title-2",82012,"este no","Moritz"),
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

blog1.delete(p2)
