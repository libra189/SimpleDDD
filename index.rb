# エントリーポイント

# 処理要件
# ユーザのデータをjsonファイルから読み込み
# 利用しやすいようにデータをmodelに格納
# ID:1とID:2の年齢差を求める

# 全ライブラリ読み込み
require 'bundler/setup'
Bundler.require

# レイヤー読み込み
require "#{File.expand_path(__dir__)}/src/infrastructure/user"
require "#{File.expand_path(__dir__)}/src/usecase/user"
require "#{File.expand_path(__dir__)}/src/interface/user"

puts "Start processing.\n\n"

# DI
user_repository = Infrastructure::User.new("#{File.expand_path(__dir__)}/json/User.json")
user_usecase = Usecase::User.new(user_repository)
user_handler = Interface::User.new(user_usecase)

# インフラ層からデータを読み込み
# @params [Model::User] user1
user1 = user_handler.get(1)
puts 'Load user data at id:1.'
puts user1

# @params [Model::User] user1
user2 = user_handler.get(2)
puts 'Load user data at id:2.'
puts user2

user3 = user_handler.post('carol', '1993-02-24', 'Femal')
puts 'Create user data at id:3.'
puts user3

# ドメイン層でビジネスロジック呼び出し
puts "\nCalculate age difference to ID:1 from ID:2."
puts "id:1 - id:2 = #{user1.diff_age(user2)}"

puts "\nFinish processing."
