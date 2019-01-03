require 'rails_helper'

RSpec.describe "album routing" do
  it "routes albums" do
    expect(get: '/albums').to route_to(controller: 'albums', action: 'index')
    expect(post: '/albums').to route_to(controller: 'albums', action: 'create')
    expect(get: '/albums/1').to route_to(controller: 'albums', action: 'show', id: '1')
    expect(get: "/albums/new").to route_to(controller: "albums", action: "new")
    expect(get: "/albums/1/edit").to route_to(controller: "albums", action: "edit", id: "1")
    expect(patch: "/albums/1").to route_to(controller: "albums", action: "update", id: "1")
    expect(delete: "/albums/1").to route_to(controller: "albums", action: "destroy", id: "1")

    expect(get: '/').to route_to(controller: 'albums', action: 'index')
  end
end