# 特定の技術基盤にアクセスする層
# 本来はdomain層(model/repository)に定義、infrastructure層に実装とすることで修正に強くするが
# Rubyは動的型付け言語なのでdomain/repositoryのインターフェイスを飛ばして実装とする
module Infrastructure
  require "#{File.expand_path(__dir__)}/../domain/model/user"

  # User infrastructure class
  class User
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
  end
end
