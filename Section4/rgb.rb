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

# 様々な要素の変更方法
a = [1, 2, 3]
a[-3] = -10
a #=> [-10, 2, 3]

# 指定可能な負の値よりも小さくなるとエラーが発生
a[-4] = 0 #=> index -4 too small for array; minimum: -3 (IndexError)

# 要素を置き換える
a = [1, 2, 3, 4, 5]
a[1, 3] = 100
a #=> [1, 100, 5]

# pushメソッドを使って要素を追加
a = []
a.push(1)
a.push(2, 3)
a #=> [1, 2, 3]

# deleteメソッドを使って要素を削除
a = [1, 2, 3, 1, 2, 3]
# 値が2である要素を削除
a.delete(2)
a #=> [1, 3, 1, 3]

# 存在しない値を指定するとnilが返る
a.delete(5) # => nil
a #=> [1, 3, 1, 3]

# 配列の連結
a = [1]
b = [2, 3]
a.concat(b)

# aは変更される
a #=> [1, 2, 3]

# bは変更されない
b #=> [2, 3]

a = [1]
b = [2, 3]
a + b #=> [1, 2, 3]

# aもbも変更されない
a #=> [1]
b #=> [2, 3]

# 配列の和集合、差集合、積集合
# 和集合
a = [1, 2, 3]
b = [3, 4, 5]
a | b #=> [1, 2, 3, 4, 5]

# 差集合
a = [1, 2, 3]
b = [3, 4, 5]
a - b #=> [1, 2]

# 積集合
a = [1, 2, 3]
b = [3, 4, 5]
a & b #=> [3]

# 集合演算をする場合は、配列よりもSetクラスを使う方が効率的
require "set"

a = Set[1, 2, 3]
b = Set[3, 4, 5]
a | b #=> #<Set: {1, 2, 3, 4, 5}>
a - b #=> #<Set: {1, 2}>
a & b #=> #<Set: {3}>

# 多重代入で残りの全要素を配列として受け取る、または無視する
e, f = 100, 200, 300
e #=> 100
f #=> 200

e, *f = 100, 200, 300
e #=> 100
f #=> [200, 300]

# 100だけeに格納して、残りの要素は無視する
e, * = 100, 200, 300
e #=> 100

# *を省略して200と300を無視する
e, = 100, 200, 300
e #=> 100

a, *b, c, d = 1, 2, 3, 4, 5
a #=> 1
b #=> [2, 3]
c #=> 4
d #=> 5

# 1がa、2がc、3がdに対応する。右辺に残りの要素はなくなったのでbは空の配列になる
a, *b, c, d = 1, 2, 3
a #=> 1
b #=> []
c #=> 2
d #=> 3

# 1つの配列を複数の引数やwhen節の条件として展開する
a = []
a.push(1)
# 2と3を一度に追加する
a.push(2, 3)
a #=> [1, 2, 3]

a = []
b = [2, 3]
a.push(1)
# 配列をそのまま追加する（a.push([2, 3])と同じ）
a.push(b)
a #=> [1, [2, 3]]

a = []
b = [2, 3]
a.push(1)
# 配列を*付きで追加する（a.push(2, 3)と同じ）
a.push(*b)
a #=> [1, 2, 3]

# case文のwhen節で*を使って配列を複数の条件として展開する
jp = ['japan', '日本']
country = '日本'
case country
# *により配列が展開され、when 'japan', '日本'と書いたのと同じ意味になる
when *jp
  'こんにちは'
else
  'hello'
end
#=> "こんにちは"

# メソッドの可変長引数
def greet(*names)
  "#{names.join('と')}、こんにちは！"
end
greet('田中さん') # => "田中さん、こんにちは！"
greet('田中さん', '鈴木さん') # => "田中さんと鈴木さん、こんにちは！"
greet('田中さん', '鈴木さん', '佐藤さん') # => "田中さんと鈴木さんと佐藤さん、こんにちは！"

# 多重代入の例の左辺と同じように引数を設定する
def foo(a, *b, c, d)
  puts "a=#{a}, b=#{b}, c=#{c}, d=#{d}"
end
foo(1, 2, 3, 4, 5) # => a=1, b=[2, 3], c=4, d=5

# *で配列同士を非破壊的に連結する
a = [1, 2, 3]

# []の中にそのまま配列を置くと、入れ子になった配列（ネストした配列）になる
[a] # => [[1, 2, 3]]

# *付きで配列を置くと、展開されて別々の要素になる
[*a] # => [1, 2, 3]

a = [1, 2, 3]
[-1, 0, *a, 4, 5] # => [-1, 0, 1, 2, 3, 4, 5]

a = [1, 2, 3]
[-1, 0] + a + [4, 5] # => [-1, 0, 1, 2, 3, 4, 5]

# ==で等しい配列かどうかを判断する
# 配列が等しい場合
[1, 2, 3] == [1, 2, 3] # => true

# 配列が等しくない場合
[1, 2, 3] == [1, 2, 4] # => false
[1, 2, 3] == [1, 2] # => false
[1, 2, 3] == [1, 2, 3, 4] # => false

# %記法で文字列の配列を簡潔に作る
# []で文字列の配列を作成する
['apple', 'melon', 'orange'] # => ["apple", "melon", "orange"]

# %wで文字列の配列を作成する（!で囲む場合）
%w!apple melon orange! # => ["apple", "melon", "orange"]

# %wで文字列の配列を作成する（丸カッコで囲む場合）
%w(apple melon orange) # => ["apple", "melon", "orange"]

# 空白文字（スペースや改行）が連続した場合も1つの区切り文字と見なされる
%w(
  apple
  melon
  orange
) # => ["apple", "melon", "orange"]

# 空白文字を含めたい場合はバックスラッシュを使う
%w(big\ apple small\ melon orange) # => ["big apple", "small melon", "orange"]

# 式展開や改行文字を含めたい場合は%Wを使う
prefix = 'This is'
%W(#{prefix}\ an\ apple small\nmelon orange) # => ["This is an apple", "small\nmelon", "orange"]

# 文字列を配列に変換する（charsメソッド）
'Ruby'.chars # => ["R", "u", "b", "y"]

# 引数で渡した区切り文字で文字列を配列に分割する（splitメソッド）
'Ruby,Java,PHP'.split(',') # => ["Ruby", "Java", "PHP"]

# 配列にデフォルト値を設定する
# 以下のコードはa = []と同じ
a = Array.new

# 要素が5つの配列を作成する
a = Array.new(5)
a # => [nil, nil, nil, nil, nil]

# 要素が5つで0をデフォルト値とする配列を作成する
a = Array.new(5, 0)
a # => [0, 0, 0, 0, 0]

# 要素数が10で、1, 2, 3, 1, 2, 3...と繰り返す配列を作る
a = Array.new(10) { |n| n % 3 + 1 }
a # => [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]

# 配列にデフォルト値を設定する場合の注意点
# 要素が5つで'default'をデフォルト値とする配列を作成する
a = Array.new(5, 'default')
a # => ["default", "default", "default", "default", "default"]

# 1つ目の要素を取得する
str = a[0]
str # => "default"

# 1つ目の要素を大文字に変換する
str.upcase!
str # => "DEFAULT"

# 配列の要素全てが大文字に変わってしまった！
a # => ["DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT"]

# ブロックを使って、ブロックの戻り値をデフォルト値とする
# （ブロックパラメータには添え字が渡されるが、ここでは使わないのでブロックパラメータを省略）
a = Array.new(5) { 'default' }
a # => ["default", "default", "default", "default", "default"]

# 1つ目の要素を取得する
str = a[0]
str # => "default"

# 1つ目の要素を大文字に変換する
str.upcase!
str # => "DEFAULT"

# 1つ目の要素だけが大文字に変わり、他の要素は変わらない
a # => ["DEFAULT", "default", "default", "default", "default"]

# 要素が5つで0をデフォルト値とする配列を作成する
a = Array.new(5, 0)
a # => [0, 0, 0, 0, 0]

# 1つ目の要素を取得する
n = a[0]
n # => 0

# 数値だと破壊的な変更（例えば強制的に歩の数に変更するなど）はできない
# negative!メソッドは存在しない架空のメソッド
# n.negative!

# []や<<を使った文字列の操作
a = 'abcdef'
# 3文字目を取得する
a[2] # => "c"
# 2文字目から3文字分を取得する
a[1, 3] # => "bcd"
# 最後の1文字を取得する
a[-1] # => "f"

# 1文字目を"X"に置き換える
a[0] = 'X'
a # => "Xbcdef"
# 2文字目から3文字分を"Y"で置き換える
a[1, 3] = 'Y'
a # => "XYef"
# 末尾に"PQR"を連結する
a << 'PQR'
a # => "XYefPQR"

# 添え字付きの繰り返し処理
fruits = ['apple', 'orange', 'melon']
# ブロックパラメータのiには0, 1, 2...と要素の添え字が入る
fruits.each_with_index { |fruit, i| puts "#{i}: #{fruit}" }
# 出力結果
# 0: apple
# 1: orange
# 2: melon

# with_indexメソッドを使った添え字付きの繰り返し処理
fruits = ['apple', 'orange', 'melon']
# mapとして処理しつつ、添え字も受け取る
fruits.map.with_index { |fruit, i| "#{i}: #{fruit}" }
# => ["0: apple", "1: orange", "2: melon"]

fruits = ['apple', 'orange', 'melon']
# 名前に"a"を含み、かつ添え字が奇数である要素を削除する
fruits.delete_if.with_index { |fruit, i| fruit.include?('a') && i.odd? }
fruits # => ["apple", "melon"]

fruits = ['apple', 'orange', 'melon']
# ブロックなしでメソッドを呼ぶとEnumeratorオブジェクトが返る。よってwith_indexメソッドが呼び出せる
p fruits.each # => #<Enumerator: ["apple", "orange", "melon"]:each>
p fruits.map # => #<Enumerator: ["apple", "orange", "melon"]:map>
p fruits.delete_if # => #<Enumerator: ["apple", "orange", "melon"]:delete_if>

# 添え字を0以外の数値から開始させる
fruits = ['apple', 'orange', 'melon']

# eachで繰り返しつつ、1から始まる添え字を取得する
fruits.each.with_index(1) { |fruit, i| puts "#{i}: #{fruit}" }
# 出力結果
# 1: apple
# 2: orange
# 3: melon

# mapで処理しつつ、10から始まる添え字を取得する
fruits.map.with_index(10) { |fruit, i| "#{i}: #{fruit}" }
# => ["10: apple", "11: orange", "12: melon"]

# 配列がブロックパラメータに渡される場合
dimensions = [
  [10, 20],
  [30, 40],
  [50, 60]
]

areas = []
# ブロックパラメータが1個であれば、ブロックパラメータの値が配列になる
dimensions.each do |dimension|
  length = dimension[0]
  width = dimension[1]
  areas << length * width
end
areas # => [200, 1200, 3000]

dimensions = [
  [10, 20],
  [30, 40],
  [50, 60]
]
# 面積の計算結果を格納する配列
areas = []
# 配列の要素分だけブロックパラメータを用意すると、各要素の値が別々の変数に格納される
dimensions.each do |length, width|
  areas << length * width
end
areas # => [200, 1200, 3000]

# lengthとwidthには値が渡されるが、fooとbarはnilになる
dimensions.each do |length, width, foo, bar|
  p [length, width, foo, bar]
end
# 出力結果
# [10, 20, nil, nil]
# [30, 40, nil, nil]
# [50, 60, nil, nil]

dimensions = [
  [10, 20, 100],
  [30, 40, 200],
  [50, 60, 300]
]
# 3つの値をブロックパラメータに渡そうとするが、2つしかないので3つ目の値は捨てられる
dimensions.each do |length, width|
  p [length, width]
end
# 出力結果
# [10, 20]
# [30, 40]
# [50, 60]

dimensions = [
  [10, 20],
  [30, 40],
  [50, 60]
]
dimensions.each_with_index do |length, width, i|
  puts "length: #{length}, width: #{width}, i: #{i}"
end
# 出力結果
# length: [10, 20], width: 0, i:
# length: [30, 40], width: 1, i:
# length: [50, 60], width: 2, i:

dimensions = [
  [10, 20],
  [30, 40],
  [50, 60]
]
# いったん配列のまま受け取る
dimensions.each_with_index do |dimension, i|
  # 配列から縦と横の値を取り出す
  length = dimension[0]
  width = dimension[1]
  puts "length: #{length}, width: #{width}, i: #{i}"
end
# 出力結果
# length: 10, width: 20, i: 0
# length: 30, width: 40, i: 1
# length: 50, width: 60, i: 2

dimensions = [
  [10, 20],
  [30, 40],
  [50, 60]
]
# ブロックパラメータを（）で囲んで、配列の要素を別々のパラメータとして受け取る
dimensions.each_with_index do |(length, width), i|
  puts "length: #{length}, width: #{width}, i: #{i}"
end
# 出力結果
# length: 10, width: 20, i: 0
# length: 30, width: 40, i: 1
# length: 50, width: 60, i: 2

# （）を使わない場合はdimensionに配列の[10, 20]が代入される
dimension, i = [[10, 20], 0]
length #=> [10, 20]
i #=> 0

# （）を使うと内側の配列の要素（10と20）を別々の変数（lengthとwidth）に代入できる
(length, width), i = [[10, 20], 0]
length #=> 10
width #=> 20
i #=> 0

# 文字列から指定した文字を削除する
# deleteメソッド（文字列の値は変わらない）
s = 'mebee'

p s.delete('e')
# "mmbmm"

p s
# "mebee"

s = 'aaabbbccc'

p s.delete('ab')
# "ccc"

p s
# "aaabbbccc"

# delete!メソッド（文字列の値が変わる）
s = 'mebee'

p s.delete!('e')
# "mb"

p s
# "mb"

s = 'aaabbbccc'

p s.delete!('ab')
# "ccc"

p s
# "ccc"

# 番号指定パラメータ
# 番号指定パラメータを使わない場合（ブロックパラメータが1つ）
['1', '20', '300'].map { |s| s.rjust(3, '0') }
# => ["001", "020", "300"]

# 番号指定パラメータを使う場合
['1', '20', '300'].map { _1.rjust(3, '0') }
# => ["001", "020", "300"]

# 番号指定パラメータを使わない場合（ブロックパラメータが2つ）
['japan', 'us', 'italy'].map.with_index { |country, n| [n, country] }
# => [[0, "japan"], [1, "us"], [2, "italy"]]

# 番号指定パラメータを使う場合
['japan', 'us', 'italy'].map.with_index { [ _2, _1 ] }
# => [[0, "japan"], [1, "us"], [2, "italy"]]

dimensions = [
  [10, 20],
  [30, 40],
  [50, 60]
]
# dimensions.each { |dimension| p dimension } と書いたのと同じ
dimensions.each { p _1 }
#=> [10, 20]
#=> [30, 40]
#=> [50, 60]

# dimensions.each { |length, width| puts "#{length} / #{width}" } と書いたのと同じ
dimensions.each { puts "#{_1} / #{_2}" }
#=> 10 / 20
#=> 30 / 40
#=> 50 / 60

sum = 0
[[1, 2, 3],[4, 5, 6]].each do
  # 外側のブロックで番号指定パラメータを使う
  _1.each do
    # 内側のブロックでも番号指定パラメータを使おうとするとエラーになる
    sum += _1
  end
end
#=> numbered parameter is already used in （SyntaxError）

sum = 0
[[1, 2, 3],[4, 5, 6]].each do |values|
  values.each do
    # 内側のブロックでしか番号指定パラメータを使ってないのでOK
    sum += _1
  end
end
sum #=> 21

# 従来のブロックパラメータ |s| と、番号指定パラメータ _1 が混在すると構文エラー
['1', '20', '300'].map { |s| _1.rjust(3, '0') }
#=> ordinary parameter is defined （SyntaxError）

# ブロックローカル変数
numbers = [1, 2, 3, 4]
sum = 0
# ブロックの外にあるsumとは別物の変数sumを用意する
numbers.each do |n; sum|
  # 別物のsumを10で初期化し、ブロックパラメータの値を加算する
  sum = 10
  sum += n
  p sum
end
#=> 11
#=> 12
#=> 13
#=> 14

# ブロックの中で使っていたsumは別物なので、ブロックの外のsumには変化がない
sum #=> 0

# 繰り返し処理以外でも使用されるブロック
# sample.textを開いて文字列を書き込む（クローズ処理は自動的に行われる）
File.open("./sample.txt", "w") do |file|
  file.puts("1行目のテキストです")
  file.puts("2行目のテキストです")
  file.puts("3行目のテキストです")
end

# do...endと{}の結合度の違い
a = [1, 2, 3]

# ブロックを渡さない時は指定した値が見つからないとnilが返る
a.delete(100) # => nil

# ブロックを渡すとブロックの戻り値が指定した値が見つからない時の戻り値になる
a.delete(100) do
  'NG'
end
# => "NG"

a.delete 100 do
  'NG'
end
# => "NG"

a.delete 100 { 'NG' }
#=> syntax error, unexpected '{', expecting end-of-input （SyntaxError）

a.delete(100) { 'NG' }
#=> "NG"

# 終端や始端を持たない範囲オブジェクト
# 10以上を表す範囲オブジェクト（Ruby 2.6以降）
(10..)

# 終端を省略する代わりにnilを指定しても同じ
10..nil

# 10以下を表す範囲オブジェクト（Ruby 2.7以降）
(..10)

# 始端を省略する代わりにnilを指定しても同じ
nil..10

numbers = [10, 20, 30, 40, 50]

# 3番目以降の要素を取得
numbers[2..] # => [30, 40, 50]

# 2番目以前の要素を取得
numbers[..1] # => [10, 20]

# 全範囲を表す範囲オブジェクト（いずれも同じ意味）
nil..nil
(nil..)
(..nil)

# nilを両方とも省略すると構文エラー
(..)
#=> syntax error, unexpected ')' （SyntaxError）

# さまざまな繰り返し処理
# timesメソッド
sum = 0
# 処理を5回繰り返す。nには0, 1, 2, 3, 4が入る
5.times { |n| sum += n }
sum # => 10

sum = 0
# sumに1を加算する処理を5回繰り返す
5.times { sum += 1 }
sum # => 5

# uptoメソッドとdowntoメソッド
a = []
10.upto(14) { |n| a << n }
a # => [10, 11, 12, 13, 14]

a = []
14.downto(10) { |n| a << n }
a # => [14, 13, 12, 11, 10]

# stepメソッド
a = []
1.step(10, 2) { |n| a << n }
a # => [1, 3, 5, 7, 9]

a = []
10.step(1, -2) { |n| a << n }
a # => [10, 8, 6, 4, 2]
