class Intemperie < ApplicationRecord
  def start_time
    self.date.to_datetime
  end
  def end_time
    self.date.to_datetime
  end
end
