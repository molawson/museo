require "test_helper"

class MuseoTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Museo::VERSION
  end
end
