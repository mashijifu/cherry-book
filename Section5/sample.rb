# ハッシュ
# 空のハッシュを作る
{}

# 空のハッシュを作成し、そのクラス名を確認する
{}.class #=> Hash

{ "japan" => "yen", "us" => "dollar", "india" => "rupee" }

{
  "japan" => "yen",
  "us" => "dollar",
  "india" => "rupee"
}

{
  "japan" => "yen",
  "us" => "dollar",
  "india" => "rupee",
}

{ "japan" => "yen", "japan" => "円" } #=> { "japan" => "円" }

# ハッシュリテラルの{}
h = { "japan" => "yen", "us" => "dollar", "india" => "rupee" }

# ブロックを作成する
[1, 2, 3].each { |n| puts n }

# 空のハッシュ
h = {}

# 空のブロック（めったに使われない）
[1, 2, 3].each {}
