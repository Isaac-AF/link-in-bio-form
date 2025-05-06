class BackdoorController < ApplicationController
  http_basic_authenticate_with name: "username", password: "password"

  def form
    @list_of_items = Item.all.order({:created_at => :desc})
    
    render({ :template => "backdoor_templates/form" })
  end
  
  def add_data_and_redirect
    @link = params.fetch(:query_link_url)
    @description = params.fetch(:query_link_description)
    @thumbnail = params.fetch(:query_thumbnail_url)

    Item.create({:link_url => @link, :link_description => @description, :thumbnail_url => @thumbnail})

    redirect_to("/")
  end

  def delete_data_and_redirect
    Item.delete(params[:item_id])

    redirect_to("/backdoor")
  end
end
