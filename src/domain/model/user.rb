# domain/domein layer
# user_modelの構造体やビジネスロジックを記述
module Domain
  module Model
    # User model class
    class User
      # クラス変数のgetter, setter
      attr_reader :id
      attr_reader :name
      attr_reader :birthday
      attr_reader :gender

      def initialize(id, name, birthday, gender)
        @id = id
        @name = name
        @birthday = birthday
        @gender = gender
      end

      # クラスメソッド
      class << self
        # 指定したIDのユーザを取得
        # @params [Integer] id
        # @return [Model::User]
        def find(id)
          json = File.open('./json/User.json').read

          # jsonを変換
          data_list = JSON.parse(json, symbolize_names: true)

          # jsonをstructに変換
          item = data_list.select { |i| i[:id] == id }.first
          User.new(item[:id], item[:name], Date.parse(item[:birthday]), item[:gender])
        end
      end

      # インスタンスメソッド

      def to_s
        "id: #{@id}, name: #{@name}, birthday: #{@birthday}, gender: #{@gender}"
      end

      # ユーザの年齢差を求める
      # @params [Model::User] user1
      # @params [Model::User] user2
      # @return [Integer]
      def diff_age(target_user)
        today = Date.today
        self_user_age = ((today - @birthday).to_i / 365.5).to_i
        target_user_age = ((today - target_user.birthday).to_i / 365.5).to_i
        target_user_age - self_user_age
      end
    end
  end
end
