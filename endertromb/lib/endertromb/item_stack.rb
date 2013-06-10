module Endertromb
  class ItemStack
    attr_reader :item_stack, :count

    def initialize(item_or_block, count = 1, metadata = nil)
      item_or_block = item_or_block.to_item_or_block
      @item_or_block = item_or_block
      @count = count
      @metadata = metadata
      item_or_block = item_or_block.item if item_or_block.is_a? Item
      item_or_block = item_or_block.block if item_or_block.is_a? Block
      @item_stack = net.minecraft.src.ItemStack.new(item_or_block, count, metadata || 0)
    end

    def item_id
      @item_stack.itemID
    end

    def to_item_or_block
      @item_or_block
    end

    def to_item_stack
      self
    end

    def to_s
      count = (@count == 1) ? "" : " (#@count)"
      metadata = (@metadata == 0) ? "" : ", metadata = #@metadata"
      "#{@item_or_block}#{count}#{metadata}"
    end

    def inspect
      to_s
    end
  end
end

