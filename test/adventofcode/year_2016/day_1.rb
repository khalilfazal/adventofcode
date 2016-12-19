require_all 'lib/adventofcode/year_2016/day_1/*'
require 'monkey_patches/omission'

class Year_2016::Day_1_Test < Test::Unit::TestCase
  def test_left_north
    assert_same Compass::NORTH.left, Compass::WEST
  end

  def test_private_set_neighbours
    assert_raise NoMethodError do
      Compass::NORTH.set_neighbours Compass::WEST, Compass::EAST
    end
  end

  def test_cycle_from
    assert_equal Compass::NORTH.cycle_from, [
        Compass::NORTH,
        Compass::EAST,
        Compass::SOUTH,
        Compass::WEST
    ]
  end

  def test_origin
    assert_same 0, Point.origin.x
    assert_same 0, Point.origin.y
  end

  def test_example_1
    assert_equal 5, Traveller.endpoint_distance('R2, L3')
  end

  def test_example_2
    assert_equal 2, Traveller.endpoint_distance('R2, R2, R2')
  end

  def test_example_3
    assert_equal 12, Traveller.endpoint_distance('R5, L5, R5, R3')
  end

  def test_star_1
    omit_when_dced do
      assert_equal 236, Traveller.endpoint_distance
    end
  end

  def test_example_4
    assert_equal 4, Traveller.twice_visited_distance('R8, R4, R4, R8')
  end

  def test_star_2
    omit_when_dced do
      assert_equal 182, Traveller.twice_visited_distance
    end
  end
end