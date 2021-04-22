ActiveAdmin.register Topic do
  # ====================Actions=========================================================================================
  index download_links: false do
    column :name
    column :description
    actions defaults: false do |topic|
      item "View", admin_topic_path(topic), prirority: 0
      item "Edit", edit_admin_topic_path(topic), prirority: 1
      item "Destroy", admin_topic_path(topic),
           method: :delete,
           data: {confirm: 'Are you sure to delete?'},
           prirority: 2
    end
  end

  show do
    attributes_table do
      row :name
      row :description
    end
  end
  # ====================Form============================================================================================
  form do |form|
    form.inputs do
      form.input :name
      form.input :description
    end
    form.actions
  end
  # ====================Controller======================================================================================
  controller do

    def new
      @topic = Topic.new
    end

    def create
      @topic = Topic.new(permit_params)
      if @topic.save
        redirect_to admin_topic_path(@topic)
      else
        render :new
      end
    end

    private

    def permit_params
      params.require(:company).permit(:name, :description)
    end
  end
  # ====================Params permit===================================================================================
  permit_params :name, :description
end