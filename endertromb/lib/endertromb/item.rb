module Endertromb
  class Item
    ITEM_LIST = {
      iron_shovel: :shovelIron,
      iron_pickaxe: :pickaxeIron,
      iron_axe: :axeIron,
      flint_and_steel: :flintAndSteel,
      apple: :appleRed,
      bow: :bow,
      arrow: :arrow,
      coal: :coal,
      diamond: :diamond,
      iron_ingot: :ingotIron,
      gold_ingot: :ingotGold,
      iron_sword: :swordIron,
      wood_sword: :swordWood,
      wood_shovel: :shovelWood,
      wood_pickaxe: :pickaxeWood,
      wood_axe: :axeWood,
      stone_sword: :swordStone,
      stone_shovel: :shovelStone,
      stone_pickaxe: :pickaxeStone,
      stone_axe: :axeStone,
      diamond_sword: :swordDiamond,
      diamond_shovel: :shovelDiamond,
      diamond_pickaxe: :pickaxeDiamond,
      diamond_axe: :axeDiamond,
      stick: :stick,
      bowl: :bowlEmpty,
      mushroom_stew: :bowlSoup,
      gold_sword: :swordGold,
      gold_shovel: :shovelGold,
      gold_pickaxe: :pickaxeGold,
      gold_axe: :axeGold,
      string: :silk,
      feather: :feather,
      gunpowder: :gunpowder,
      wood_hoe: :hoeWood,
      stone_hoe: :hoeStone,
      iron_hoe: :hoeIron,
      diamond_hoe: :hoeDiamond,
      gold_hoe: :hoeGold,
      seeds: :seeds,
      wheat: :wheat,
      bread: :bread,
      leather_helmet: :helmetLeather,
      leather_chestplate: :plateLeather,
      leather_leggings: :legsLeather,
      leather_boots: :bootsLeather,
      chain_helmet: :helmetChain,
      chain_chestplate: :plateChain,
      chain_leggings: :legsChain,
      chain_boots: :bootsChain,
      iron_helmet: :helmetIron,
      iron_chestplate: :plateIron,
      iron_leggings: :legsIron,
      iron_boots: :bootsIron,
      diamond_helmet: :helmetDiamond,
      diamond_chestplate: :plateDiamond,
      diamond_leggings: :legsDiamond,
      diamond_boots: :bootsDiamond,
      gold_helmet: :helmetGold,
      gold_chestplate: :plateGold,
      gold_leggings: :legsGold,
      gold_boots: :bootsGold,
      flint: :flint,
      pork: :porkRaw,
      cooked_pork: :porkCooked,
      painting: :painting,
      golden_apple: :appleGold,
      sign: :sign,
      door: :doorWood,
      bucket: :bucketEmpty,
      water_bucket: :bucketWater,
      lava_bucket: :bucketLava,
      minecart: :minecartEmpty,
      saddle: :saddle,
      iron_door: :doorIron,
      redstone: :redstone,
      snowball: :snowball,
      boat: :boat,
      leather: :leather,
      milk_bucket: :bucketMilk,
      brick: :brick,
      clay: :clay,
      reed: :reed,
      paper: :paper,
      book: :book,
      slime_ball: :slimeBall,
      minecart_with_chest: :minecartCrate,
      minecart_with_furnace: :minecartPowered,
      egg: :egg,
      compass: :compass,
      fishing_rod: :fishingRod,
      clock: :pocketSundial,
      glowstone_dust: :lightStoneDust,
      fish: :fishRaw,
      cooked_fish: :fishCooked,
      dye: :dyePowder,
      bone: :bone,
      sugar: :sugar,
      cake: :cake,
      bed: :bed,
      repeater: :redstoneRepeater,
      cookie: :cookie,
      map: :map,
      shears: :shears,
      melon: :melon,
      pumpkin_seeds: :pumpkinSeeds,
      melon_seeds: :melonSeeds,
      beef: :beefRaw,
      cooked_beef: :beefCooked,
      chicken: :chickenRaw,
      cooked_chicken: :chickenCooked,
      rotten_flesh: :rottenFlesh,
      ender_pearl: :enderPearl,
      blaze_rod: :blazeRod,
      ghast_tear: :ghastTear,
      gold_nugget: :goldNugget,
      nether_wart: :netherStalkSeeds,
      potion: :potion,
      bottle: :glassBottle,
      spider_eye: :spiderEye,
      fermented_spider_eye: :fermentedSpiderEye,
      blaze_powder: :blazePowder,
      magma_cream: :magmaCream,
      brewing_stand: :brewingStand,
      cauldron: :cauldron,
      ender_eye: :eyeOfEnder,
      glistering_melon: :speckledMelon,
      spawn_egg: :monsterPlacer,
      bottle_of_enchanting: :expBottle,
      fireball: :fireballCharge,
      writable_book: :writableBook,
      written_book: :writtenBook,
      emerald: :emerald,
      item_frame: :itemFrame,
      pot: :flowerPot,
      carrot: :carrot,
      potato: :potato,
      baked_potato: :bakedPotato,
      poisonous_potato: :poisonousPotato,
      empty_map: :emptyMap,
      golden_carrot: :goldenCarrot,
      head: :skull,
      carrot_on_a_stick: :carrotOnAStick,
      nether_star: :netherStar,
      pumpkin_pie: :pumpkinPie,
      firework: :firework,
      firework_charge: :fireworkCharge,
      enchanted_book: :enchantedBook,
      comparator: :comparator,
      nether_brick: :netherrackBrick,
      nether_quartz: :netherQuartz,
      minecart_with_tnt: :tntMinecart,
      minecart_with_hopper: :hopperMinecart,
      record_13: :record13,
      record_cat: :recordCat,
      record_blocks: :recordBlocks,
      record_chirp: :recordChirp,
      record_far: :recordFar,
      record_mall: :recordMall,
      record_mellohi: :recordMellohi,
      record_stal: :recordStal,
      record_strad: :recordStrad,
      record_ward: :recordWard,
      record_11: :record11,
      record_wait: :recordWait
    }

    attr_reader :item, :name

    def initialize(name)
      name = name.to_sym if name.is_a? String
      if name.is_a?(Symbol)
        item = ITEM_LIST[name]
        raise ArgumentError, "There is no item '#{name}'." if item.nil?
        @item = net.minecraft.src.Item.send(item)
        @name = name.to_sym
      else
        raise ArgumentError, "Item.new expects an item name, not a #{name.class}."
      end
    end

    def item_id
      item.itemID
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
      "Item #@name"
    end

    def self.all
      ITEM_LIST.keys
    end
  end
end

