module Endertromb
  class Pig < Entity
    def self.cost
      ItemStack.new(:pork, 10)
    end
  end
end
