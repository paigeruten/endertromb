class Symbol
  def to_item_or_block
    if Endertromb::Item.all.include? self
      Endertromb::Item.new(self)
    elsif Endertromb::Block.all.include? self
      Endertromb::Block.new(self)
    end
  end

  def to_item_stack
    if item_or_block = self.to_item_or_block
      ItemStack.new(item_or_block)
    end
  end
end
