require_relative "../db/sql_runner.rb"

class Member

    attr_reader :id, :first_name, :last_name, :preferred_name, :age, :join_date

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @first_name = options["first_name"]
        @last_name = options["last_name"]
        @preferred_name = options["preferred_name"] ? options["preferred_name"] : options["first_name"]
        @age = options["age"].to_i
        @join_date = options["join_date"]
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

    # UPDATE

    # DELETE
    def self.delete_all
        sql = "DELETE FROM members"
        SqlRunner.run(sql)
    end

end
