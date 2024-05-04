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

# %記法で文字列を作る
# %q! !はシングルクォートで囲んだことと同じ
puts %q!He said, "Don't speak."!

# %Q! !はダブルクォートで囲んだことと同じ
something = "Hello."
puts %Q!He said, "#{something}"!

# %! !もダブルクォートで囲んだことと同じ
something = "Bye."
puts %!He said, "#{something}"!

# ヒアドキュメント（行指向文字列リテラル）
# ヒアドキュメントを使うと長い文字列を改行やインデント付きで表現できる
a = <<TEXT
これはヒアドキュメントです。
複数行にわたる長い文字列を作成するのに便利です。
TEXT
puts a

# ヒアドキュメントの識別子としてHTMLを使う場合
a = <<HTML
<div>
  <img src="sample.jpg">
</div>
HTML
puts a

# ヒアドキュメントでインデントさせる
def some_method
  <<-TEXT
    これはヒアドキュメントです。
    <<-を使うと最後の識別子をインデントさせることができます。
  TEXT
end
puts some_method

# ヒアドキュメントで内部の文字列をインデントさせる
def some_method
  <<~TEXT
    これはヒアドキュメントです。
    <<~を使うと内部文字列のインデント部分が無視されます。
  TEXT
end
puts some_method

# ヒアドキュメントの全ての行頭に半角スペースを入れたい場合
def some_method
  <<~TEXT
    \  これはヒアドキュメントです。
    \  <<-を使うと最後の識別子をインデントさせることができます。
  TEXT
end
puts some_method

# ヒアドキュメントの中で式展開
name = 'Alice'
a = <<TEXT
ようこそ、#{name}さん！
以下のメッセージをご覧ください。
TEXT
puts a

# 識別子をシングルクォートで囲むと式展開が無効になる
name = 'Alice'
a = <<'TEXT'
ようこそ、#{name}さん！
以下のメッセージをご覧ください。
TEXT
puts a  #=> ようこそ、#{name}さん！\n以下のメッセージをご覧ください。

# フォーマットを指定して文字列を作成する
sprintf('%0.3f', 1.2) #=> "1.200"
'%0.3f' % 1.2 #=> "1.200"

# その他、文字列作成のいろいろ
# 数値を文字列に変換する
123.to_s #=> "123"

# 配列の各要素を連結して1つの文字列にする
[10, 20, 30].join #=> "102030"

# *演算子を使って文字列を繰り返す
'Hi!' * 10 #=> "Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!"

# String.newを使って新しい文字列を作る（あまり使わない）
String.new('hello') #=> "hello"

# rubyは、文字と文字列に違いはない
# 1文字で文字列
'a' #=> "a"

# 2文字以上でも文字列
'abc' #=> "abc"

# if文以外で、&&や||を意図的に使う場合
# Alice、Bob、Carrolと順に検索し、最初に見つかったユーザ（nilまたはfalse以外の値）を変数に格納する
user = find_user('Alice') || find_user('Bob') || find_user('Carrol')

# 正常なユーザであればメールを送信する（左辺が偽（nilまたはfalse）であればメール送信は実行されない）
user.valid? && send_email_to(user)

# unless文
status = 'error'

# unlessの結果を変数に代入する
message = 
  unless status == 'ok'
    '何か異常があります'
  else
    '正常です'
  end

message #=> "何か異常があります"

# unlessを修飾子として使う
'何か異常があります' unless status == 'ok'
#=> "何か異常があります"

# 条件演算子（三項演算子）
n = 11

n > 10 ? '10より大きい' : '10以下' #=> "10より大きい"
#=> "10より大きい"

message = n > 10 ? '10より大きい' : '10以下'
message #=> "10より大きい"

# デフォルト値付きの引数
def foo(time = Time.now, message = bar)
  puts "time: #{time}, message: #{message}"
end

def bar
  'BAR'
end

foo #=> time: 2021-07-25 15:00:00 +0900, message: BAR

# ？で終わるメソッド
# 空文字列であればtrue、そうでなければfalse
''.empty? #=> true
'abc'.empty? #=> false

# 引数の文字列が含まれていればtrue、そうでなければfalse
'watch'.include?('at') #=> true
'watch'.include?('in') #=> false

# 奇数ならtrue、偶数ならfalse
1.odd? #=> true
2.odd? #=> false

# 偶数ならtrue、奇数ならfalse
1.even? #=> false
2.even? #=> true

# オブジェクトがnilであればtrue、そうでなければfalse
nil.nil? #=> true
'abc'.nil? #=> false
1.nil? #=> false

# ?で終わるメソッドはtrueかfalseを返すメソッドの慣習がある（自分でも作れる）
# 3の倍数ならtrue、それ以外はfalseを返すメソッド
def multiple_of_three?(n)
  n % 3 == 0
end

multiple_of_three?(4) #=> false
multiple_of_three?(5) #=> false
multiple_of_three?(6) #=> true

# !で終わるメソッド（呼び出したオブジェクトの状態を変更してしまう）
# upcaseだと変数自体は変わらない
a = 'ruby'
a.upcase #=> "RUBY"
a #=> "ruby"

# upcase!だと変数自体が大文字に変わる
a = 'ruby'
a.upcase! #=> "RUBY"
a #=> "RUBY"


# !で終わるメソッドも自分で定義できる
# メソッド名は!や?で終わることができるが、変数名には使えない（構文エラーになる）

# !が付くメソッドについてのまとめ
# !が付くメソッドは!が付かないメソッドよりも危険、という意味を持つ
# 非破壊的メソッドと破壊的メソッドの2種類が存在する場合は後者に!が付く
# 破壊的メソッドであっても非破壊的メソッドがない（つまり1種類しかない）場合は!が付かない（concatメソッド等）
# 破壊的かどうかに関係なく、安全なメソッドと危険なメソッドの2種類が存在する場合にも後者に!が付く

# 参照の概念を理解する
# aとbはどちらも同じ文字列だが、オブジェクトとしては別物
a = 'hello'
b = 'hello'
a.object_id #=> 60
b.object_id #=> 80

# cにbを代入する。bとcはどちらも同じオブジェンクト_id
c = b
c.object_id #=> 80

# メソッドの引数にcを渡す。引数として受け取ったdはb、cと同じオブジェクト_id
def m(d)
  d.object_id
end
m(c) #=> 80

# equal?メソッドを使って同じオブジェクトかどうか確認する
a.equal?(b) #=> false
b.equal?(c) #=> true

# b、cは同じオブジェクト、aは異なるオブジェクト
a = 'hello'
b = 'hello'
c = b

# 渡された文字列を破壊的に大文字に変換するメソッドを定義する
def m!(d)
  d.upcase!
end

# cにm!メソッドを適用する
m!(c)

# b、cはいずれも大文字になる
b #=> "HELLO"
c #=> "HELLO"

# aは別のオブジェクトなので大文字にならない
a #=> "hello"

# 標準出力（puts、print、p、pp）
# putsメソッドは改行を加えて、変数の内容やメソッドの戻り値をターミナルに出力する。戻り値はnil
puts 123
#=> 123

# pメソッドはputsメソッドと同じように改行を加えて出力するが、文字列を出力すると、その文字列がダブルクォートで囲まれる点がputsメソッドと異なる。戻り値は引数に渡されたオブジェクト
p 123
#=> 123

# ppメソッドは、大きくて複雑な配列やハッシュ、オブジェクトの内容を見やすく整形して出力する。pメソッドでは、内容がごちゃごちゃして確認しづらい時に使用。戻り値は引数に渡されたオブジェクト
# pメソッドではネストした配列が横並びになってしまい確認しづらい
p Encoding.aliases.take(5)
#=> [["BINARY", "ASCII-8BIT"], ["ASCII", "ASCII-8BIT"], ["US-ASCII", "ASCII-8BIT"], ["UTF-8", "UTF-8"], ["UTF-7", "UTF-7"]]

# ppメソッドを使うと配列が見やすく整形される
pp Encoding.aliases.take(5)
#=> [["BINARY", "ASCII-8BIT"],
#    ["ASCII", "ASCII-8BIT"],
#    ["US-ASCII", "ASCII-8BIT"],
#    ["UTF-8", "UTF-8"],
#    ["UTF-7", "UTF-7"]]

# printメソッドは改行を加えずに出力する。戻り値はnil

# 使い分け（用途としては、putsとprintは一般ユーザー向け、pとppは開発者向け）
# putsとprintは内部的に、引数で渡されたオブジェクトに対してto_sメソッドを呼び出して文字列に変換してから出力する
# pメソッドは内部的にinspectメソッドを呼び出してオブジェクトの内容を文字列に変換してから出力する
# to_sメソッドもinspectメソッドも、どちらもオブジェクトの内容を文字列に変換するメソッドだが、一般的にinspectメソッドは開発者にとって役立つ情報を返すように実装されている
