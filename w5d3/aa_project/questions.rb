require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
    attr_accessor :id, :fname, :lname
    
    def self.all
        user = QuestionsDBConnection.instance.execute("SELECT * FROM users")
        user.map { |person| User.new(person)}
    end


    def self.find_by_id(id)
        user = QuestionsDBConnection.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users
        WHERE 
            id = ?
        SQL
        if user.length < 1
            return nil
        else
            User.new(user.first) # user? user.first?
        end
    end

    def initialize(new_option)
        @id = new_option['id']
        @fname = new_option['fname']
        @lname = new_option['lname']
    end

    
end

# class Question
#     def self.find_by_id
#     end
# end

# class QuestionFollow
#     def self.find_by_id
#     end
# end

# class Reply
#     def self.find_by_id
#     end
# end

# class QuestionLike
#     def self.find_by_id
#     end
# end