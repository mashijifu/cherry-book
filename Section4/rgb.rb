# to_hexメソッド
def to_hex(r, g, b)
  hex = "#"

  [r, g, b].each do |n|
    hex += n.to_s(16).rjust(2, "0")
  end

  hex

  # sumメソッドを使用してリファクタリング
  # [r, g, b].sum("#") do |n|
  #   n.to_s(16).rjust(2, "0")
  # end
end

# to_intsメソッド
def to_ints(hex)
  r, g, b = hex[1..2], hex[3..4], hex[5..6]

  [r, g, b].map(&:hex)

  # scanメソッドを使用してリファクタリング
  # hex.scan(/\w\w/).map(&:hex)
end

# エンドレスメソッド定義を使用したto_intsメソッド
# def to_ints(hex) = hex.scan(/\w\w/).map(&:hex)

# 様々な要素の取得方法
a = [1, 2, 3, 4, 5]
a[1..3] # => [2, 3, 4]

a = [1, 2, 3, 4, 5]
a.values_at(0, 2, 4) # => [1, 3, 5]

a = [1, 2, 3]
# 最後の要素を取得
a[a.size - 1] # => 3

a = [1, 2, 3]

# 最後の要素を取得
a[-1] # => 3

# 最後から2番目の要素を取得
a[-2] # => 2

# 最後から2番目の要素から2つの要素を取得
a[-2, 2] # => [2, 3]

# 最後から2番目の要素から最後の要素まで取得
a = [1, 2, 3]
a.last # => 3
a.last(2) # => [2, 3]

# 最初の要素を取得
a = [1, 2, 3]
a.first # => 1
a.first(2) # => [1, 2]
