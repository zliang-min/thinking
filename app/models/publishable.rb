# encoding: utf-8

module Publishable
  class << self
    attr_reader :decendents

    def included(mod)
      (@decendents ||= []) << mod
    end
  end
end
