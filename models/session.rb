require_relative "../db/sql_runner"

class Session
    
    attr_reader :id, :gym_class_id, :day, :time

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @gym_class_id = options["gym_class_id"].to_i
        @day = options["day"].to_i
        @time = options["time"]
    end

    def day_display
        case @day
        when 1
            "Monday"
        when 2
            "Tuesday"
        when 3
            "Wednesday"
        when 4
            "Thursday"
        when 5
            "Friday"
        when 6
            "Saturday"
        when 7
            "Sunday"          
        end
    end


    # === CRUD METHODS ===
    # CREATE
    def save
        sql = "INSERT INTO sessions
        (gym_class_id, day, time)
        VALUES ($1, $2, $3)
        RETURNING id"
        values = [@gym_class_id, @day, @time]

        result = SqlRunner.run(sql, values).first
        @id = result["id"].to_i
    end

    # READ
    # Omitted—sessionswill only be read as part of GymClass.sessions

    # UPDATE
    # Omitted—design decision to only allow creation/deletion

    # DELETE
    def self.delete_all
        sql = "DELETE FROM sessions"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM sessions
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

end
