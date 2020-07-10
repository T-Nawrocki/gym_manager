require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../booking"

class TestBooking < MiniTest::Test

    def setup
        @booking1 = Booking.new({
            "id" => "1",
            "member_id" => "2",
            "gym_class_id" => "3",
            "time" => "Mon 15:30"
        })
        @booking2 = Booking.new({
            "member_id" => "4",
            "gym_class_id" => "25",
            "time" => "Wed 09:00"
        })
    end


    # INITIALISATION
    def test_has_id__id_exists
        assert_equal(1, @booking1.id)
    end

    def test_has_id__id_does_not_exist
        assert_nil(@booking2.id)
    end

    def test_has_member_id
        assert_equal(2, @booking1.member_id)
    end

    def test_has_gym_class_id
        assert_equal(3, @booking1.gym_class_id)
    end

    def test_has_time
        assert_equal("Mon 15:30", @booking1.time)
    end

end
