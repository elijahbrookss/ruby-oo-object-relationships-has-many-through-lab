class Doctor

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name


    self.class.all << self
  end

  def new_appointment(patient_instance, date)
    Appointment.new(date, patient_instance, self)
  end

  def appointments
    Appointment.all.select{ |appointment| appointment.doctor == self }
  end

  def patients
    appointments.collect{ |appointment| appointment.patient }
  end

  def self.all
    @@all
  end
end
