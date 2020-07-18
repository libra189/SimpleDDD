# domain/domein layer
# user_modelの構造体やビジネスロジックを記述
module Model
  # User model class
  class User
    # クラス変数のgetter, setter
    attr_reader :id, :name, :birthday, :gender

    def initialize(id, name, birthday, gender)
      @id = id
      @name = name
      @birthday = birthday
      @gender = gender
    end

    # インスタンスメソッド

    def to_s
      "[<#{self.class}> id: #{@id}, name: #{@name}, birthday: #{@birthday}, gender: #{@gender}]"
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
