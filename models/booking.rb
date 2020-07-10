class Booking
    
    attr_reader :id, :member_id, :gym_class_id, :time

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @member_id = options["member_id"].to_i
        @gym_class_id = options["gym_class_id"].to_i
        @time = options["time"]
    end

end
