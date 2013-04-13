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
      original_sort!(*args, &blk)
      restack
    end

    private

    def restack
      each do |animal|
        if animal.riding?
          animal.unmount
        end
      end
      (length - 1).times do |i|
        self[i].mount(self[i + 1])
      end
      self
    end
  end
end

