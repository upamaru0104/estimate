# 親カテゴリー
transportation_expenses, personnel_costs, water_analysis = EstimateProduct.create([{summary: "交通費"}, {summary: "人件費"},{summary: "水質分析"}])
# 子カテゴリー
# 交通費
distance0_2, distance2_5, distance5_10, distance10_15, distance15_20 = transportation_expenses.children.create([{summary: "2km未満",unit_price: 1000}, {summary: "2km以上5km未満",unit_price: 2000},{summary: "5km以上10km未満",unit_price: 3000},{summary: "10km以上15km未満",unit_price: 4000},{summary: "15km以上20km未満",unit_price: 5000}])

# 人件費
personnel_time1, personnel_time2, personnel_time3 = personnel_costs.children.create([{summary: "技師 1時間",unit_price: 3000}, {summary: "技師補助 1時間",unit_price: 2000},{summary: "宿泊費 1日",unit_price: 10000}])

# 水質分析
metal, non_metal = water_analysis.children.create([{summary: "金属"}, {summary: "非金属"}])
# 孫カテゴリー
metal.children.create([{summary: "Cd",unit_price: 4000}, {summary: "Pb",unit_price: 4000}, {summary: "As",unit_price: 4500}, {summary: "Se",unit_price: 4000}, {summary: "Cr6+",unit_price: 4000}, {summary: "T-Cr",unit_price: 4000}, {summary: "T-Fe",unit_price: 4000}, {summary: "Fe",unit_price: 4000}, {summary: "Mn",unit_price: 4000}, {summary: "前処理",unit_price: 3000}])
non_metal.children.create([{summary: "CN",unit_price: 5000}, {summary: "F",unit_price: 5000}, {summary: "B",unit_price: 4000}, {summary: "有機リン",unit_price: 15000}, {summary: "PCB",unit_price: 15000}])

