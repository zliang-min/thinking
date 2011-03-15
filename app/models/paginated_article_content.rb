# encoding: utf-8

class PaginatedArticleContent < ActiveRecord::Base
  attr_accessible :index, :description, :body

  belongs_to :article
end
