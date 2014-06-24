class Certificate < ActiveRecord::Base

  before_validation(:on => :create) do
    write_defaults
  end

  def write_defaults
    self.name = "Frank Reynolds" if self.name.blank?
    self.institution = "Reid Mental Institution" if self.institution.blank?
    self.state = "Pennsylvania" if self.state.blank?
    self.president = "Noah Mathers" if self.president.blank?
    self.psychiatrist = "Christina Haberkern" if self.psychiatrist.blank?
  end

end
