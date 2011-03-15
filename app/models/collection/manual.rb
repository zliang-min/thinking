# encoding: utf-8

module Collection
  class Manual < Base
    attr_accessible :title, :description, :object_type

    has_many :items

    def each
      items.each &Proc.new
    end
  end

  class Auto < Base
    attr_accessible :title, :description, :object_type, :collection_fields, :collection_order, :collection_include

    has_many :find_restrictions

    def each
      object_type.constantize.
        select(collection_fields).
        include(collection_include).
        # 用插件来解释where（插件名字忘了，大概这样：
        #   where {
        #     field.gt value
        #     field.eq value
        #   }
        where().
        order(collection_order).
        limit(collection_limit).
        each &Proc.new
    end
  end

  class Custom < Base
    attr_accessible :find_logic

    def each
      Object.instance_eval(find_logic).each &Proc.new
    end
  end
end
