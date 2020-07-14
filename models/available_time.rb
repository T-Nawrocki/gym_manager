class AvailableTime
    
    attr_reader :id, :gym_class_id, :day, :time

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @gym_class_id = options["gym_class_id"].to_i
        @day = options["day"].to_i
        @time = options["time"]
    end


    # 

end
