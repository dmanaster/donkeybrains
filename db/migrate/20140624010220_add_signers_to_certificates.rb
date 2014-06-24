class AddSignersToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates, :president, :string
    add_column :certificates, :psychiatrist, :string
  end
end
