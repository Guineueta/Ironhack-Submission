class Blog

  def initialize(post_list,num_post_page=3)
    @post_list = post_list
    @num_post_page = num_post_page
  end

  def publish_front_page
    nB = @num_post_page #numero de post por pagina
    pages = (@post_list.length.to_f/ nB).ceil

    action=0
    until action == "exit"

          @post_list = @post_list.sort { |dt1,dt2| dt2.date <=> dt1.date}
          nB.times do
            if   @post_list[action]

            @post_list[action].publi
            action+=1
            else
            action+=1
            end
          end

          n = 1
          until n == pages + 1
              if ((action+1)/ nB ) == n
              print " ->#{n}<- "
              n+=1
            else
              print " #{n} "
              n+=1
            end
          end
    puts "\n select page, next, back or exit"
    a = gets.chomp
      if a == "exit"
        action = "exit"
      elsif a == "next"
            if action > (nB*pages)-nB
              action = 0
            else
            action
            end
      elsif a == "back"
            if action == nB
              action = nB*(pages-1)
            else
            action -= (2*nB)
            end
      elsif a.to_i <= pages && a.to_i > 0
      action = (a.to_i)*nB-nB
      else
        puts "wrong input"
        action -= nB
      end
#justo antes de acabar el loop
  end
  end
end

class Post
  attr_reader :title, :date, :text
  def initialize (title,date,text)
    @title = title
    @date = date
    @text = text
  end

  def publi
    puts "---------#{@title}---------"
    puts "****************************************"
    puts "#{@text}"
    puts "---------------------------------------- \n  \n \n  \n"

  end

end

class Sponsored < Blog
  attr_reader :title, :date, :text, :sponsor
  def initialize (title,date,text,sponsor)
    @title = title
    @date = date
    @text = text
    @sponsor = sponsor
  end
  def publi
    puts "-----#{@sponsor}------#{@title}-----#{@sponsor}------"
    puts "****************************************"
    puts "#{@text}"
    puts "----------------------------------------\n  \n \n  \n"
  end
end



list=[
p1 = Post.new("title-1",92011,"aaaaaaaaaaaaaaa"),
p2 = Sponsored.new("title-2",82012,"bbbbbbbbbbbbbbb","Moritz"),
p3 = Post.new("title-3",72013,"ccccccccccccccc"),
p4 = Post.new("title-4",62014,"ddddddddddddddd"),
p5 = Post.new("title-5",52009,"eeeeeeeeeeeeeee"),
p6 = Post.new("title-6",42001,"aaaaaaaaaaaaaaa"),
p7 = Sponsored.new("title-7",32022,"bbbbbbbbbbbbbbb","Damm"),
p8 = Post.new("title-8",21993,"ccccccccccccccc"),
p9 = Post.new("title-9",11994,"ddddddddddddddd"),
p10 = Post.new("title-10",1994,"ddddddddddddddd"),
p11 = Post.new("title-11",219,"ccccccccccccccc"),
p12= Post.new("title-12",11,"ddddddddddddddd"),
p13 = Post.new("title-13",1,"ddddddddddddddd")
]


blog = Blog.new(list,5)

blog.publish_front_page
