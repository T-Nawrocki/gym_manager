require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../available_time"

class TestAvailableTime < MiniTest::Test

    def setup
        @available_time1 = AvailableTime.new({
            "id" => "1",
            "gym_class_id" => "1",
            "time" => "Mon 15.30"
        })    
        @available_time2 = AvailableTime.new({
            "gym_class_id" => "2",
            "time" => "Thu 10.00"
        })    
    end


    # INITIALISATION
    def test_has_id__id_exists
        assert_equal(1, @available_time1.id)
    end

    def test_has_id__id_does_not_exist
        assert_nil(@available_time2.id)
    end

    def test_has_gym_class_id
        assert_equal(1, @available_time1.gym_class_id)
    end

    def test_has_time
        assert_equal("Mon 15.30", @available_time1.time)
    end

end
