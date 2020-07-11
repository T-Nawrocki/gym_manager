require_relative "../db/sql_runner"

class GymClass
    
    attr_reader :id, :name, :trainer_name, :available_times

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @trainer_name = options["trainer_name"]
        @available_times =
            if options["available_times"]
                SqlRunner.convert_to_ruby_array(options["available_times"])
            else
                []
            end
    end


    # === CRUD METHODS ===
    # CREATE
    def save
        sql = "INSERT INTO gym_classes
        (name, trainer_name, available_times)
        VALUES ($1, $2, $3)
        RETURNING id"
        available_times_sql = SqlRunner.convert_to_sql_array(@available_times)
        values = [@name, @trainer_name, available_times_sql]

        result = SqlRunner.run(sql, values).first
        @id = result["id"].to_i
    end

end
