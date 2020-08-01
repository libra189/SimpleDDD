# 処理の流れを実装
# DBにアクセスはdomain層のrepositoryを介してアクセスすることで、infrastructure層ではなくdomain層のみに依存
module Usecase
  require "#{File.expand_path(__dir__)}/../domain/model/user"
  require "#{File.expand_path(__dir__)}/../domain/repository/user"

  class User

  end
end