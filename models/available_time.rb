require_relative "../db/sql_runner"

class AvailableTime
    
    attr_reader :id, :gym_class_id, :day, :time

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @gym_class_id = options["gym_class_id"].to_i
        @day = options["day"].to_i
        @time = options["time"]
    end


    # === CRUD METHODS ===
    # CREATE
    def save
        sql = "INSERT INTO available_times
        (gym_class_id, day, time)
        VALUES ($1, $2, $3)
        RETURNING id"
        values = [@gym_class_id, @day, @time]

        result = SqlRunner.run(sql, values).first
        @id = result["id"].to_i
    end

    # READ
    # Omitted—available times will only be read as part of GymClass.times

    # UPDATE
    # Omitted—design decision to only allow creation/deletion

    # DELETE
    def self.delete_all
        sql = "DELETE FROM available_times"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM available_times
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

end
