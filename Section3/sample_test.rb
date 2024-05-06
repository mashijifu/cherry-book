require 'minitest/autorun'

class SampleTest < Minitest::Test
  def test_sample
    # assert_equal 'RUBY', 'ruby'.upcase
    assert_equal 'RUBY', 'ruby'.capitalize
  end
end

# aがbと等しければパスする
# assert_equal b, a

# aが真であればパスする
# assert a

# aが偽であればパスする
# refute a
