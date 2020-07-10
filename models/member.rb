class Member

    attr_reader :id, :first_name, :last_name, :preferred_name, :age, :join_date

    def initialize(options)
        @id = options["id"] if options["id"].to_i
        @first_name = options["first_name"]
        @last_name = options["last_name"]
        @preferred_name = options["preferred_name"] ? options["preferred_name"] : options["first_name"]
        @age = options["age"].to_i
        @join_date = options["join_date"]
    end

end
