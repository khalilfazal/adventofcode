require 'adventofcode'
require 'require_all'
require 'test/unit'

class Adventofcode_Test < Test::Unit::TestCase
  def test_private_cookie
    assert_raise NameError do
      Adventofcode::COOKIE
    end
  end
end