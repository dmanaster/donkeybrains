class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :name
      t.string :institution
      t.string :reason

      t.timestamps
    end
  end
end
