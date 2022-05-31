class Article < ApplicationRecord
    has_many :comments
    has_rich_text :body
    belongs_to :user

    def next
        Article.where("id > :id", id: id).first
    end
    def previews
        Article.where("id < :id", id: id).last
    end
end
