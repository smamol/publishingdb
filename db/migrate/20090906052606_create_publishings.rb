class CreatePublishings < ActiveRecord::Migration
  def self.up

        create_table :publishings do |t|
          t.integer :person_id, :null => false
          t.integer :publication_id, :null => false
          t.timestamps
        end

        add_index(:publishings, [:person_id, :publication_id], :unique => true)
        add_index(:publishings, :publication_id)

        add_foreign_key(:publishings, :publication_id, :publications, :id, :name => :fk_publishings_publication_id)    
        add_foreign_key(:publishings, :person_id, :people, :id, :name => :fk_publishings_person_id)    

     end


      def self.down
        remove_foreign_key :publishings, :fk_publishings_publication_id
        remove_foreign_key :publishings, :fk_publishings_person_id

        drop_table :publishings
      end
    end