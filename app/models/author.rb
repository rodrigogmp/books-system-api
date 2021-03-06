class Author < ApplicationRecord
  mount_uploader :avatar, AuthorAvatarUploader

  has_many :books, dependent: :destroy

  validates_uniqueness_of :name
  validates_presence_of :name

	scope :by_name, -> (name) {
		where('name like ?', "%#{name}%")
  }
  
  scope :by_alphabetic_order, -> (order) {
    order = order.to_sym

    return unless [:asc, :desc].include? order

    order(name: order)
  }
end
