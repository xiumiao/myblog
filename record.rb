module Record
  def self.include(base)
    base.extend(ClassMethods)
    base.instance_eval do
      include InstanceMethods
    end
  end
  module InstanceMethods
    def save
      @pstore ||= PStore.new("page.pstore")
      @pstore.transaction do
        @pstore[:index] ||= Array.new
        id = self.id
        @pstore[:index].push(id)
        @pstore[id.to_sym] = self.page_references
      end
    end

  end
  module ClassMethods
    def all
      @pstore ||= PStore.new("page.pstore")
      @pstore.transaction do
        pages =  @pstore[:index] || []
        pages.map do |page|
          @pstore[page.to_sym]
        end
      end
    end
  end

  class Base
    attr_accessor :id

    def initialize
      @id = SecureRandom.uuid
    end

  end
  self.include(Base)
end