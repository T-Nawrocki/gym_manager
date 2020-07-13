require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../gym_class"

class TestGymClass < MiniTest::Test

    def setup
        @class1 = GymClass.new({
            "id" => "1",
            "name" => "Volleyball",
            "trainer_name" => "Ukai",
            "available_times" => "{'Mon 12:30','Tue 15:45','Sat 18:00'}"
        })
        @class2 = GymClass.new({
            "name" => "HIIT",
            "trainer_name" => "Washijo"
        })
    end


    # INITIALISATION
    def test_has_id__id_exists
        assert_equal(1, @class1.id)
    end

    def test_has_id__id_does_not_exist
        assert_nil(@class2.id)
    end

    def test_has_name
        assert_equal("Volleyball", @class1.name)
    end

    def test_has_trainer_name
        assert_equal("Ukai", @class1.trainer_name)
    end

    def test_has_available_times__explicit
        assert_equal(
            ["Mon 12:30", "Tue 15:45", "Sat 18:00"],
            @class1.available_times
        )
    end
    
    # def test_available_times_conversion_reversed
    #     assert_equal(
    #         "{'Mon 12:30','Tue 15:45','Sat 18:00'}",
    #         SqlRunner.convert_to_sql_array(@class1.available_times)
    #     )
    # end

    def test_has_available_times__default
        assert_equal([], @class2.available_times)
    end

end
