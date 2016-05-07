ActiveAdmin.register Event do
  permit_params :title, :description, :slug, :category, :date
  before_filter only: [:edit, :destroy, :show, :update] do
    @event = Event.find_by_slug params[:id]
  end

  form do |f|
    f.inputs "Event Details" do
      f.input :title
      f.input :description
      f.input :slug
      f.input :category, as: :radio, collection: Event.categories.map { |k,v| [k.capitalize,k] }
      f.input :date
    end
    f.actions
  end

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


end
