ActiveAdmin.register Catalogue do
  permit_params :name, :created_at, :updated_at
  filter :name
  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'Catalogue Details' do
      f.input :name
    end
    f.actions
  end
end
