module Endertromb
  class Block
    BLOCK_LIST = {
      stone: :stone,
      grass: :grass,
      dirt: :dirt,
      cobblestone: :cobblestone,
      planks: :planks,
      sapling: :sapling,
      bedrock: :bedrock,
      flowing_water: :waterMoving,
      water: :waterStill,
      flowing_lava: :lavaMoving,
      lava: :lavaStill,
      sand: :sand,
      gravel: :gravel,
      gold_ore: :oreGold,
      iron_ore: :oreIron,
      coal_ore: :oreCoal,
      log: :wood,
      leaves: :leaves,
      sponge: :sponge,
      glass: :glass,
      lapis_ore: :oreLapis,
      lapis_block: :blockLapis,
      dispenser: :dispenser,
      sand_stone: :sandStone,
      note: :music,
      bed: :bed,
      powered_rail: :railPowered,
      detector_rail: :railDetector,
      sticky_piston_base: :pistonStickyBase,
      web: :web,
      tall_grass: :tallGrass,
      dead_bush: :deadBush,
      piston_base: :pistonBase,
      piston_extension: :pistonExtension,
      wool: :cloth,
      moving_piston: :pistonMoving,
      yellow_flower: :plantYellow,
      red_flower: :plantRed,
      brown_mushroom: :mushroomBrown,
      red_mushroom: :mushroomRed,
      gold_block: :blockGold,
      iron_block: :blockIron,
      stone_double_slab: :stoneDoubleSlab,
      stone_slab: :stoneSingleSlab,
      brick: :brick,
      tnt: :tnt,
      book_shelf: :bookShelf,
      mossy_cobblestone: :cobblestoneMossy,
      obsidian: :obsidian,
      torch: :torchWood,
      fire: :fire,
      spawner: :mobSpawner,
      oak_wood_stairs: :stairsWoodOak,
      chest: :chest,
      redstone_dust: :redstoneDust,
      diamond_ore: :oreDiamond,
      diamond_block: :blockDiamond,
      workbench: :workbench,
      crops: :crops,
      farmland: :tilledField,
      furnace: :furnaceIdle,
      burning_furnace: :furnaceBurning,
      sign_post: :signPost,
      door: :doorWood,
      ladder: :ladder,
      rail: :rail,
      cobblestone_stairs: :stairsCobblestone,
      sign_wall: :signWall,
      lever: :lever,
      stone_pressure_plate: :pressurePlateStone,
      iron_door: :doorIron,
      wood_pressure_plate: :pressurePlatePlanks,
      redstone_ore: :oreRedstone,
      glowing_redstone_ore: :oreRedstoneGlowing,
      redstone_torch: :torchRedstoneIdle,
      redstone_torch_active: :torchRedstoneActive,
      stone_button: :stoneButton,
      snow: :snow,
      ice: :ice,
      snow_block: :blockSnow,
      cactus: :cactus,
      clay_block: :blockClay,
      reed: :reed,
      jukebox: :jukebox,
      fence: :fence,
      pumpkin: :pumpkin,
      netherrack: :netherrack,
      soul_sand: :slowSand,
      glowstone: :glowStone,
      portal: :portal,
      jack_o_lantern: :pumpkinLantern,
      cake: :cake,
      repeater: :redstoneRepeaterIdle,
      repeater_active: :redstoneRepeaterActive,
      locked_chest: :lockedChest,
      trapdoor: :trapdoor,
      silverfish: :silverfish,
      stone_brick: :stoneBrick,
      brown_mushroom_cap: :mushroomCapBrown,
      red_mushroom_cap: :mushroomCapRed,
      iron_fence: :fenceIron,
      glass_pane: :thinGlass,
      melon: :melon,
      pumpkin_stem: :pumpkinStem,
      melon_stem: :melonStem,
      vine: :vine,
      gate: :fenceGate,
      brick_stairs: :stairsBrick,
      stone_brick_stairs: :stairsStoneBrick,
      mycelium: :mycelium,
      waterlily: :waterlily,
      nether_brick: :netherBrick,
      nether_fence: :netherFence,
      nether_brick_stairs: :stairsNetherBrick,
      nether_wart: :netherStalk,
      enchantment_table: :enchantmentTable,
      brewing_stand: :brewingStand,
      cauldron: :cauldron,
      end_portal: :endPortal,
      end_portal_frame: :endPortalFrame,
      end_stone: :whiteStone,
      dragon_egg: :dragonEgg,
      redstone_lamp: :redstoneLampIdle,
      redstone_lamp_active: :redstoneLampActive,
      wood_double_slab: :woodDoubleSlab,
      wood_slab: :woodSingleSlab,
      cocoa_beans: :cocoaPlant,
      sand_stone_stairs: :stairsSandStone,
      emerald_ore: :oreEmerald,
      ender_chest: :enderChest,
      tripwire_hook: :tripWireSource,
      tripwire: :tripWire,
      emerald_block: :blockEmerald,
      spruce_wood_stairs: :stairsWoodSpruce,
      birch_wood_stairs: :stairsWoodBirch,
      jungle_wood_stairs: :stairsWoodJungle,
      command_block: :commandBlock,
      beacon: :beacon,
      cobblestone_wall: :cobblestoneWall,
      pot: :flowerPot,
      carrot: :carrot,
      potato: :potato,
      wood_button: :woodenButton,
      head: :skull,
      anvil: :anvil,
      trapped_chest: :chestTrapped,
      gold_pressure_plate: :pressurePlateGold,
      iron_pressure_plate: :pressurePlateIron,
      comparator: :redstoneComparatorIdle,
      comparator_active: :redstoneComparatorActive,
      daylight_sensor: :daylightSensor,
      redstone_block: :blockRedstone,
      nether_quartz_ore: :oreNetherQuartz,
      hopper: :hopperBlock,
      nether_quartz_block: :blockNetherQuartz,
      nether_quartz_stairs: :stairsNetherQuartz,
      activator_rail: :railActivator,
      dropper: :dropper
    }

    attr_reader :block, :name

    def initialize(name)
      name = name.to_sym if name.is_a? String
      if name.is_a?(Symbol)
        block = BLOCK_LIST[name]
        raise ArgumentError, "There is no block '#{name}'." if block.nil?
        @block = net.minecraft.src.Block.send(block)
        @name = name.to_sym
      else
        raise ArgumentError, "Block.new expects a block name, not a #{name.class}."
      end
    end

    def to_item_or_block
      self
    end

    def to_item_stack
      ItemStack.new(self)
    end

    def to_s
      @name
    end

    def inspect
      "Block #@name"
    end

    def self.all
      BLOCK_LIST.keys
    end
  end
end

