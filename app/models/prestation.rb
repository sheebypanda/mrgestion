class Prestation < ApplicationRecord
  belongs_to :employeur
  belongs_to :client
  belongs_to :machine

  def start_time
    self.debut.to_datetime
  end
  def end_time
    self.fin.to_datetime
  end

end
