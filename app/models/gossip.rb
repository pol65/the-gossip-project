class Gossip < ApplicationRecord
    has_many :addgossips
    has_many :tags, through: :addgossips
    has_many :likes, dependent: :destroy
    belongs_to :user
end
