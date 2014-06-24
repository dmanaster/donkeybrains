class AddStateToCertificate < ActiveRecord::Migration
  def change
    add_column :certificates, :state, :string
  end
end
