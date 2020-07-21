# domain層に特定のデータアクセス基盤に依存しないようにインターフェースを定義
module Repository
  # User repository class
  class User
    require "#{File.expand_path(__dir__)}/../model/user"

    # rubocop:disable Lint/UnusedMethodArgument

    # jsonファイル読み込み
    def initialize(file_path)
      raise NotImplementedError, "Error: Not implemented #{self.class}##{__method__}"
    end

    # クラスメソッド
    class << self
      # 指定したIDのユーザを取得
      # @params [Integer] _id
      # @return [Model::User]
      def find(id)
        raise NotImplementedError, "Error: Not implemented #{self.class}##{__method__}"
      end

      # ユーザを作成
      # @params [Model::User] user
      # @return [Model::User]
      def create(user)
        raise NotImplementedError, "Error: Not implemented #{self.class}##{__method__}"
      end

      # ユーザの情報を更新
      # @params [Model::User] user
      # @return [Model::User]
      def update(user)
        raise NotImplementedError, "Error: Not implemented #{self.class}##{__method__}"
      end

      # ユーザを削除
      # @params [Integer] id
      # @return [nil]
      def delete(id)
        raise NotImplementedError, "Error: Not implemented #{self.class}##{__method__}"
      end

      # rubocop:enable Lint/UnusedMethodArgument
    end
  end
end
