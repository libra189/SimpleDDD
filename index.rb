#! /usr/bin/ruby
# エントリーポイント

# 処理要件
# ユーザのデータをjsonファイルから読み込み
# 利用しやすいようにデータをstructに格納
# ID:1とID:2の年齢差を求める

# 全ライブラリ読み込み
require 'bundler/setup'
Bundler.require

# domein/model読み込み
require './src/domain/model/user'

puts "Start processing.\n"

puts 'load user data at id:1.'
user1 = Domain::Model::User.find(1)
puts user1

puts 'load user data at id:2.'
user2 = Domain::Model::User.find(2)
puts user2

puts "\nCalculate age difference to ID:1 from ID:2."
puts user1.diff_age(user2)

puts "\nFinish processing."
