require_relative "../db/sql_runner"
require_relative "member"
require_relative "gym_class"

class Booking
    
    attr_accessor :member_id, :gym_class_id, :time
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @member_id = options["member_id"].to_i
        @gym_class_id = options["gym_class_id"].to_i
        @time = options["time"]
    end

    def self.map_items(data)
        data.map { |booking| self.new(booking) }
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
    def self.all
        sql = "SELECT * FROM bookings"
        result = SqlRunner.run(sql)
        self.map_items(result)
    end

    def self.find(id)
        sql = "SELECT * FROM bookings
        WHERE id = $1"
        values = [id]

        result = SqlRunner.run(sql, values).first
        result ? Booking.new(result) : nil
    end

    # UPDATE
    def update
        sql = "UPDATE bookings
        SET (member_id, gym_class_id, time)
        = ($1, $2, $3)
        WHERE id = $4"
        values = [@member_id, @gym_class_id, @time, @id]
        SqlRunner.run(sql, values)
    end

    # DELETE
    def self.delete_all
        sql = "DELETE FROM bookings"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM bookings
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end 

    # READ RELATED
    def gym_class
        GymClass.find(@gym_class_id)
    end

    def member
        Member.find(@member_id)
    end

end
