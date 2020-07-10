require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../member"

class TestMember < MiniTest::Test

    def setup
        @member1 = Member.new({
            "id" => "1",
            "first_name" => "Hinata",
            "last_name" => "Shoyo",
            "preferred_name" =>"Shoyo",
            "age" => "15",
            "join_date" => "10 Jul 2020"
            })
        @member2 = Member.new({
            "first_name" => "Tsukishima",
            "last_name" => "Kei",
            "age" => "15",
            "join_date" => "10 Jul 2020"
            })
    end

    # INITIALISATION
    def test_has_id__id_exists
        assert_equal(1, @member1.id)
    end

    def test_has_id__id_does_not_exist
        assert_nil(@member2.id)
    end

    def test_has_first_name
        assert_equal("Hinata", @member1.first_name)
    end

    def test_has_last_name
        assert_equal("Shoyo", @member1.last_name)
    end

    def test_has_preferred_name__explicit
        assert_equal("Shoyo", @member1.preferred_name)
    end

    def test_has_preferred_name__default
        assert_equal("Tsukishima", @member2.preferred_name)
    end

    def test_has_age
        assert_equal(15, @member1.age)
    end

    def test_has_join_date
        assert_equal("10 Jul 2020", @member1.join_date)
    end

end
