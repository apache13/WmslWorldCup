class AddOwnGoalAndYellowCardAndRedCardAndPenaltyToMatches < ActiveRecord::Migration
  def change
    add_column :matches , :own_goal , :boolean
    add_column :matches , :yellow_card, :boolean
    add_column :matches , :red_card , :boolean
    add_column :matches , :penalty , :boolean
  end
end
