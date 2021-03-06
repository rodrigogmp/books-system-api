class Book < ApplicationRecord
  mount_uploader :image, BookImageUploader

  belongs_to :publishing_company
  belongs_to :author
  belongs_to :genre

  validates_presence_of :title, :description
  validates_uniqueness_of :title

	scope :by_title, -> (title) {
		where('title like ?', "%#{title}%")
  }

  scope :by_description, -> (description) {
		where('description like ?', "%#{description}%")
  }

  scope :by_title_or_description, -> (title_or_description) {
		where('description like ? or title like ?', "%#{title_or_description}%", "%#{title_or_description}%")
  }

  scope :by_genre, -> (genre) {
    joins(:genre)
		.where('genres.name like ?', "%#{genre}%")
  }

  scope :by_author, -> (author) {
    joins(:author)
    .where('authors.name like ?', "%#{author}%")
  }

  scope :by_publishing_company, -> (publishing_company) {
    joins(:publishing_company)
		.where('publishing_companies.name like ?', "%#{publishing_company}%")
  }
  
  scope :by_alphabetic_order, -> (order) {
    order = order.to_sym

    return unless [:asc, :desc].include? order

    order(title: order)
  }
end
