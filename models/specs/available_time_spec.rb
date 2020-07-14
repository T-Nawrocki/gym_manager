require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../available_time"

class TestAvailableTime < MiniTest::Test

    def setup
        @available_time1 = AvailableTime.new({
            "id" => "1",
            "gym_class_id" => "1",
            "day" => "1",
            "time" => "15:30"
        })    
        @available_time2 = AvailableTime.new({
            "gym_class_id" => "2",
            "day" => "4",
            "time" => "10:00"
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

    def test_has_day
        assert_equal(1, @available_time1.day)
    end

    def test_has_time
        assert_equal("15:30", @available_time1.time)
    end

end
