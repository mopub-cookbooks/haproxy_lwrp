action :create do
  runit_service new_resource.name do
    run_template_name "haproxy2"
    default_logger true
    options({
              :filename => "/etc/haproxy/#{new_resource.name}.cfg",
            })
  end
  template "/etc/haproxy/#{new_resource.name}.cfg" do
    mode 0755
    user new_resource.user
    source new_resource.source
    variables({
                :global => new_resource.global,
                :defaults => new_resource.defaults,
                :frontend => new_resource.frontend,
                :backend => new_resource.backend,
                :listen => new_resource.listen
              })
    notifies :restart, 'service[' + new_resource.name + ']',:delayed 
  end
end
