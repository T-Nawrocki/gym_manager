require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../session"

class TestSession < MiniTest::Test

    def setup
        @session1 = Session.new({
            "id" => "1",
            "gym_class_id" => "1",
            "day" => "1",
            "time" => "15:30"
        })    
        @session2 = Session.new({
            "gym_class_id" => "2",
            "day" => "4",
            "time" => "10:00"
        })    
    end


    # INITIALISATION
    def test_has_id__id_exists
        assert_equal(1, @session1.id)
    end

    def test_has_id__id_does_not_exist
        assert_nil(@session2.id)
    end

    def test_has_gym_class_id
        assert_equal(1, @session1.gym_class_id)
    end

    def test_has_day
        assert_equal(1, @session1.day)
    end

    def test_has_time
        assert_equal("15:30", @session1.time)
    end

    # OTHER
    def test_has_day_display
        assert_equal("Monday", @session1.day_display)
    end

end
