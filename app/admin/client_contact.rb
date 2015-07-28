ActiveAdmin.register ClientContact do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  controller do
    def scoped_collection
      super.includes :client
    end
  end

  index do
    column "Client Name", :client, sortable: 'client.name'
    column :first_name
    column :last_name
    column :phone
    column :email
    actions
  end

  permit_params :first_name, :last_name, :phone, :email, :client_id, :client

end
