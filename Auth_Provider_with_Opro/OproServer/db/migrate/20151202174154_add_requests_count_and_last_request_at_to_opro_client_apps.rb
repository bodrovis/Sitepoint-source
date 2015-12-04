class AddRequestsCountAndLastRequestAtToOproClientApps < ActiveRecord::Migration
  def change
    add_column :opro_client_apps, :requests_count, :integer, default: 0
    add_column :opro_client_apps, :last_request_at, :date, default: Date.today
  end
end
