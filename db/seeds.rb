Connection.delete_all
Company.delete_all
Year.delete_all

Company.create!(name: "Hurley", category: "Vereniging")

Year.create(
    name: "2015",
    tier_1_price: 11960,
    tier_2_price:  4690,
    tier_3_price:  1250,
    tier_4_price:  50
)

Year.create(
    name: "2016",
    tier_1_price: 10070,
    tier_2_price:  4996,
    tier_3_price:  1331,
    tier_4_price:  53
)
Year.create(
    name: "2017",
    tier_1_price: 10130,
    tier_2_price:  4901,
    tier_3_price:  1305,
    tier_4_price:  53
)

Year.create(
    name: "2018",
    tier_1_price: 0.10458,
    tier_2_price: 0.05274,
    tier_3_price: 0.01404,
    tier_4_price: 0.00057,
)

Year.create(
    name: "2019",
    tier_1_price: 0.09863,
    tier_2_price: 0.05337,
    tier_3_price: 0.01421,
    tier_4_price: 0.00058,
)
