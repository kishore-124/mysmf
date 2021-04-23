ActiveAdmin.register Topic do
  #customizing menu
  #  menu label: proc{ I18n.t "mypost" }
  # menu if: proc{ current_user.can_edit_posts? }
  menu label: "My Topics"


  #customizing querying

  #def scoped_collection
  #  end_of_association_chain.where(name: "test")
  #end

  #asscociatation
  #belongs_to :user

  #scope
  #scope_to :current_user, if:     proc{ current_user.limited_access? }
  #scope_to :current_user, unless: proc{ current_user.admin? }

  #egar loding
  #includes :author, :categories

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