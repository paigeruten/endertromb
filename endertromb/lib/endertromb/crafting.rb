module Endertromb
  module Crafting
    def self.add_shapeless_recipe(ingredients, result)
      ingredients.map! do |item_or_block|
        item_or_block = item_or_block.to_item_or_block
        if item_or_block.is_a? Item
          item_or_block.item
        elsif item_or_block.is_a? Block
          item_or_block.block
        end
      end
      result = result.to_item_stack.item_stack

      net.minecraft.src.CraftingManager.instance.add_shapeless_recipe(result, *ingredients)
    end
  end
end

