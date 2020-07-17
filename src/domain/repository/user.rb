# domain/repository layer
# DBとのやりとりを定義
module Repository
  require "#{File.expand_path(__dir__)}"

  # User repository class
  class User
    def find(id)
      raise NotImplementedError.new("#{self.class}##{__method__} が実装されていません")
    end
  end
end
