class ImageLink < ApplicationRecord
    acts_as_taggable_on :tags


    validates :tag_list, presence: { message: "provide please." }
    validates :url, presence: { message: "provide please." }
    validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "is not valid" }
end
  