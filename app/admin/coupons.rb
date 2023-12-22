ActiveAdmin.register Coupon do

  permit_params :name, :coupon_code, :discount, :start_date, :end_date,:admin_user_id
  filter :admin_user_id
  filter :name
  filter :coupon_code
  filter :discount

  index do
    selectable_column
    id_column
    column :name
    column :coupon_code
    column :discount
    column :start_date
    column :end_date
    column 'Admin User' do |coupon|
      coupon.admin_user.email if coupon.admin_user
    end
    actions
  end

  form do |f|
    f.inputs 'Coupon Details' do
      f.input :name
      f.input :coupon_code
      f.input :discount
      f.input :start_date
      f.input :end_date
      f.input :admin_user_id, input_html: { value: current_admin_user.id }, as: :hidden
    end
    f.actions
  end
end
