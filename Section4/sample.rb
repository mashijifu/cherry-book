# 空の配列を作る
[]

# 3つの要素が格納された配列を作る
[1, 2, 3]

# 空の配列を作成し、そのクラス名を確認する
[].class #=> Array

# 存在しない要素を指定してもエラーにならず、nilが返る
a = [1, 2, 3]
a[4] #=> nil

# sizeメソッドやlengthメソッドを使って配列の長さを取得する
a = [1, 2, 3]
a.size #=> 3
a.length #=> 3

# <<を使って配列に要素を追加する
a = []
a << 1
a << 2
a << 3
a #=> [1, 2, 3]

# 配列内の特定の位置にある要素を削除する
a = [1, 2, 3]
a.delete_at(1) #=> 2
a #=> [1, 3]

# 存在しない添え字を指定するとnilが返る
a.delete_at(100) #=> nil
a #=> [1, 3]

# 配列を使った多重代入
a, b = 1, 2
a #=> 1
b #=> 2

# 配列を使って多重代入する
a, b = [1, 2]
a #=> 1
b #=> 2

# 右辺の数が少ない場合はnilが入る
c, d = [10]
c #=> 10
d #=> nil

# 右辺の数が多い場合は、はみ出した値が切り捨てられる
e, f = [100, 200, 300]
e #=> 100
f #=> 200

# divmodは商と余りを配列で返す
14.divmod(3) #=> [4, 2]

# 戻り値を配列のまま受け取る
quo_rem = 14.divmod(3)
"商=#{quo_rem[0]}, 余り=#{quo_rem[1]}" #=> "商=4, 余り=2"

# 多重代入で別々の変数として受け取る
quotient, remainder = 14.divmod(3)
"商=#{quotient}, 余り=#{remainder}" #=> "商=4, 余り=2"

# Rubyの繰り返し処理
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum += n
end
sum #=> 10

# 配列の要素を削除する条件を自由に指定する
a = [1, 2, 3, 1, 2, 3]
# 配列から値が2の要素を削除する
a.delete(2)
a #=> [1, 3, 1, 3]

# ブロックを使って削除する要素を自由に指定する
a = [1, 2, 3, 1, 2, 3]
# 配列から値が奇数の要素を削除する
a.delete_if do |n|
  n.odd?
end
a #=> [2, 2]

# do ... endと{}
# 改行を含む長いブロックを書く場合はdo ... endで囲む
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end
sum #=> 64

# ブロックを1行で書く場合は{}を使う
numbers = [1, 2, 3, 4]
sum = 0
numbers.each { |n| sum += n }
sum #=> 10

# ブロックを使う配列のメソッド
# map/collect
# eachメソッドで書くと...
numbers = [1, 2, 3, 4, 5]
new_numbers = []
numbers.each { |n| new_numbers << n * 10 }
new_numbers #=> [10, 20, 30, 40, 50]

# mapメソッドを使うと...
numbers = [1, 2, 3, 4, 5]
new_numbers = numbers.map { |n| n * 10 }
new_numbers #=> [10, 20, 30, 40, 50]

# select/find_all/reject
# selectメソッドは各要素に対してブロックを評価し、その戻り値が真の要素を集めた配列を返す
numbers = [1, 2, 3, 4, 5, 6]
even_numbers = numbers.select { |n| n.even? }
even_numbers #=> [2, 4, 6]

# rejectメソッドはselectメソッドの逆で、ブロックの戻り値が偽である要素を集めた配列を返す
numbers = [1, 2, 3, 4, 5, 6]
# 3の倍数を除外する（3の倍数以外を集める）
non_multiples_of_three = numbers.reject { |n| n % 3 == 0 }
non_multiples_of_three #=> [1, 2, 4, 5]

# find/detect
# findメソッドはブロックの戻り値が真になった最初の要素を返す
numbers = [1, 2, 3, 4, 5, 6]
# ブロックの戻り値が最初に真になった要素を返す
even_number = numbers.find { |n| n.even? }
even_number #=> 2

# sum
numbers = [1, 2, 3, 4]
sum = numbers.sum
sum #=> 10

# ブロックを与えると各要素を加算した結果を返す
numbers = [1, 2, 3, 4]
sum = numbers.sum { |n| n * 10 }
sum #=> 20

# 初期値は0、引数で0以外の初期値を指定できる
numbers = [1, 2, 3, 4]
sum = numbers.sum(10)
sum #=> 20

# 初期値に文字列を指定すると、各要素を文字列として連結する
chars = ['a', 'b', 'c', 'd']
chars.sum('') #=> "abcd"

# joinとsum
# 配列の要素を連結して1つの文字列にする
chars = ['a', 'b', 'c', 'd']
chars.join #=> "abcd"

# 第一引数に区切り文字を指定できる
chars = ['a', 'b', 'c', 'd']
chars.join(',') #=> "a,b,c,d"

# 連結する際はto_sメソッドを使って文字列に変換する（そのため、数値など文字列以外の要素が含まれても大丈夫）
data = ['a', 1, 'b', 2]
data.join #=> "a1b2"

# 単純な要素の連結であればjoinメソッドを使用
# 空文字列("")以外の初期値(先頭の文字列)を与えたり、ブロック内で加工する場合は、sumメソッドを使用
chars = ['a', 'b', 'c', 'd']
chars.sum('>') { |c| c.upcase } #=> ">ABCD"

# &とシンボルを使ってもっと簡潔に書く
# このコードは
['ruby', 'java', 'perl'].map { |s| s.upcase } #=> ["RUBY", "JAVA", "PERL"]
# こう書き換えられる
['ruby', 'java', 'perl'].map(&:upcase) #=> ["RUBY", "JAVA", "PERL"]

# このコードは
[1, 2, 3, 4, 5, 6].select { |n| n.odd? } #=> [1, 3, 5]
# こう書き換えられる
[1, 2, 3, 4, 5, 6].select(&:odd?) #=> [1, 3, 5]

# &:メソッド名の書き方が使用できないコード
# ブロックの中でメソッドではなく演算子を使っている場合
[1, 2, 3, 4, 5, 6].select { |n| n % 3 == 0 } #=> [3, 6]

# ブロック内のメソッドで引数を渡している場合
[9, 10, 11, 12].map { |n| n.to_s(16) } #=> ["9", "a", "b", "c"]

# ブロックの中で複数の文を実行している場合
[1, 2, 3, 4, 5, 6].map do |n|
  m = n * 4
  m.to_s
end
#=> ["4", "8", "12", "16", "20", "24"]

# 範囲（Range）
# 最初の値..最後の値（最後の値を含む）
# 最初の値...最後の値（最後の値を含まない）
# ..を使うと5が範囲に含まれる（1以上5以下）
(1..5).include?(0) #=> false
(1..5).include?(5) #=> true
(1..5).include?(6) #=> false

# ...を使うと5が範囲に含まれない（1以上5未満）
(1...5).include?(0) #=> false
(1...5).include?(4) #=> true
(1...5).include?(5) #=> false

# ()で囲まずにめそっどを呼び出すとエラーになる
1..5.include?(5) #=> undefined method `include?' for 5:Integer (NoMethodError)
# ()で囲めばエラーにならない
(1..5).include?(5) #=> true
# 上記は、..や...の優先順位が低いため、()で囲む必要がある
