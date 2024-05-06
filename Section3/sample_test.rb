require 'minitest/autorun'

class SampleTest < Minitest::Test
  def test_sample
    # テスト結果が成功する検証コード
    # assert_equal 'RUBY', 'ruby'.upcase

    # テスト結果が失敗する検証コード
    # assert_equal 'RUBY', 'ruby'.capitalize

    # テスト結果がエラーになる検証コード
    assert_equal 'RUBY', nil.upcase
  end
end

# aがbと等しければパスする
# assert_equal b, a

# aが真であればパスする
# assert a

# aが偽であればパスする
# refute a
