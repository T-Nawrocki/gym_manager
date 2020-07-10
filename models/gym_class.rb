class GymClass
    
    attr_reader :id, :name, :trainer_name, :available_times

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @trainer_name = options["trainer_name"]
        @available_times = options["available_times"] ? options["available_times"] : []
    end

end
