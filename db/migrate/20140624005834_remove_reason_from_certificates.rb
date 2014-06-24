class RemoveReasonFromCertificates < ActiveRecord::Migration
  def change
    remove_column :certificates, :reason, :string
  end
end
