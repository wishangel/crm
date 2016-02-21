class Company < ActiveRecord::Base
	has_many :customers

	validates :company_id, presence: true
end
