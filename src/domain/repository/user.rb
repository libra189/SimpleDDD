# domain/repository layer
# DBとのやりとりを定義
module Repository
  require "#{File.expand_path(__dir__)}/../model/user"

  # User repository class
  class User
    # クラスメソッド
    class << self
      # 指定したIDのユーザを取得
      # @params [Integer] id
      # @return [Model::User]
      def find(id)
        json = File.open("#{File.expand_path(__dir__)}/../../../json/User.json").read

        # jsonを変換
        data_list = JSON.parse(json, symbolize_names: true)

        # jsonをstructに変換
        item = data_list.select { |i| i[:id] == id }.first
        Model::User.new(item[:id], item[:name], Date.parse(item[:birthday]), item[:gender])
      end
    end
  end
end
