class Glucose < ApplicationRecord
    belongs_to :user
    validates :level, presence: true
    before_create :check_record_count

    def check_record_count
        readings = self.user.glucoses.where(reading_date: Date.today).count
        if readings >= 4
            errors.add :base, "You can't save more then 4 readings per day."
            throw :abort
        end
    end
end
