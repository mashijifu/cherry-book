# 文字列
p '1'.to_s #=> "1"

# 数値
p 1.to_s #=> "1"

# nil
p nil.to_s #=> ""

# true
p true.to_s #=> "true"

# false
p false.to_s #=> "false"

# 正規表現
p /\d+/.to_s #=> "(?-mix:\\d+)"