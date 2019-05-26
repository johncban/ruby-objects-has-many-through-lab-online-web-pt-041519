class Patient
  attr_accessor :name

  @@all = []

  def initialize(p_name)
    @name = p_name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all do |apt|
      apt.new == self
    end
  end

  def doctors
    appointments.map(&:doctor) # https://stackoverflow.com/questions/9429819/what-is-the-functionality-of-operator-in-ruby
  end
end
