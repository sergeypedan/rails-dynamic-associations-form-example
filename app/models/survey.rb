class Survey < ActiveRecord::Base
	
	has_many :questions, dependent: :destroy

	accepts_nested_attributes_for :questions,
		reject_if: :all_blank,
		allow_destroy: true
		#reject_if: proc { |a| a['content'].blank? }
end
