def fizz_buzz(n)
  if n % 15 == 0
    'Fizz Buzz'
  elsif n % 3 == 0
    'Fizz'
  elsif n % 5 == 0
    'Buzz'
  else
    n.to_s
  end
end

# 1から100までの数値を引数に渡す
# その数値に対してfizz_buzzメソッドを呼び出す
# その結果をputsメソッドで出力する
for i in 1..100
  puts fizz_buzz(i)
end
