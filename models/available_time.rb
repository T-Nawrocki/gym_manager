class AvailableTime
    
    attr_reader :id, :gym_class_id, :time

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @gym_class_id = options["gym_class_id"].to_i
        @time = options["time"]
    end

end
