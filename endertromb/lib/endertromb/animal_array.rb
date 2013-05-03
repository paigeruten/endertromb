module Endertromb
  class AnimalArray < Array
    def self.[](*)
      ary = super
      ary.send :restack
    end

    def initialize(*)
      super
      restack
    end

    alias_method :original_sort!, :sort!
    def sort!(*args, &blk)
      base_y = last.posY
      original_sort!(*args, &blk)
      restack(base_y)
    end

    private

    def restack(base_y = nil)
      each do |animal|
        if animal.riding?
          animal.unmount
        end
      end
      if base_y
        last.set_position(last.posX, base_y, last.posZ)
      end
      (length - 1).times do |i|
        self[i].mount(self[i + 1])
      end
      self
    end
  end
end

