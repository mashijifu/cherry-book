# 【全てがオブジェクト】
# 文字列
'1'.to_s #=> "1"

# 数値
1.to_s #=> "1"

# nil
nil.to_s #=> ""

# true
true.to_s #=> "true"

# false
false.to_s #=> "false"

# 正規表現
/\d+/.to_s #=> "(?-mix:\\d+)"

# 【メソッド呼び出し】
# 数値の1を文字列に変換する（カッコあり）
1.to_s() #=> "1"

# 数値の1を文字列に変換する（カッコなし）
1.to_s #=> "1"

# 数値を16進数の文字列に変換する（カッコあり）
10.to_s(16) #=> "a"

# 数値を16進数の文字列に変換する（カッコなし）
10.to_s 16 #=> "a"

# 【文の区切り】
# 改行ごとにメソッドが実行される
1.to_s #=> "1"
nil.to_s #=> ""
10.to_s(16) #=> "a"

# セミコロンを使って、3つの文を1行に押し込める
1.to_s; nil.to_s; 10.to_s(16)

# （で改行しているので、カッコが閉じられるまで改行してもエラーにならない
10.to_s(
  16
) #=> "a"

# （がない場合は10.to_sと16という２つの文だと見なされる
10.to_s #=> "10"
16 #=> 16

# バックスラッシュを使って10.to_s 16を改行して書く
10.to_s \
16 #=> "a"

# 【コメント】
# 複数行のコメント
=begin
コメント1
コメント2
コメント3
=end

# 変数（ローカル変数）の宣言と代入
# ２つの値を同時に代入する
a, b = 1, 2
a #=> 1
b #=> 2

# 右辺の数が少ない場合はnilが入る
c, d = 10
c #=> 10
d #=> nil

# 右辺の数が多い場合ははみ出した値が切り捨てられる
e, f = 100, 200, 300
e #=> 100
f #=> 200

# badな多重代入の例
# 互いに無関係な値を多重代入すると、理解しづらいコードになる
name, age, height = 'Alice', 20, 160

# こういう場合は別々に変数に代入していくほうが良い
name = 'Alice'
age = 20
height = 160

# splitメソッドを使って人名をスペースで２分割するが、使うのはファーストネームだけ
# ラストネームは使わないので変数名をアンダースコア(_)始まりにする
first_name, _last_name = 'Alice Jordan'.split(' ')
puts first_name #=> Alice

# このバリエーションとして変数名をアンダースコア１文字にしてしまうケースもある
first_name, _ = 'Alice Jordan'.split(' ')
puts first_name #=> Alice

# ２つの変数に同じ値を代入する
a = b = 100
a #=> 100
b #=> 100

# =を2回使って変数aとbに同じ文字列を代入する
a = b = 'string'
# aに格納された文字列を大文字にする
a.upcase!
# aだけを大文字にしたはずなのに、bも大文字に変わってしまった！
a #=> "STRING"
b #=> "STRING"

# 別々に代入した場合はこの問題は起きない（cは大文字になるが、dは小文字のまま）
c = 'string'
d = 'string'
c.upcase!
c #=> "STRING"
d #=> "STRING"

# 数値
# 整数同士の割り算は整数になる（0.5ではなく0になる）
1 / 2 #=> 0

1.0 / 2 #=> 0.5
1 / 2.0 #=> 0.5

n = 1
n.to_f #=> 1.0
n.to_f / 2 #=> 0.5

# 変数に格納された数値の増減
# ++は構文として無効
# n++など
n = 1
# nを1増やす（n = n + 1と同じ）
n += 1 #=> 2

# nを1減らす（n = n - 1と同じ）
n -= 1 #=> 1

# 丸め誤差
0.1 * 3.0 #=> 0.30000000000000004

# 丸め誤差が気になる場合はRationalを使う
0.1r * 3.0r #=> (3/10)

# Rationalクラスであれば期待した通りに値の比較ができる
0.1r * 3r == 0.3 #=> true

# 変数に値が入っている場合は、rationalizeメソッドを使ってRationalクラスの数値に変換する
a = 0.1
b = 3.0
a.rationalize * b.rationalize #=> (3/10)


# 丸め誤差が気になる場合はBigDecimalを使う
require 'bigdecimal'
(BigDecimal('0.1') * BigDecimal('3.0')).to_f #=> 0.3

# Rubyの真偽値
# 偽とnil以外はすべて真
# 真となる値（true、全ての数値、全ての文字列）)
true
1
0
-1
'true'
'false'
''

# else節がなく、尚且つどの条件にも合致しなかった場合はnilが返る
country = 'italy'

if country == 'japan'
  'こんにちは'
elsif country == 'us'
  'Hello'
end

# メソッドの定義
# メソッド名はスネークケースで書く
def hello_world
  'Hello, World!'
end

# メソッドの戻り値
# Rubyはreturnが不要、メソッドの戻り値は最後に評価された式が返る
