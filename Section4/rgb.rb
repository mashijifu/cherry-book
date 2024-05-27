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
