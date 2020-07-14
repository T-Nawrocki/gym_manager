class Helper
    
    def self.all_answered?(data)
        # returns false if data contains empty strings, else true
        !data.values.include?("")
        binding.pry  # TODO REMOVE
    end

end
