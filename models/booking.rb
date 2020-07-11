require_relative "../db/sql_runner"

class Booking
    
    attr_reader :id, :member_id, :gym_class_id, :time

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @member_id = options["member_id"].to_i
        @gym_class_id = options["gym_class_id"].to_i
        @time = options["time"]
    end


    # === CRUD METHODS ===
    # CREATE
    def save
        sql = "INSERT INTO bookings
        (member_id, gym_class_id, time)
        VALUES ($1, $2, $3)
        RETURNING id"
        values = [@member_id, @gym_class_id, @time]

        result = SqlRunner.run(sql, values).first
        @id = result["id"].to_i
    end
    
    # READ

    def self.find(id)
        sql = "SELECT * FROM bookings
        WHERE id = $1"
        values = [id]

        result = SqlRunner.run(sql, values).first
        result ? Booking.new(result) : nil
    end

    # UPDATE

    # DELETE
    def self.delete_all
        sql = "DELETE FROM bookings"
        SqlRunner.run(sql)
    end

end
