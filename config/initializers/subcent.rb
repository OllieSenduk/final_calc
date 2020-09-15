# currencies = Money::Currency.table.dup

# currencies.each do |code, currency|
#   Money::Currency.unregister(currency)
# end

# currencies.each do |code, currency|
#   Money::Currency.register(currency.merge({subunit_to_unit: 100000}))
# end