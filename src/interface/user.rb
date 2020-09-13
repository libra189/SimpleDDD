# リクエストを受け取ったり、usecase層からのレスポンスをユーザーに返却
module Interface
  require "#{File.expand_path(__dir__)}/../usecase/user"

  # User usercase class
  class User
    # 引数で受け取ったusecaseインスタンスを設定
    # @params [Usecase::User] usecase
    def initialize(usecase)
      @user_handler = usecase
    end

    # 新規作成
    # @params [String] name
    # @params [String] birthday
    # @params [String] gender
    # @return [Model::User]
    def post(name, birthday, gender)
      params = {
        name: name,
        birthday: birthday,
        gender: gender
      }

      @user_handler.create(params)
    end

    # 取得
    # @params [Integer] id
    # @return [Model::User]
    def get(id)
      @user_handler.find_by_id(id)
    end

    # 更新
    # @params [Model::User] user
    # @return [Model::User]
    def put(user)
      @user_handler.update(user)
    end

    # 削除
    # @params [Integer] id
    # @return [nil]
    def delete(id)
      @user_handler.delete(id)
    end
  end
end
