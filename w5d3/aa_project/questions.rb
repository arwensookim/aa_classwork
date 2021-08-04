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
            User.new(user.first)
        end
    end

    def initialize(new_option)
        @id = new_option['id']
        @fname = new_option['fname']
        @lname = new_option['lname']
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            fname = ? AND lname = ?
        SQL
        if user.length < 1
            return nil
        else
            User.new(user.first)
        end
    end

    def authored_questions
        Questions.find_by_author_id(id)
    end

    def authored_replies
        Reply.find_by_user_id(id)
    end

    def insert
        raise "#{self} is already in the database" if self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.fname, self.lname)
            INSERT INTO
                users(fname, lname)
            VALUES
                (?,?,?)
        SQL
        id = QuestionsDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.fname, self.lname)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
    end
end

class Question
    attr_accessor :id, :title, :body, :author_id
    def self.all
        questions = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
        questions.map { |question| Question.new(question)}
    end


    def self.find_by_id(id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE 
            id = ?
        SQL
        if question.length < 1
            return nil
        else
            Question.new(question.first)
        end
    end

    def initialize(new_option)
        @id = new_option['id']
        @title = new_option['title']
        @body = new_option['body']
        @author_id = new_option['author_id']
    end

    def self.find_by_author_id(author_id)
        author = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE 
            author_id = ?
        SQL
        author.map {|author_question| Question.new(author_question)}
    end

    def insert
        raise "#{self} is already in the database" if self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.title, self.body, self.author_id)
            INSERT INTO
                questions(title, body, author_id)
            VALUES
                (?,?,?)
        SQL
        id = QuestionsDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.title, self.body, self.author_id)
      UPDATE
        questions
      SET
        title = ?, body = ?, author_id = ?
      WHERE
        id = ?
        SQL
    end

    def author
        User.find_by_id(author_id)
    end

    def replies
        Reply.find_by_question_id
    end
end

class QuestionFollow
    def self.find_by_id
    end
end

# class Reply
#     def self.find_by_id
#     end
# end

# class QuestionLike
#     def self.find_by_id
#     end
# end