class Doctor
  attr_accessor :name

  @@all = []

  def initialize(docname)
    @name = docname
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor == self
    end
  end

  def patients
    appointment.map(&:patient) # https://stackoverflow.com/questions/9429819/what-is-the-functionality-of-operator-in-ruby
  end

end
