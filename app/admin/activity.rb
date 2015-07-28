ActiveAdmin.register Activity do


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
      super.includes :project
    end
  end

  index do
    column "Project Name", :project, sortable: 'project.name'
    column :date
    column :monitored_type
    column :recorded_by
    column :equipment
    column :weather
    actions
  end

  form do |f|
    f.inputs :project, :date, :monitored_type, :recorded_by, :equipment, :weather
    f.actions
  end

  permit_params :date, :monitored_type, :recorded_by, :equipment, :weather, :project_id, :project

end
