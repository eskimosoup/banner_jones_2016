class CreateServiceTestimonials < ActiveRecord::Migration
  def change
    create_table :service_testimonials do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.belongs_to :testimonial, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
