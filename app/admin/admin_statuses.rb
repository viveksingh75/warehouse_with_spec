ActiveAdmin.register AdminStatus do
   permit_params :name
   filter :name 
 
index do 
  id_column
  column :name
  column :created_at
  column :updated_at
  actions
end
form do |f|
   f.inputs 'admin status' do
    f.input :name, as: :select, collection: AdminStatus.statuses.keys
end
f.actions
end
end

