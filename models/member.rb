require_relative "../db/sql_runner.rb"

class Member

    attr_accessor :first_name, :last_name, :preferred_name, :age, :join_date
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @first_name = options["first_name"]
        @last_name = options["last_name"]
        @preferred_name = 
            if options["preferred_name"]
                options["preferred_name"]
            else
                options["first_name"]
            end
        @age = options["age"].to_i
        @join_date = options["join_date"]
    end

    def self.map_items(data)
        data.map { |member| Member.new(member) }
    end


    # === CRUD METHODS ===
    # CREATE
    def save
        sql = "INSERT INTO members 
        (first_name, last_name, preferred_name, age, join_date)
        VALUES ($1, $2, $3, $4, $5)
        RETURNING id"
        values = [@first_name, @last_name, @preferred_name, @age, @join_date]

        result = SqlRunner.run(sql, values).first
        @id = result["id"].to_i
    end

    # READ
    def self.all
        sql = "SELECT * FROM members"
        result = SqlRunner.run(sql)
        self.map_items(result)
    end

    def self.find(id)
        sql = "SELECT * FROM members
        WHERE id = $1"
        values = [id]

        result = SqlRunner.run(sql, values).first
        result ? Member.new(result) : nil
    end

    # UPDATE
    def update
        sql = "UPDATE members
        SET (first_name, last_name, preferred_name, age, join_date)
        = ($1, $2, $3, $4, $5)
        WHERE id = $6"
        values = [
            @first_name, 
            @last_name, 
            @preferred_name, 
            @age, 
            @join_date, 
            @id
        ]
        SqlRunner.run(sql, values)
    end

    # DELETE
    def self.delete_all
        sql = "DELETE FROM members"
        SqlRunner.run(sql)
    end

end
