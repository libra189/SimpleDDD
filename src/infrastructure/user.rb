# 特定の技術基盤にアクセスする層
# 本来はdomain層(model/repository)に定義、infrastructure層に実装とすることで修正に強くするが
# Rubyは動的型付け言語なのでdomain/repositoryのインターフェイスを飛ばして実装とする
module Infrastructure
  require "#{File.expand_path(__dir__)}/../domain/model/user"
  require "#{File.expand_path(__dir__)}/../domain/repository/user"

  # User infrastructure class
  class User < Repository::User
    # jsonファイル読み込み
    def initialize(file_path)
      json = File.open(file_path).read
      @data_list = JSON.parse(json, symbolize_names: true)
    end

    # 指定したIDのユーザを取得
    # @params [Integer] id
    # @return [Model::User]
    def find(id)
      item = @data_list.select { |i| i[:id] == id }.first
      raise 'NotFound' if item.nil?

      Model::User.new(item[:id], item[:name], Date.parse(item[:birthday]), item[:gender])
    end

    # ユーザを作成
    # @params [Hash] user
    # @return [Model::User]
    def create(user)
      @data_list.push(user)
      find(user[:id])
    end

    # ユーザの情報を更新
    # @params [Model::User] user
    # @return [Model::User]
    def update(user)
      item = @data_list.select { |i| i[:id] == id }.first
      raise 'NotFound' if item.nil?

      user_hash = user.to_h
      item.each_key do |key|
        item[key] = user_hash[key]
      end
      user
    end

    # ユーザを削除
    # @params [Integer] id
    # @return [nil]
    def delete(id)
      @data_list.delete_if { |i| i[:id] == id }
    end
  end
end
