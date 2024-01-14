class UsersGrid < BaseGrid
  scope do
    User
  end

  def self.tiers
    0..(tiers_count - 1)
  end

  class_attribute :tiers_count, default: 2

  def self.tiered_columns(name, options, blocks)
    tiers.each do |tier|
      block = blocks[tier] || -> (_) { '--blank--' }
      column(name, **options, tier: tier) do |model|
        block.call(model)
      end
    end
  end

  tiered_columns(:col1, {header: "Col 1"}, [
    -> (model) { model.first_name },
    -> (model) { model.last_name },
  ])
  tiered_columns(:col2, {header: "Col 2"}, [
    -> (model) { model.age },
    -> (model) { model.job },
  ])

  def columns_by_tier(tier)
    columns.select{|c| c.options[:tier] == tier}
  end

  def tiers
    self.class.tiers
  end
end
