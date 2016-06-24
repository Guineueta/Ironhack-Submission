class T

  def initialize(username,password)
    @user_array = [username,password]
    @users = {
      u1:["Mike","123"],
      u2:["Jorge","456"],
      u3:["David","789"]
    }
  end

  def authen
    authen ="out"
    @users.each do |user, array|
      if array == @user_array
        authen = "in"
      end
    end
    authen
  end

end
