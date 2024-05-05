require 'minitest/autorun'

class SampleTest < Minitest::SampleTest
  def test_sample
    assert_equal 'RUBY', 'ruby'.upcase
  end
end

# aがbと等しければパスする
assert_equal b, a

# aが真であればパスする
assert a

# aが偽であればパスする
refute a