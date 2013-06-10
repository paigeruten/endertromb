module Endertromb
  module Inventory
    def self.have_items(item_stack)
      item_stack = item_stack.to_item_stack
      n = item_stack.count
      item_id = item_stack.item_id
      $player.inventory.mainInventory.each do |current_stack|
        if current_stack && current_stack.itemID == item_id
          n -= current_stack.stackSize
          return true if n <= 0
        end
      end
      false
    end

    def self.remove_items(item_stack)
      item_stack = item_stack.to_item_stack
      if self.have_items(item_stack)
        item_stack.count.times do
          $player.inventory.consumeInventoryItem(item_stack.item_id)
        end
        true
      else
        false
      end
    end
  end
end
