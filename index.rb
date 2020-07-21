# エントリーポイント

# 処理要件
# ユーザのデータをjsonファイルから読み込み
# 利用しやすいようにデータをmodelに格納
# ID:1とID:2の年齢差を求める

# 全ライブラリ読み込み
require 'bundler/setup'
Bundler.require

# インフラ層の読み込み
require "#{File.expand_path(__dir__)}/src/infrastructure/user"

puts "Start processing.\n\n"

# DI
# インフラ層の初期化
user_repository = Infrastructure::User.new("#{File.expand_path(__dir__)}/json/User.json")

# インフラ層からデータを読み込み
# @params [Model::User] user1
user1 = user_repository.find(1)
puts 'Load user data at id:1.'
puts user1

# @params [Model::User] user1
user2 = user_repository.find(2)
puts 'Load user data at id:2.'
puts user2

user_data = { id: 3, name: 'carol', birthday: '1993-02-24', gender: 'Femal' }
user3 = user_repository.create(user_data)
puts 'Create user data at id:3.'
puts user3

# ドメイン層でビジネスロジック呼び出し
puts "\nCalculate age difference to ID:1 from ID:2."
puts "id:1 - id:2 = #{user1.diff_age(user2)}"

puts "\nFinish processing."
