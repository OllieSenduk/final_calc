# if Rails.env.development?
#     ConnectionYear.delete_all
#     Connection.delete_all
#     Company.delete_all
#     Year.delete_all
# end

Company.create!(name: "Hurley", category: "Vereniging")

Year.create(
    name: "2015",
    tier_1_price: 11960,
    tier_2_price:  4690,
    tier_3_price:  1250,
    tier_4_price:  50,
    tier_1_storage_price:  360,
    tier_2_storage_price:  460,
    tier_3_storage_price:  120,
    tier_4_storage_price:  5.5,
)

Year.create(
    name: "2016",
    tier_1_price: 10070,
    tier_2_price:  4996,
    tier_3_price:  1331,
    tier_4_price:  53,
    tier_1_storage_price:  560,
    tier_2_storage_price:  700,
    tier_3_storage_price:  190,
    tier_4_storage_price:  8.4,
)
Year.create(
    name: "2017",
    tier_1_price: 10130,
    tier_2_price:  4901,
    tier_3_price:  1305,
    tier_4_price:  53,
    tier_1_storage_price:  740,
    tier_2_storage_price:  1230,
    tier_3_storage_price:  330,
    tier_4_storage_price:  13.1,
)

Year.create(
    name: "2018",
    tier_1_price: 10458,
    tier_2_price: 5274,
    tier_3_price: 1404,
    tier_4_price: 57,
    tier_1_storage_price:  1320,
    tier_2_storage_price:  1800,
    tier_3_storage_price:  480,
    tier_4_storage_price:  19.4,
)

Year.create(
    name: "2019",
    tier_1_price: 9863,
    tier_2_price: 5337,
    tier_3_price: 1421,
    tier_4_price: 58,
    tier_1_storage_price:  1890,
    tier_2_storage_price:  2780,
    tier_3_storage_price:  740,
    tier_4_storage_price:  30,
)

TaxCredit.create(
    year: 2015,
    amount:  -311.84
)
TaxCredit.create(
    year: 2016,
    amount:  -310.81
)
TaxCredit.create(
    year: 2017,
    amount:  -308.54
)
TaxCredit.create(
    year: 2018,
    amount:  -308.54
)

TaxCredit.create(
    year: 2019,
    amount:   -257.54
)

