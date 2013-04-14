class String
  def to_item_or_block
    to_sym.to_item_or_block
  end

  def to_item_stack
    to_sym.to_item_stack
  end
end

