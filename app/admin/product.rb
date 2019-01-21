ActiveAdmin.register Product do
  permit_params :title, :price, :short_description, :full_description, :in_stock
end
