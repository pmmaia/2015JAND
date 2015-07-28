ActiveAdmin.register MonitoringRecord do


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
      super.includes :activity
    end
  end

  index do
    column "Date ", :activity, sortable: 'activity.date'
    column :tag
    column :start_time
    column "Temperature (\u2109)", :temperature
    column "Relative Humidity (%)", :relative_humidity
    column :wind_direction
    column :measurement
    column :site_activity
    column :site_location
    actions
  end

  permit_params :tag, :start_time, :temperature, :relative_humidity, :wind_direction, :measurement, :site_activity, :site_location, activity_attributes: []

end
