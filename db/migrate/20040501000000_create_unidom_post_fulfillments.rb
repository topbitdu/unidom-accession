class CreateUnidomPostFulfillments < ActiveRecord::Migration

  def change

    create_table :unidom_post_fulfillments, id: :uuid do |t|

      t.references :fulfilled, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :fulfiller, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.boolean :part_time, null: false, default: false
      t.boolean :temporary, null: false, default: false

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Time.utc(1970)
      t.datetime :closed_at,        null: false, default: Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_post_fulfillments, :fulfilled_id
    add_index :unidom_post_fulfillments, :fulfiller_id

  end

end
