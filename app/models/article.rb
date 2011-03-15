# encoding: utf-8

class Article < ActiveRecord::Base
  include Publishable

  attr_accessible :title, :keywords, :description

  validates :title, presence: true, length: {maximum: 255}
  validates_length_of :keywords,    maximum: 20
  validates_length_of :description, maximum: 100

  has_many :paginated_content, :class_name => 'PaginatedArticleContent', :order => 'index asc'
end
