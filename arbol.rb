require "pry"
class User
    attr_accessor :id
    attr_accessor :username
    attr_accessor :parent_id

    def initialize(username, id)
        self.id = id
        self.username = username
        self.parent_id = nil
    end
end

class UnilevelTree
    @users = []
    @tree = nil

    def self.init_tree
        main = User.new('main',0)
        @users << main
        (1..12).each do |i|
            @users << User.new("user#{i}",i)
        end
        @tree = main
    end

    #TODO
    def self.load_users
        limit = 3
        main_user = @tree
        users = []
        user_index = 0
        @users.each_with_index do |user, index|
          if user.parent_id.nil?
            @users[index].parent_id = main_user.id
          end
          if index % limit == 0 && index != 0
            user_index += 1
            main_user = @users[user_index]
          end
        end
        p @users
      end
      #TODO
      def self.same_line?(user_id_a, user_id_b)
        user_a = @users.select{ |u| u.id == user_id_a }.first
        user_b = @users.select{ |u| u.id == user_id_b }.first
        return user_a.parent_id == user_b.parent_id
      end

end

UnilevelTree.init_tree
UnilevelTree.load_users
puts UnilevelTree.same_line?(0,1)
puts UnilevelTree.same_line?(0,2)
puts UnilevelTree.same_line?(0,3)
puts UnilevelTree.same_line?(0,4)
puts UnilevelTree.same_line?(2,0)