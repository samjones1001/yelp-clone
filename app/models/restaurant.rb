class Restaurant < ActiveRecord::Base
  belongs_to :user
  validates :name, length: { minimum: 3 }, uniqueness: true
  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS8VQlM0FqrkQxwaRbA7EkZ1I2dsYvY2z4uwVwzz02LcBC1kL5zHA"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_review(attributes = {}, user)
   review = reviews.build(attributes)
   review.user = user
   review
 end

 def average_rating
   return 'N/A' if reviews.none?
   reviews.average(:rating)
end

end
