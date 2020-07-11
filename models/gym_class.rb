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

    def self.map_items(data)
        data.map { |gym_class| GymClass.new(gym_class) }
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

    # READ

    def self.all
        sql = "SELECT * FROM gym_classes"
        result = SqlRunner.run(sql)
        self.map_items(result)
    end

    def self.find(id)
        sql = "SELECT * FROM gym_classes
        WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first
        result ? GymClass.new(result) : nil
    end

    # UPDATE

    # DELETE
    def self.delete_all
        sql = "DELETE FROM gym_classes"
        SqlRunner.run(sql)
    end

end
