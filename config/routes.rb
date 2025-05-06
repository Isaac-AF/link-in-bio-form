Rails.application.routes.draw do

  get("/", { :controller => "items", :action => "index" })

  get("/backdoor", { :controller => "backdoor", :action => "form" })
  post("/insert_item", { :controller => "backdoor", :action => "add_data_and_redirect" })
  post("/delete_item", { :controller => "backdoor", :action => "delete_data_and_redirect" })
end
