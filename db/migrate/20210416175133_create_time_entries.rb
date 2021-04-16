class CreateTimeEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :time_entries do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.timestamp :starts_at
      t.timestamp :finishes_at
      t.boolean :changed, default: false

      t.timestamps
    end
  end
end
