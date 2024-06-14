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

# 要素の追加、変更、取得
currencies = { "japan" => "yen", "us" => "dollar", "india" => "rupee" }

# イタリアの通貨を追加する
currencies["italy"] = "euro"

currencies #=> { "japan" => "yen", "us" => "dollar", "india" => "rupee", "italy" => "euro" }

# すでにキーが存在する場合は値が上書きされる
currencies = { "japan" => "yen", "us" => "dollar", "india" => "rupee" }

# 既存の値を上書きする
currencies["japan"] = "円"

currencies #=> { "japan" => "円", "us" => "dollar", "india" => "rupee" }

currencies = { "japan" => "yen", "us" => "dollar", "india" => "rupee" }

currencies["india"] #=> "rupee"

currencies = { "japan" => "yen", "us" => "dollar", "india" => "rupee" }

currencies["brazil"] #=> nil
