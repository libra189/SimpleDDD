# エントリーポイント

# 処理要件
# ユーザのデータをjsonファイルから読み込み
# 利用しやすいようにデータをstructに格納
# ID:1とID:2の年齢差を求める

# 全ライブラリ読み込み
require 'bundler/setup'
Bundler.require

# domein/model読み込み
require "#{File.expand_path(__dir__)}/src/domain/model/user"
require "#{File.expand_path(__dir__)}/src/domain/repository/user"

puts "Start processing.\n\n"

# @params [Model::User] user1
user1 = Repository::User.find(1)
puts 'load user data at id:1.'
puts user1

# @params [Model::User] user1
user2 = Repository::User.find(2)
puts 'load user data at id:2.'
puts user2

puts "\nCalculate age difference to ID:1 from ID:2."
puts "id:1 - id:2 = #{user1.diff_age(user2)}"

puts "\nFinish processing."
