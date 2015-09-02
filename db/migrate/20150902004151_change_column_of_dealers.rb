class ChangeColumnOfDealers < ActiveRecord::Migration
  def change
  rename_column :dealers, :type, :shop_type
  end
end
