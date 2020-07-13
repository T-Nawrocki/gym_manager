require_relative "../db/sql_runner"

class GymClass
    
    attr_accessor :name, :trainer_name, :available_times
    attr_reader :id

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

        binding.pry

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
    def update
        sql = "UPDATE gym_classes
        SET (name, trainer_name, available_times)
        = ($1, $2, $3)
        WHERE id = $4"
        available_times_sql = SqlRunner.convert_to_sql_array(@available_times)
        values = [@name, @trainer_name, available_times_sql, @id]
        SqlRunner.run(sql, values)
    end

    # DELETE
    def self.delete_all
        sql = "DELETE FROM gym_classes"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM gym_classes
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    # READ RELATED
    def members
        sql = "SELECT members.* 
        FROM members INNER JOIN bookings
        ON members.id = bookings.member_id
        WHERE gym_class_id = $1"
        values = [@id]

        result = SqlRunner.run(sql, values)
        Member.map_items(result)
    end

    def bookings
        sql = "SELECT * FROM bookings
        WHERE gym_class_id = $1"
        values = [@id]

        result = SqlRunner.run(sql, values)
        Booking.map_items(result)
    end

end
