# 処理の流れを実装
# DBにアクセスはdomain層のrepositoryを介してアクセスすることで、infrastructure層ではなくdomain層のみに依存
module Usecase
  require "#{File.expand_path(__dir__)}/../domain/model/user"
  require "#{File.expand_path(__dir__)}/../domain/repository/user"

  # User usercase class
  class User
    # 引数で受け取ったinfrastructureインスタンスを設定
    # @params [Repository::User] repository
    def initialize(repository)
      @id = 3 # インクリメントするために初期化
      @user_repository = repository
    end

    # @params [Hash] user
    # @params [Date] birthday
    # @params [String] gender
    # @return [Model::User]
    def create(user)
      item = user
      item[:id] = @id
      @id += 1

      @user_repository.create(item)
    end

    # @params [Integer] id
    # @return [Model::User]
    def find_by_id(id)
      @user_repository.find(id)
    end

    # @params [Model::User] user
    # @return [Model::User]
    def update(user)
      @user_repository.update(user)
    end

    # @params [Integer] id
    # @return [nil]
    def delete(id)
      @user_repository.delete(id)
    end
  end
end
