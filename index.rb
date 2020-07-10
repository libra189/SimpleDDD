#! /usr/bin/ruby
# エントリーポイント

# 処理要件
# ユーザのデータをjsonファイルから読み込み
# 利用しやすいようにデータをstructに格納
# ID:1とID:2の年齢差を求める

# 全ライブラリ読み込み
require 'bundler/setup'
Bundler.require

puts 'Start processing.'

# jsonファイル読み込み
puts "\nload json file."
json = File.open('./json/User.json').read
puts json

# jsonを変換
puts "\nConvert to Array from json."
data_list = JSON.parse(json, symbolize_names: true)
puts data_list

# jsonをstructに変換
puts "\nConvert to Struct from Array."
Struct.new('User', :id, :name, :birthday, :gender)
users = data_list.map do |item|
  Struct::User.new(item[:id], item[:name], Date.parse(item[:birthday]), item[:gender])
end
puts users

# ID:1 と ID:2 の年齢差を求める
puts "\nCalculate age difference to ID:1 from ID:2"
user1_age = ((Date.today - users[0].birthday).to_i / 365.5).to_i
user2_age = ((Date.today - users[1].birthday).to_i / 365.5).to_i
diff_age = user2_age - user1_age

puts diff_age

puts "\nFinish processing."
