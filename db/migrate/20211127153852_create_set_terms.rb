class CreateSetTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :set_terms do |t|
      t.date :term

      t.timestamps
    end
  end
end
