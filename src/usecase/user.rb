# 処理の流れを実装
# DBにアクセスはdomain層のrepositoryを介してアクセスすることで、infrastructure層ではなくdomain層のみに依存
module Usecase
  require "#{File.expand_path(__dir__)}/../domain/model/user"
  require "#{File.expand_path(__dir__)}/../domain/repository/user"

  # User usercase class
  class User
    # @params [String] name
    # @params [Date] birthday
    # @params [String] gender
    # @return [Model::User]
    def create(name, birthday, gender)
    end

    # @params [Integer] id
    # @return [Model::User]
    def find_by_id(id)
    end

    # @params [Model::User] user
    # @return [Model::User]
    def update(user)
    end

    # @params [Integer] id
    # @return [Integer]
    def delete(id)
    end
  end
end
