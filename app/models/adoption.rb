class Adoption < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  enum status: {
    pending: 'pending',
    approved: 'approved', 
    rejected: 'rejected',
    completed: 'completed',
    cancelled: 'cancelled'
  }

  validates :status, presence: true
  validates :form_data, presence: true


end
