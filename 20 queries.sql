1.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    tp.taxpayer_type,
    tt.tax_type_name,
    tt.filing_frequency,
    tc.centre_name,
    tc.district_name,
    SUM(td.declared_amount) AS total_declared_amount,
    SUM(ta.assessed_amount) AS total_assessed_amount,
    SUM(tpay.payment_amount) AS total_payment_amount
FROM taxpayer tp
INNER JOIN tax_registration tr
    ON tp.taxpayer_id = tr.taxpayer_id
INNER JOIN tax_type tt
    ON tr.tax_type_id = tt.tax_type_id
INNER JOIN tax_centre tc
    ON tr.tax_centre_id = tc.tax_centre_id
INNER JOIN tax_declaration td
    ON tr.registration_id = td.registration_id
INNER JOIN tax_assessment ta
    ON td.declaration_id = ta.declaration_id
INNER JOIN tax_payment tpay
    ON ta.assessment_id = tpay.assessment_id
GROUP BY
    tp.taxpayer_tin,
    tp.taxpayer_name,
    tp.taxpayer_type,
    tt.tax_type_name,
    tt.filing_frequency,
    tc.centre_name,
    tc.district_name
HAVING SUM(ta.assessed_amount) > 1000000
ORDER BY total_assessed_amount DESC;
answer
 taxpayer_tin |        taxpayer_name         | taxpayer_registration_date |          tax_type_name          | tax_registration_date |          centre_name          | number_of_declarations | total_declared_amount
--------------+------------------------------+----------------------------+---------------------------------+-----------------------+-------------------------------+------------------------+-----------------------
 TIN100057    | Agnès Mukarurangwa           | 2024-03-18                 | Business Expansion Tax          | 2024-03-28            | Muganza Tax Centre            |                      1 |            3384723.56
 TIN100095    | Aimé Ndayisenga              | 2024-04-25                 | Cloud Computing Service Tax     | 2024-05-05            | Kiramuruzi Tax Centre         |                      1 |            5433232.60
 TIN100051    | Aimable Nshimiyimana         | 2024-03-12                 | Communication Service Tax       | 2024-03-22            | Mimuri Tax Centre             |                      1 |            6609846.91
 100000003    | Alice Uwase                  | 2024-01-12                 | Corporate Income Tax            | 2024-02-03            | Kicukiro Tax Centre           |                      1 |            6500000.00
 TIN100045    | Alice Uwera                  | 2024-03-06                 | Import Service Tax              | 2024-03-16            | Kanombe Tax Centre            |                      1 |            1881229.25
 TIN100065    | Aline Mukamana               | 2024-03-26                 | Sewerage Service Levy           | 2024-04-05            | Kabeza Tax Centre             |                      1 |            3047658.86
 TIN100011    | Aline Nyirahabimana          | 2024-02-01                 | Stamp Duty                      | 2024-02-11            | Nyamagabe Tax Centre          |                      1 |             480077.44
 TIN100031    | Ange Iradukunda              | 2024-02-21                 | Vehicle Registration Tax        | 2024-03-02            | Rusizi South Tax Centre       |                      1 |            6271713.58
 TIN100073    | Anitha Nyiransabimana        | 2024-04-03                 | Timber Harvest Levy             | 2024-04-13            | Cyanika Tax Centre            |                      1 |            7167474.68
 TIN100019    | Beatha Mukeshimana           | 2024-02-09                 | Hotel Occupancy Tax             | 2024-02-19            | Kamonyi Tax Centre            |                      1 |            3320542.71
 TIN100061    | Benitha Uwimana              | 2024-03-22                 | Road User Levy                  | 2024-04-01            | Nyamirambo Tax Centre         |                      1 |            5741631.53
 TIN100076    | Blue Mountain Coffee Ltd     | 2024-04-06                 | Radio Broadcasting Levy         | 2024-04-16            | Shyira Tax Centre             |                      1 |            6567733.70
 TIN100016    | Bright Future Academy        | 2024-02-06                 | Digital Services Tax            | 2024-02-16            | Gicumbi Tax Centre            |                      1 |            1874193.42
 TIN100088    | Bright Future Pharmacy Ltd   | 2024-04-18                 | Aviation Fuel Levy              | 2024-04-28            | Nyakabuye Tax Centre          |                      1 |            6175367.42
 TIN100072    | Capital Investments Ltd      | 2024-04-02                 | Fishing Licence Levy            | 2024-04-12            | Rushashi Tax Centre           |                      1 |            1438735.83
 TIN100093    | Chantal Mukeshimana          | 2024-04-23                 | Online Marketplace Levy         | 2024-05-03            | Tabagwe Tax Centre            |                      1 |            7243412.92
 TIN100041    | Christine Uwase              | 2024-03-02                 | Commercial Vehicle Tax          | 2024-03-12            | Nyabugogo Tax Centre          |                      1 |            4685743.24
 TIN100050    | City Express Ltd             | 2024-03-11                 | Petroleum Levy                  | 2024-03-21            | Kabarondo Tax Centre          |                      1 |            6874580.09
 TIN100053    | Clarisse Nyiransabimana      | 2024-03-14                 | Education Development Levy      | 2024-03-24            | Kinihira Tax Centre           |                      1 |            3148549.69
 TIN100075    | Claude Muryango              | 2024-04-05                 | Television Broadcasting Levy    | 2024-04-15            | Busogo Tax Centre             |                      1 |            3955308.06
 TIN100033    | Claude Tuyisenge             | 2024-02-23                 | Mining Royalty                  | 2024-03-04            | Rubavu West Tax Centre        |                      1 |             629935.56
 TIN100027    | Claudine Uwamahoro           | 2024-02-17                 | Export Documentation Fee        | 2024-02-27            | Bugesera Tax Centre           |                      1 |            4646827.43
 TIN100046    | Crystal Water Ltd            | 2024-03-07                 | Export Service Tax              | 2024-03-17            | Gahanga Tax Centre            |                      1 |            6368533.83
 TIN100071    | David Ndayambaje             | 2024-04-01                 | Livestock Trading Tax           | 2024-04-11            | Rutunga Tax Centre            |                      1 |            1103175.65
 TIN100017    | Didier Nsengimana            | 2024-02-07                 | Insurance Premium Tax           | 2024-02-17            | Gakenke Tax Centre            |                      1 |            4634534.85
 TIN100012    | East Africa Supplies Ltd     | 2024-02-02                 | Customs Duty                    | 2024-02-12            | Karongi Tax Centre            |                      1 |            2063221.35
 TIN100094    | East African Traders Ltd     | 2024-04-24                 | Data Processing Tax             | 2024-05-04            | Kiziguro Tax Centre           |                      1 |            5737909.42
 TIN100062    | East Horizon Ltd             | 2024-03-23                 | Solid Waste Collection Tax      | 2024-04-02            | Kimisagara Tax Centre         |                      1 |            1400457.50
 TIN100040    | Elite Security Ltd           | 2024-03-01                 | Luxury Vehicle Tax              | 2024-03-11            | Rutsiro Tax Centre            |                      1 |            5353106.26
 TIN100029    | Emmanuel Nkundimana          | 2024-02-19                 | Financial Transaction Tax       | 2024-02-29            | Nyagatare East Tax Centre     |                      1 |            1198748.37
 TIN100087    | Eric Manzi                   | 2024-04-17                 | Maritime Service Tax            | 2024-04-27            | Kanjongo Tax Centre           |                      1 |             916704.85
 100000005    | Eric Niyonzima               | 2024-01-18                 | Property Tax                    | 2024-02-05            | Huye Tax Centre               |                      1 |            2500000.00
 TIN100047    | Eric Tuyishime               | 2024-03-08                 | Manufacturing Tax               | 2024-03-18            | Masaka Tax Centre             |                      1 |            1949146.12
 TIN100069    | Esperance Uwamahoro          | 2024-03-30                 | Public Market Levy              | 2024-04-09            | Bumbogo Tax Centre            |                      1 |            5208314.66
 TIN100044    | Excellent Builders Ltd       | 2024-03-05                 | Agricultural Export Levy        | 2024-03-15            | Kacyiru Tax Centre            |                      1 |            2243624.35
 TIN100078    | Excellent Hardware Ltd       | 2024-04-08                 | Market Stall Tax                | 2024-04-18            | Rambura Tax Centre            |                      1 |            4684585.52
 TIN100024    | Excellent Pharmacy Ltd       | 2024-02-14                 | Plastic Packaging Levy          | 2024-02-24            | Kayonza Tax Centre            |                      1 |            7191934.12
 TIN100099    | Fabrice Habimana             | 2024-04-29                 | Research and Innovation Levy    | 2024-05-09            | Kibungo Central Tax Centre    |                      1 |            1917820.83
 TIN100077    | Florence Mukarubayiza        | 2024-04-07                 | Parking Services Tax            | 2024-04-17            | Mukamira Tax Centre           |                      1 |            6360019.31
 TIN100037    | Francine Mukamugema          | 2024-02-27                 | Fire Safety Levy                | 2024-03-08            | Gasabo North Tax Centre       |                      1 |            4876928.00
 100000008    | Future Builders              | 2024-02-01                 | Capital Gains Tax               | 2024-02-08            | Muhanga Tax Centre            |                      1 |            4200000.00
 TIN100025    | Gilbert Habumuremyi          | 2024-02-15                 | Carbon Emission Tax             | 2024-02-25            | Kirehe Tax Centre             |                      1 |            1035913.99
 TIN100059    | Gilbert Mucyo                | 2024-03-20                 | Export Inspection Fee           | 2024-03-30            | Bwishyura Tax Centre          |                      1 |            7480745.60
 TIN100089    | Gloria Uwamwezi              | 2024-04-19                 | Passenger Service Charge        | 2024-04-29            | Kamembe Tax Centre            |                      1 |            5814007.89
 TIN100080    | Golden Vision Ltd            | 2024-04-10                 | Conference Services Tax         | 2024-04-20            | Boneza Tax Centre             |                      1 |            4183529.02
 100000007    | Grace Mukamana               | 2024-01-25                 | Excise Duty                     | 2024-02-07            | Rusizi Tax Centre             |                      1 |             980000.00
 TIN100060    | Great Lakes Trading Ltd      | 2024-03-21                 | Business Renewal Fee            | 2024-03-31            | Gisenyi Tax Centre            |                      1 |            3968589.31
 TIN100098    | Great Vision Academy Ltd     | 2024-04-28                 | Investment Income Tax           | 2024-05-08            | Rukomo Tax Centre             |                      1 |            3550700.22
 TIN100068    | Green Hills Ltd              | 2024-03-29                 | Business Permit Renewal Tax     | 2024-04-08            | Gisozi Tax Centre             |                      1 |            5198040.55
 TIN100030    | Green Valley Hotel           | 2024-02-20                 | Luxury Goods Tax                | 2024-03-01            | Rwamagana East Tax Centre     |                      1 |             867361.43
 100000006    | Hope Traders                 | 2024-01-20                 | Rental Income Tax               | 2024-02-06            | Rubavu Tax Centre             |                      1 |            1450000.00
 TIN100039    | Innocent Niyonzima           | 2024-02-29                 | Air Travel Tax                  | 2024-03-10            | Muhanga East Tax Centre       |                      1 |            1808450.62
 TIN100079    | Isaac Mugiraneza             | 2024-04-09                 | Advertising Billboard Levy      | 2024-04-19            | Murunda Tax Centre            |                      1 |            2992179.74
 TIN100013    | Jean Claude Mugenzi          | 2024-02-03                 | Import Duty                     | 2024-02-13            | Ngororero Tax Centre          |                      1 |            5602592.74
 TIN100055    | Jean de Dieu Ndayambaje      | 2024-03-16                 | Municipal Service Tax           | 2024-03-26            | Kibirizi Tax Centre           |                      1 |            2075718.06
 TIN100063    | Jean Paul Nkurunziza         | 2024-03-24                 | Water Supply Levy               | 2024-04-03            | Gikondo Tax Centre            |                      1 |            6002971.42
 TIN100049    | Jeannette Mukarwego          | 2024-03-10                 | Natural Resources Levy          | 2024-03-20            | Kibungo Tax Centre            |                      1 |            2227734.31
 100000001    | John Smith                   | 2024-01-10                 | Value Added Tax                 | 2024-02-01            | Kigali Tax Centre             |                      1 |            1200000.00
 TIN100023    | Josiane Uwimana              | 2024-02-13                 | Construction Permit Fee         | 2024-02-23            | Nyaruguru Tax Centre          |                      1 |            2300673.66
 100000002    | Keza Ltd                     | 2024-01-11                 | Pay As You Earn                 | 2024-02-02            | Gasabo Tax Centre             |                      1 |             900000.00
 TIN100090    | Kigali Printing Services Ltd | 2024-04-20                 | Port Handling Levy              | 2024-04-30            | Bugarama Tax Centre           |                      1 |            5050205.92
 TIN100014    | Kigali Supermarket Ltd       | 2024-02-04                 | Export Duty                     | 2024-02-14            | Nyabihu Tax Centre            |                      1 |             925959.59
 TIN100038    | Kivu Fisheries Ltd           | 2024-02-28                 | Infrastructure Development Levy | 2024-03-09            | Nyarugenge Central Tax Centre |                      1 |            1471109.50
 TIN100054    | Lake View Hotel Ltd          | 2024-03-15                 | Urban Development Tax           | 2024-03-25            | Base Tax Centre               |                      1 |            1328675.45
 TIN100056    | Modern Furniture Ltd         | 2024-03-17                 | Foreign Investment Levy         | 2024-03-27            | Save Tax Centre               |                      1 |            4180636.49
 TIN100028    | Modern Printing Services     | 2024-02-18                 | Import Processing Fee           | 2024-02-28            | Gatsibo Tax Centre            |                      1 |            5554068.86
 TIN100084    | Modern Supermarket Ltd       | 2024-04-14                 | Cold Storage Facility Tax       | 2024-04-24            | Kagano Tax Centre             |                      1 |            6626797.52
 TIN100018    | Mountain Coffee Exporters    | 2024-02-08                 | Gaming Tax                      | 2024-02-18            | Rulindo Tax Centre            |                      1 |            1731631.08
 TIN100022    | New Horizon Transport Ltd    | 2024-02-12                 | Business Licence Tax            | 2024-02-22            | Gisagara Tax Centre           |                      1 |            5326603.64
 TIN100021    | Patrick Nizeyimana           | 2024-02-11                 | Telecommunication Levy          | 2024-02-21            | Nyanza Tax Centre             |                      1 |            5763413.04
 TIN100067    | Patrick Nshimiyimana         | 2024-03-28                 | Land Registration Fee           | 2024-04-07            | Kinyinya Tax Centre           |                      1 |            6497613.86
 TIN100026    | Prime Engineering Ltd        | 2024-02-16                 | Agricultural Produce Tax        | 2024-02-26            | Ngoma Tax Centre              |                      1 |             996357.91
 TIN100082    | Prime Logistics Ltd          | 2024-04-12                 | Courier Service Tax             | 2024-04-22            | Murambi Tax Centre            |                      1 |            2633923.61
 TIN100032    | Reliable Motors Ltd          | 2024-02-22                 | Motor Vehicle Tax               | 2024-03-03            | Nyamasheke Tax Centre         |                      1 |            4456935.45
 TIN100020    | Royal Furniture Ltd          | 2024-02-10                 | Airport Service Charge          | 2024-02-20            | Ruhango Tax Centre            |                      1 |            4542712.92
 TIN100064    | Royal Paints Ltd             | 2024-03-25                 | Electricity Consumption Tax     | 2024-04-04            | Kagarama Tax Centre           |                      1 |            4594145.02
 TIN100048    | Rwanda Fresh Foods Ltd       | 2024-03-09                 | Industrial Development Levy     | 2024-03-19            | Kabuga Tax Centre             |                      1 |            6096329.77
 TIN100100    | Rwanda Premier Holdings Ltd  | 2024-04-30                 | Public Infrastructure Tax       | 2024-05-10            | Kirehe Central Tax Centre     |                      1 |             451446.67
 TIN100074    | Rwanda Textile Ltd           | 2024-04-04                 | Quarry Operations Tax           | 2024-04-14            | Kinigi Tax Centre             |                      1 |            7297594.31
 100000009    | Samuel Mugisha               | 2024-02-05                 | Tourism Levy                    | 2024-02-09            | Rwamagana Tax Centre          |                      1 |             760000.00
 TIN100091    | Samuel Rugwizangoga          | 2024-04-21                 | Telecom Infrastructure Levy     | 2024-05-01            | Rwimiyaga Tax Centre          |                      1 |            1488914.10
 TIN100097    | Sandrine Uwimbabazi          | 2024-04-27                 | Financial Services Levy         | 2024-05-07            | Ngarama Tax Centre            |                      1 |            3454320.60
 TIN100070    | Silver Star Hotel Ltd        | 2024-03-31                 | Cross Border Trade Levy         | 2024-04-10            | Jabana Tax Centre             |                      1 |            5706320.16
 TIN100058    | Skyline Logistics Ltd        | 2024-03-19                 | Import Inspection Fee           | 2024-03-29            | Kibeho Tax Centre             |                      1 |            3175683.64
 TIN100042    | Smart Choice Electronics Ltd | 2024-03-03                 | Small Business Tax              | 2024-03-13            | Remera Tax Centre             |                      1 |            4145807.11
 100000010    | Smart Holdings               | 2024-02-10                 | Environmental Tax               | 2024-02-10            | Nyagatare Tax Centre          |                      1 |            3600000.00
 TIN100092    | Sunrise Motors Ltd           | 2024-04-22                 | E-Commerce Tax                  | 2024-05-02            | Karama Tax Centre             |                      1 |            6581517.90
 TIN100034    | Sunshine Agriculture Ltd     | 2024-02-24                 | Forestry Levy                   | 2024-03-05            | Musanze North Tax Centre      |                      1 |            5866092.05
 TIN100043    | Theogene Habimana            | 2024-03-04                 | Large Enterprise Tax            | 2024-03-14            | Kimironko Tax Centre          |                      1 |            1476497.96
 TIN100083    | Thierry Habumuremyi          | 2024-04-13                 | Postal Service Levy             | 2024-04-23            | Rwankuba Tax Centre           |                      1 |            1105447.62
 TIN100066    | Topline Furniture Ltd        | 2024-03-27                 | Building Inspection Fee         | 2024-04-06            | Niboye Tax Centre             |                      1 |            4109623.28
 TIN100036    | Unity Construction Ltd       | 2024-02-26                 | Advertising Tax                 | 2024-03-07            | Kicukiro South Tax Centre     |                      1 |            3036908.82
 TIN100096    | Unity Medical Centre Ltd     | 2024-04-26                 | Electronic Payment Levy         | 2024-05-06            | Muhura Tax Centre             |                      1 |            7465075.37
 TIN100085    | Vestine Nyirahabimana        | 2024-04-15                 | Warehouse Operations Levy       | 2024-04-25            | Macuba Tax Centre             |                      1 |            2024056.63
 TIN100015    | Vestine Umutoni              | 2024-02-05                 | Road Maintenance Levy           | 2024-02-15            | Burera Tax Centre             |                      1 |             528835.29
 TIN100086    | Victory Construction Ltd     | 2024-04-16                 | Border Security Levy            | 2024-04-26            | Mahembe Tax Centre            |                      1 |            6621669.11
 TIN100052    | Vision Agro Ltd              | 2024-03-13                 | Public Health Levy              | 2024-03-23            | Byumba Tax Centre             |                      1 |            1830911.12
 100000004    | Vision Tech Ltd              | 2024-01-15                 | Withholding Tax                 | 2024-02-04            | Musanze Tax Centre            |                      1 |            1800000.00
 TIN100035    | Yvette Mukandayisenga        | 2024-02-25                 | Waste Management Levy           | 2024-03-06            | Huye Central Tax Centre       |                      1 |            6458287.59
 TIN100081    | Yvonne Ingabire              | 2024-04-11                 | Freight Transport Levy          | 2024-04-21            | Gashari Tax Centre            |                      1 |            6913153.16
(100 rows)

2.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    tp.registration_date AS taxpayer_registration_date,
    tt.tax_type_name,
    tr.registration_date AS tax_registration_date,
    tc.centre_name,
    COUNT(td.declaration_id) AS number_of_declarations,
    COALESCE(SUM(td.declared_amount), 0) AS total_declared_amount
FROM taxpayer tp
LEFT JOIN tax_registration tr
    ON tp.taxpayer_id = tr.taxpayer_id
LEFT JOIN tax_type tt
    ON tr.tax_type_id = tt.tax_type_id
LEFT JOIN tax_centre tc
    ON tr.tax_centre_id = tc.tax_centre_id
LEFT JOIN tax_declaration td
    ON tr.registration_id = td.registration_id
GROUP BY
    tp.taxpayer_tin,
    tp.taxpayer_name,
    tp.registration_date,
    tt.tax_type_name,
    tr.registration_date,
    tc.centre_name
HAVING COUNT(td.declaration_id) < 3
ORDER BY
    number_of_declarations ASC,
    tp.taxpayer_name;

answer
 taxpayer_tin |        taxpayer_name         | taxpayer_registration_date |          tax_type_name          | tax_registration_date |          centre_name          | number_of_declarations | total_declared_amount
--------------+------------------------------+----------------------------+---------------------------------+-----------------------+-------------------------------+------------------------+-----------------------
 TIN100057    | Agnès Mukarurangwa           | 2024-03-18                 | Business Expansion Tax          | 2024-03-28            | Muganza Tax Centre            |                      1 |            3384723.56
 TIN100095    | Aimé Ndayisenga              | 2024-04-25                 | Cloud Computing Service Tax     | 2024-05-05            | Kiramuruzi Tax Centre         |                      1 |            5433232.60
 TIN100051    | Aimable Nshimiyimana         | 2024-03-12                 | Communication Service Tax       | 2024-03-22            | Mimuri Tax Centre             |                      1 |            6609846.91
 100000003    | Alice Uwase                  | 2024-01-12                 | Corporate Income Tax            | 2024-02-03            | Kicukiro Tax Centre           |                      1 |            6500000.00
 TIN100045    | Alice Uwera                  | 2024-03-06                 | Import Service Tax              | 2024-03-16            | Kanombe Tax Centre            |                      1 |            1881229.25
 TIN100065    | Aline Mukamana               | 2024-03-26                 | Sewerage Service Levy           | 2024-04-05            | Kabeza Tax Centre             |                      1 |            3047658.86
 TIN100011    | Aline Nyirahabimana          | 2024-02-01                 | Stamp Duty                      | 2024-02-11            | Nyamagabe Tax Centre          |                      1 |             480077.44
 TIN100031    | Ange Iradukunda              | 2024-02-21                 | Vehicle Registration Tax        | 2024-03-02            | Rusizi South Tax Centre       |                      1 |            6271713.58
 TIN100073    | Anitha Nyiransabimana        | 2024-04-03                 | Timber Harvest Levy             | 2024-04-13            | Cyanika Tax Centre            |                      1 |            7167474.68
 TIN100019    | Beatha Mukeshimana           | 2024-02-09                 | Hotel Occupancy Tax             | 2024-02-19            | Kamonyi Tax Centre            |                      1 |            3320542.71
 TIN100061    | Benitha Uwimana              | 2024-03-22                 | Road User Levy                  | 2024-04-01            | Nyamirambo Tax Centre         |                      1 |            5741631.53
 TIN100076    | Blue Mountain Coffee Ltd     | 2024-04-06                 | Radio Broadcasting Levy         | 2024-04-16            | Shyira Tax Centre             |                      1 |            6567733.70
 TIN100016    | Bright Future Academy        | 2024-02-06                 | Digital Services Tax            | 2024-02-16            | Gicumbi Tax Centre            |                      1 |            1874193.42
 TIN100088    | Bright Future Pharmacy Ltd   | 2024-04-18                 | Aviation Fuel Levy              | 2024-04-28            | Nyakabuye Tax Centre          |                      1 |            6175367.42
 TIN100072    | Capital Investments Ltd      | 2024-04-02                 | Fishing Licence Levy            | 2024-04-12            | Rushashi Tax Centre           |                      1 |            1438735.83
 TIN100093    | Chantal Mukeshimana          | 2024-04-23                 | Online Marketplace Levy         | 2024-05-03            | Tabagwe Tax Centre            |                      1 |            7243412.92
 TIN100041    | Christine Uwase              | 2024-03-02                 | Commercial Vehicle Tax          | 2024-03-12            | Nyabugogo Tax Centre          |                      1 |            4685743.24
 TIN100050    | City Express Ltd             | 2024-03-11                 | Petroleum Levy                  | 2024-03-21            | Kabarondo Tax Centre          |                      1 |            6874580.09
 TIN100053    | Clarisse Nyiransabimana      | 2024-03-14                 | Education Development Levy      | 2024-03-24            | Kinihira Tax Centre           |                      1 |            3148549.69
 TIN100075    | Claude Muryango              | 2024-04-05                 | Television Broadcasting Levy    | 2024-04-15            | Busogo Tax Centre             |                      1 |            3955308.06
 TIN100033    | Claude Tuyisenge             | 2024-02-23                 | Mining Royalty                  | 2024-03-04            | Rubavu West Tax Centre        |                      1 |             629935.56
 TIN100027    | Claudine Uwamahoro           | 2024-02-17                 | Export Documentation Fee        | 2024-02-27            | Bugesera Tax Centre           |                      1 |            4646827.43
 TIN100046    | Crystal Water Ltd            | 2024-03-07                 | Export Service Tax              | 2024-03-17            | Gahanga Tax Centre            |                      1 |            6368533.83
 TIN100071    | David Ndayambaje             | 2024-04-01                 | Livestock Trading Tax           | 2024-04-11            | Rutunga Tax Centre            |                      1 |            1103175.65
 TIN100017    | Didier Nsengimana            | 2024-02-07                 | Insurance Premium Tax           | 2024-02-17            | Gakenke Tax Centre            |                      1 |            4634534.85
 TIN100012    | East Africa Supplies Ltd     | 2024-02-02                 | Customs Duty                    | 2024-02-12            | Karongi Tax Centre            |                      1 |            2063221.35
 TIN100094    | East African Traders Ltd     | 2024-04-24                 | Data Processing Tax             | 2024-05-04            | Kiziguro Tax Centre           |                      1 |            5737909.42
 TIN100062    | East Horizon Ltd             | 2024-03-23                 | Solid Waste Collection Tax      | 2024-04-02            | Kimisagara Tax Centre         |                      1 |            1400457.50
 TIN100040    | Elite Security Ltd           | 2024-03-01                 | Luxury Vehicle Tax              | 2024-03-11            | Rutsiro Tax Centre            |                      1 |            5353106.26
 TIN100029    | Emmanuel Nkundimana          | 2024-02-19                 | Financial Transaction Tax       | 2024-02-29            | Nyagatare East Tax Centre     |                      1 |            1198748.37
 TIN100087    | Eric Manzi                   | 2024-04-17                 | Maritime Service Tax            | 2024-04-27            | Kanjongo Tax Centre           |                      1 |             916704.85
 100000005    | Eric Niyonzima               | 2024-01-18                 | Property Tax                    | 2024-02-05            | Huye Tax Centre               |                      1 |            2500000.00
 TIN100047    | Eric Tuyishime               | 2024-03-08                 | Manufacturing Tax               | 2024-03-18            | Masaka Tax Centre             |                      1 |            1949146.12
 TIN100069    | Esperance Uwamahoro          | 2024-03-30                 | Public Market Levy              | 2024-04-09            | Bumbogo Tax Centre            |                      1 |            5208314.66
 TIN100044    | Excellent Builders Ltd       | 2024-03-05                 | Agricultural Export Levy        | 2024-03-15            | Kacyiru Tax Centre            |                      1 |            2243624.35
 TIN100078    | Excellent Hardware Ltd       | 2024-04-08                 | Market Stall Tax                | 2024-04-18            | Rambura Tax Centre            |                      1 |            4684585.52
 TIN100024    | Excellent Pharmacy Ltd       | 2024-02-14                 | Plastic Packaging Levy          | 2024-02-24            | Kayonza Tax Centre            |                      1 |            7191934.12
 TIN100099    | Fabrice Habimana             | 2024-04-29                 | Research and Innovation Levy    | 2024-05-09            | Kibungo Central Tax Centre    |                      1 |            1917820.83
 TIN100077    | Florence Mukarubayiza        | 2024-04-07                 | Parking Services Tax            | 2024-04-17            | Mukamira Tax Centre           |                      1 |            6360019.31
 TIN100037    | Francine Mukamugema          | 2024-02-27                 | Fire Safety Levy                | 2024-03-08            | Gasabo North Tax Centre       |                      1 |            4876928.00
 100000008    | Future Builders              | 2024-02-01                 | Capital Gains Tax               | 2024-02-08            | Muhanga Tax Centre            |                      1 |            4200000.00
 TIN100025    | Gilbert Habumuremyi          | 2024-02-15                 | Carbon Emission Tax             | 2024-02-25            | Kirehe Tax Centre             |                      1 |            1035913.99
 TIN100059    | Gilbert Mucyo                | 2024-03-20                 | Export Inspection Fee           | 2024-03-30            | Bwishyura Tax Centre          |                      1 |            7480745.60
 TIN100089    | Gloria Uwamwezi              | 2024-04-19                 | Passenger Service Charge        | 2024-04-29            | Kamembe Tax Centre            |                      1 |            5814007.89
 TIN100080    | Golden Vision Ltd            | 2024-04-10                 | Conference Services Tax         | 2024-04-20            | Boneza Tax Centre             |                      1 |            4183529.02
 100000007    | Grace Mukamana               | 2024-01-25                 | Excise Duty                     | 2024-02-07            | Rusizi Tax Centre             |                      1 |             980000.00
 TIN100060    | Great Lakes Trading Ltd      | 2024-03-21                 | Business Renewal Fee            | 2024-03-31            | Gisenyi Tax Centre            |                      1 |            3968589.31
 TIN100098    | Great Vision Academy Ltd     | 2024-04-28                 | Investment Income Tax           | 2024-05-08            | Rukomo Tax Centre             |                      1 |            3550700.22
 TIN100068    | Green Hills Ltd              | 2024-03-29                 | Business Permit Renewal Tax     | 2024-04-08            | Gisozi Tax Centre             |                      1 |            5198040.55
 TIN100030    | Green Valley Hotel           | 2024-02-20                 | Luxury Goods Tax                | 2024-03-01            | Rwamagana East Tax Centre     |                      1 |             867361.43
 100000006    | Hope Traders                 | 2024-01-20                 | Rental Income Tax               | 2024-02-06            | Rubavu Tax Centre             |                      1 |            1450000.00
 TIN100039    | Innocent Niyonzima           | 2024-02-29                 | Air Travel Tax                  | 2024-03-10            | Muhanga East Tax Centre       |                      1 |            1808450.62
 TIN100079    | Isaac Mugiraneza             | 2024-04-09                 | Advertising Billboard Levy      | 2024-04-19            | Murunda Tax Centre            |                      1 |            2992179.74
 TIN100013    | Jean Claude Mugenzi          | 2024-02-03                 | Import Duty                     | 2024-02-13            | Ngororero Tax Centre          |                      1 |            5602592.74
 TIN100055    | Jean de Dieu Ndayambaje      | 2024-03-16                 | Municipal Service Tax           | 2024-03-26            | Kibirizi Tax Centre           |                      1 |            2075718.06
 TIN100063    | Jean Paul Nkurunziza         | 2024-03-24                 | Water Supply Levy               | 2024-04-03            | Gikondo Tax Centre            |                      1 |            6002971.42
 TIN100049    | Jeannette Mukarwego          | 2024-03-10                 | Natural Resources Levy          | 2024-03-20            | Kibungo Tax Centre            |                      1 |            2227734.31
 100000001    | John Smith                   | 2024-01-10                 | Value Added Tax                 | 2024-02-01            | Kigali Tax Centre             |                      1 |            1200000.00
 TIN100023    | Josiane Uwimana              | 2024-02-13                 | Construction Permit Fee         | 2024-02-23            | Nyaruguru Tax Centre          |                      1 |            2300673.66
 100000002    | Keza Ltd                     | 2024-01-11                 | Pay As You Earn                 | 2024-02-02            | Gasabo Tax Centre             |                      1 |             900000.00
 TIN100090    | Kigali Printing Services Ltd | 2024-04-20                 | Port Handling Levy              | 2024-04-30            | Bugarama Tax Centre           |                      1 |            5050205.92
 TIN100014    | Kigali Supermarket Ltd       | 2024-02-04                 | Export Duty                     | 2024-02-14            | Nyabihu Tax Centre            |                      1 |             925959.59
 TIN100038    | Kivu Fisheries Ltd           | 2024-02-28                 | Infrastructure Development Levy | 2024-03-09            | Nyarugenge Central Tax Centre |                      1 |            1471109.50
 TIN100054    | Lake View Hotel Ltd          | 2024-03-15                 | Urban Development Tax           | 2024-03-25            | Base Tax Centre               |                      1 |            1328675.45
 TIN100056    | Modern Furniture Ltd         | 2024-03-17                 | Foreign Investment Levy         | 2024-03-27            | Save Tax Centre               |                      1 |            4180636.49
 TIN100028    | Modern Printing Services     | 2024-02-18                 | Import Processing Fee           | 2024-02-28            | Gatsibo Tax Centre            |                      1 |            5554068.86
 TIN100084    | Modern Supermarket Ltd       | 2024-04-14                 | Cold Storage Facility Tax       | 2024-04-24            | Kagano Tax Centre             |                      1 |            6626797.52
 TIN100018    | Mountain Coffee Exporters    | 2024-02-08                 | Gaming Tax                      | 2024-02-18            | Rulindo Tax Centre            |                      1 |            1731631.08
 TIN100022    | New Horizon Transport Ltd    | 2024-02-12                 | Business Licence Tax            | 2024-02-22            | Gisagara Tax Centre           |                      1 |            5326603.64
 TIN100021    | Patrick Nizeyimana           | 2024-02-11                 | Telecommunication Levy          | 2024-02-21            | Nyanza Tax Centre             |                      1 |            5763413.04
 TIN100067    | Patrick Nshimiyimana         | 2024-03-28                 | Land Registration Fee           | 2024-04-07            | Kinyinya Tax Centre           |                      1 |            6497613.86
 TIN100026    | Prime Engineering Ltd        | 2024-02-16                 | Agricultural Produce Tax        | 2024-02-26            | Ngoma Tax Centre              |                      1 |             996357.91
 TIN100082    | Prime Logistics Ltd          | 2024-04-12                 | Courier Service Tax             | 2024-04-22            | Murambi Tax Centre            |                      1 |            2633923.61
 TIN100032    | Reliable Motors Ltd          | 2024-02-22                 | Motor Vehicle Tax               | 2024-03-03            | Nyamasheke Tax Centre         |                      1 |            4456935.45
 TIN100020    | Royal Furniture Ltd          | 2024-02-10                 | Airport Service Charge          | 2024-02-20            | Ruhango Tax Centre            |                      1 |            4542712.92
 TIN100064    | Royal Paints Ltd             | 2024-03-25                 | Electricity Consumption Tax     | 2024-04-04            | Kagarama Tax Centre           |                      1 |            4594145.02
 TIN100048    | Rwanda Fresh Foods Ltd       | 2024-03-09                 | Industrial Development Levy     | 2024-03-19            | Kabuga Tax Centre             |                      1 |            6096329.77
 TIN100100    | Rwanda Premier Holdings Ltd  | 2024-04-30                 | Public Infrastructure Tax       | 2024-05-10            | Kirehe Central Tax Centre     |                      1 |             451446.67
 TIN100074    | Rwanda Textile Ltd           | 2024-04-04                 | Quarry Operations Tax           | 2024-04-14            | Kinigi Tax Centre             |                      1 |            7297594.31
 100000009    | Samuel Mugisha               | 2024-02-05                 | Tourism Levy                    | 2024-02-09            | Rwamagana Tax Centre          |                      1 |             760000.00
 TIN100091    | Samuel Rugwizangoga          | 2024-04-21                 | Telecom Infrastructure Levy     | 2024-05-01            | Rwimiyaga Tax Centre          |                      1 |            1488914.10
 TIN100097    | Sandrine Uwimbabazi          | 2024-04-27                 | Financial Services Levy         | 2024-05-07            | Ngarama Tax Centre            |                      1 |            3454320.60
 TIN100070    | Silver Star Hotel Ltd        | 2024-03-31                 | Cross Border Trade Levy         | 2024-04-10            | Jabana Tax Centre             |                      1 |            5706320.16
 TIN100058    | Skyline Logistics Ltd        | 2024-03-19                 | Import Inspection Fee           | 2024-03-29            | Kibeho Tax Centre             |                      1 |            3175683.64
 TIN100042    | Smart Choice Electronics Ltd | 2024-03-03                 | Small Business Tax              | 2024-03-13            | Remera Tax Centre             |                      1 |            4145807.11
 100000010    | Smart Holdings               | 2024-02-10                 | Environmental Tax               | 2024-02-10            | Nyagatare Tax Centre          |                      1 |            3600000.00
 TIN100092    | Sunrise Motors Ltd           | 2024-04-22                 | E-Commerce Tax                  | 2024-05-02            | Karama Tax Centre             |                      1 |            6581517.90
 TIN100034    | Sunshine Agriculture Ltd     | 2024-02-24                 | Forestry Levy                   | 2024-03-05            | Musanze North Tax Centre      |                      1 |            5866092.05
 TIN100043    | Theogene Habimana            | 2024-03-04                 | Large Enterprise Tax            | 2024-03-14            | Kimironko Tax Centre          |                      1 |            1476497.96
 TIN100083    | Thierry Habumuremyi          | 2024-04-13                 | Postal Service Levy             | 2024-04-23            | Rwankuba Tax Centre           |                      1 |            1105447.62
 TIN100066    | Topline Furniture Ltd        | 2024-03-27                 | Building Inspection Fee         | 2024-04-06            | Niboye Tax Centre             |                      1 |            4109623.28
 TIN100036    | Unity Construction Ltd       | 2024-02-26                 | Advertising Tax                 | 2024-03-07            | Kicukiro South Tax Centre     |                      1 |            3036908.82
 TIN100096    | Unity Medical Centre Ltd     | 2024-04-26                 | Electronic Payment Levy         | 2024-05-06            | Muhura Tax Centre             |                      1 |            7465075.37
 TIN100085    | Vestine Nyirahabimana        | 2024-04-15                 | Warehouse Operations Levy       | 2024-04-25            | Macuba Tax Centre             |                      1 |            2024056.63
 TIN100015    | Vestine Umutoni              | 2024-02-05                 | Road Maintenance Levy           | 2024-02-15            | Burera Tax Centre             |                      1 |             528835.29
 TIN100086    | Victory Construction Ltd     | 2024-04-16                 | Border Security Levy            | 2024-04-26            | Mahembe Tax Centre            |                      1 |            6621669.11
 TIN100052    | Vision Agro Ltd              | 2024-03-13                 | Public Health Levy              | 2024-03-23            | Byumba Tax Centre             |                      1 |            1830911.12
 100000004    | Vision Tech Ltd              | 2024-01-15                 | Withholding Tax                 | 2024-02-04            | Musanze Tax Centre            |                      1 |            1800000.00
 TIN100035    | Yvette Mukandayisenga        | 2024-02-25                 | Waste Management Levy           | 2024-03-06            | Huye Central Tax Centre       |                      1 |            6458287.59
 TIN100081    | Yvonne Ingabire              | 2024-04-11                 | Freight Transport Levy          | 2024-04-21            | Gashari Tax Centre            |                      1 |            6913153.16
(100 rows)




3.SELECT
    tt.tax_type_id,
    tt.tax_type_name,
    tt.filing_frequency,
    COUNT(DISTINCT tr.taxpayer_id) AS number_of_registered_taxpayers,
    COALESCE(SUM(td.declared_amount), 0) AS total_declared_amount,
    COALESCE(SUM(ta.assessed_amount), 0) AS total_assessed_amount
FROM tax_registration tr
RIGHT JOIN tax_type tt
    ON tr.tax_type_id = tt.tax_type_id
LEFT JOIN tax_declaration td
    ON tr.registration_id = td.registration_id
LEFT JOIN tax_assessment ta
    ON td.declaration_id = ta.declaration_id
GROUP BY
    tt.tax_type_id,
    tt.tax_type_name,
    tt.filing_frequency
HAVING
    COALESCE(SUM(td.declared_amount), 0) < 5000000
ORDER BY
    tt.tax_type_id;
4.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    b.business_name,
    b.business_sector,
    tt.tax_type_name,
    tc.centre_name,

    SUM(td.declared_amount) AS total_declared_amount,
    SUM(ta.assessed_amount) AS total_assessed_amount,
    SUM(tpay.payment_amount) AS total_payment_amount,
    SUM(p.penalty_amount) AS total_penalty_amount

FROM taxpayer tp

INNER JOIN business b
    ON tp.taxpayer_id = b.taxpayer_id

INNER JOIN tax_registration tr
    ON tp.taxpayer_id = tr.taxpayer_id

INNER JOIN tax_type tt
    ON tr.tax_type_id = tt.tax_type_id

INNER JOIN tax_centre tc
    ON tr.tax_centre_id = tc.tax_centre_id

INNER JOIN tax_declaration td
    ON tr.registration_id = td.registration_id

INNER JOIN tax_assessment ta
    ON td.declaration_id = ta.declaration_id

INNER JOIN tax_payment tpay
    ON ta.assessment_id = tpay.assessment_id

INNER JOIN penalty p
    ON ta.assessment_id = p.assessment_id

GROUP BY
    tp.taxpayer_tin,
    tp.taxpayer_name,
    b.business_name,
    b.business_sector,
    tt.tax_type_name,
    tc.centre_name

HAVING
    SUM(ta.assessed_amount) > 10000000

ORDER BY
    total_assessed_amount DESC; 

answer

 taxpayer_tin | taxpayer_name | business_name | business_sector | tax_type_name | centre_name | total_declared_amount | total_assessed_amount | total_payment_amount | total_penalty_amount
--------------+---------------+---------------+-----------------+---------------+-------------+-----------------------+-----------------------+----------------------+----------------------
(0 rows)

5.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    p.property_location,
    p.property_value,
    COUNT(td.declaration_id) AS number_of_declarations,
    COALESCE(SUM(ta.assessed_amount), 0) AS total_assessed_amount,
    COALESCE(SUM(tpay.payment_amount), 0) AS total_payment_amount

FROM property p

INNER JOIN taxpayer tp
    ON p.taxpayer_id = tp.taxpayer_id

LEFT JOIN tax_registration tr
    ON tp.taxpayer_id = tr.taxpayer_id

LEFT JOIN tax_declaration td
    ON tr.registration_id = td.registration_id

LEFT JOIN tax_assessment ta
    ON td.declaration_id = ta.declaration_id

LEFT JOIN tax_payment tpay
    ON ta.assessment_id = tpay.assessment_id

GROUP BY
    tp.taxpayer_tin,
    tp.taxpayer_name,
    p.property_location,
    p.property_value

HAVING
    COALESCE(SUM(tpay.payment_amount), 0) <
    COALESCE(SUM(ta.assessed_amount), 0)

ORDER BY
    tp.taxpayer_name,
    p.property_location;
answer
 taxpayer_tin |  taxpayer_name  | property_location | property_value | number_of_declarations | total_assessed_amount | total_payment_amount
--------------+-----------------+-------------------+----------------+------------------------+-----------------------+----------------------
 100000003    | Alice Uwase     | Nyarugenge        |   120000000.00 |                      1 |            6800000.00 |           6500000.00
 100000005    | Eric Niyonzima  | Musanze           |    40000000.00 |                      1 |            2600000.00 |           2500000.00
 100000008    | Future Builders | Muhanga           |   110000000.00 |                      1 |            4400000.00 |           4200000.00
 100000007    | Grace Mukamana  | Huye              |    55000000.00 |                      1 |            1000000.00 |            980000.00
 100000006    | Hope Traders    | Rubavu            |    70000000.00 |                      1 |            1500000.00 |           1450000.00
 100000002    | Keza Ltd        | Gasabo            |    65000000.00 |                      1 |             950000.00 |            900000.00
 100000009    | Samuel Mugisha  | Rwamagana         |    60000000.00 |                      1 |             800000.00 |            760000.00
 100000010    | Smart Holdings  | Nyagatare         |   130000000.00 |                      1 |            3750000.00 |           3600000.00
 100000004    | Vision Tech Ltd | Kicukiro          |    95000000.00 |                      1 |            1900000.00 |           1800000.00
(9 rows)

6.SELECT tp.taxpayer_tin,
    tp.taxpayer_name,
     v.plate_number,
v.vehicle_value,
    tt.tax_type_name,
COUNT(td.declaration_id) AS number_of_declarations,
     COALESCE(SUM(td.declared_amount),0) AS total_declared_amount,
     COALESCE(SUM(ta.assessed_amount),0) AS total_assessed_amount,
    COALESCE(SUM(p.penalty_amount),0) AS total_penalties
 FROM taxpayer tp
 INNER JOIN tax_registration tr
 ON tp.taxpayer_id = tr.taxpayer_id
INNER JOIN tax_type tt
ON tr.tax_type_id = tt.tax_type_id
LEFT JOIN tax_declaration td
    ON tr.registration_id = td.registration_id
LEFT JOIN tax_assessment ta
ON td.declaration_id = ta.declaration_id
LEFT JOIN penalty p ON ta.assessment_id = p.assessment_id
RIGHT JOIN vehicle v
 ON tp.taxpayer_id = v.taxpayer_id
GROUP BY tp.taxpayer_tin,
 tp.taxpayer_name,v.plate_number,v.vehicle_value,tt.tax_type_name
 HAVING v.vehicle_value > 10000000
 ORDER BY v.vehicle_value DESC;
answer
 taxpayer_tin |        taxpayer_name         | plate_number | vehicle_value |          tax_type_name          | number_of_declarations | total_declared_amount | total_assessed_amount | total_penalties
--------------+------------------------------+--------------+---------------+---------------------------------+------------------------+-----------------------+-----------------------+-----------------
 TIN100060    | Great Lakes Trading Ltd      | RAH060H      |   59927988.03 | Business Renewal Fee            |                      1 |            3968589.31 |            3715060.98 |       114619.08
 TIN100066    | Topline Furniture Ltd        | RAN066N      |   59051568.58 | Building Inspection Fee         |                      1 |            4109623.28 |            4568036.31 |       117300.08
 TIN100077    | Florence Mukarubayiza        | RAY077Y      |   56848714.03 | Parking Services Tax            |                      1 |            6360019.31 |            6352539.95 |        53671.52
 TIN100013    | Jean Claude Mugenzi          | RAM013M      |   56198820.08 | Import Duty                     |                      1 |            5602592.74 |            6074638.40 |       161447.08
 TIN100016    | Bright Future Academy        | RAP016P      |   55876655.46 | Digital Services Tax            |                      1 |            1874193.42 |            1738312.77 |       111208.82
 TIN100012    | East Africa Supplies Ltd     | RAL012L      |   55418899.12 | Customs Duty                    |                      1 |            2063221.35 |            2166768.02 |        79262.11
 100000010    | Smart Holdings               | RAJ010J      |   55000000.00 | Environmental Tax               |                      1 |            3600000.00 |            3750000.00 |        70000.00
 TIN100041    | Christine Uwase              | RAO041O      |   54820794.71 | Commercial Vehicle Tax          |                      1 |            4685743.24 |            4465477.79 |        63536.56
 TIN100079    | Isaac Mugiraneza             | RAA079A      |   54708005.86 | Advertising Billboard Levy      |                      1 |            2992179.74 |            2866872.96 |       247186.00
 TIN100057    | Agnès Mukarurangwa           | RAE057E      |   54223749.75 | Business Expansion Tax          |                      1 |            3384723.56 |            3633996.93 |        74262.94
 TIN100093    | Chantal Mukeshimana          | RAO093O      |   54105802.27 | Online Marketplace Levy         |                      1 |            7243412.92 |            7357311.16 |        68509.47
 TIN100049    | Jeannette Mukarwego          | RAW049W      |   53785353.91 | Natural Resources Levy          |                      1 |            2227734.31 |            2360080.47 |       248779.98
 TIN100046    | Crystal Water Ltd            | RAT046T      |   53651661.65 | Export Service Tax              |                      1 |            6368533.83 |            6616104.06 |       249123.26
 TIN100085    | Vestine Nyirahabimana        | RAG085G      |   53009186.41 | Warehouse Operations Levy       |                      1 |            2024056.63 |            2216071.75 |       215187.11
 TIN100043    | Theogene Habimana            | RAQ043Q      |   52192751.87 | Large Enterprise Tax            |                      1 |            1476497.96 |            1482905.48 |       230885.15
 TIN100027    | Claudine Uwamahoro           | RAA027A      |   51169574.72 | Export Documentation Fee        |                      1 |            4646827.43 |            4370857.66 |        95417.13
 TIN100087    | Eric Manzi                   | RAI087I      |   51162021.59 | Maritime Service Tax            |                      1 |             916704.85 |            1018544.90 |        83912.10
 TIN100037    | Francine Mukamugema          | RAK037K      |   50969020.93 | Fire Safety Levy                |                      1 |            4876928.00 |            4999042.87 |       115455.58
 100000008    | Future Builders              | RAH808H      |   50000000.00 | Capital Gains Tax               |                      1 |            4200000.00 |            4400000.00 |        95000.00
 TIN100052    | Vision Agro Ltd              | RAZ052Z      |   49611708.61 | Public Health Levy              |                      1 |            1830911.12 |            1788652.06 |       168769.38
 TIN100051    | Aimable Nshimiyimana         | RAY051Y      |   48723940.63 | Communication Service Tax       |                      1 |            6609846.91 |            6936543.69 |        88530.16
 TIN100021    | Patrick Nizeyimana           | RAU021U      |   48494596.83 | Telecommunication Levy          |                      1 |            5763413.04 |            5967556.53 |       114504.65
 TIN100095    | Aimé Ndayisenga              | RAQ095Q      |   47567648.68 | Cloud Computing Service Tax     |                      1 |            5433232.60 |            6031959.16 |        55265.98
 TIN100097    | Sandrine Uwimbabazi          | RAS097S      |   46996590.30 | Financial Services Levy         |                      1 |            3454320.60 |            3809525.47 |       102701.42
 TIN100054    | Lake View Hotel Ltd          | RAB054B      |   46910831.90 | Urban Development Tax           |                      1 |            1328675.45 |            1228377.18 |       118599.66
 TIN100092    | Sunrise Motors Ltd           | RAN092N      |   46738734.42 | E-Commerce Tax                  |                      1 |            6581517.90 |            7041794.93 |        87238.47
 100000003    | Alice Uwase                  | RAC303C      |   45000000.00 | Corporate Income Tax            |                      1 |            6500000.00 |            6800000.00 |       200000.00
 TIN100017    | Didier Nsengimana            | RAQ017Q      |   44621137.30 | Insurance Premium Tax           |                      1 |            4634534.85 |            4651378.74 |        44163.38
 TIN100045    | Alice Uwera                  | RAS045S      |   44554014.18 | Import Service Tax              |                      1 |            1881229.25 |            1858700.54 |        85100.74
 TIN100053    | Clarisse Nyiransabimana      | RAA053A      |   44288408.30 | Education Development Levy      |                      1 |            3148549.69 |            3455243.80 |        66534.08
 TIN100062    | East Horizon Ltd             | RAJ062J      |   43953220.33 | Solid Waste Collection Tax      |                      1 |            1400457.50 |            1535849.20 |        39593.10
 TIN100086    | Victory Construction Ltd     | RAH086H      |   43835095.79 | Border Security Levy            |                      1 |            6621669.11 |            6288666.01 |        66081.35
 TIN100050    | City Express Ltd             | RAX050X      |   43791308.00 | Petroleum Levy                  |                      1 |            6874580.09 |            6408029.05 |        30169.92
 TIN100088    | Bright Future Pharmacy Ltd   | RAJ088J      |   43143057.53 | Aviation Fuel Levy              |                      1 |            6175367.42 |            6266949.93 |       132356.14
 TIN100068    | Green Hills Ltd              | RAP068P      |   42665483.65 | Business Permit Renewal Tax     |                      1 |            5198040.55 |            5023341.55 |        59454.71
 TIN100080    | Golden Vision Ltd            | RAB080B      |   41918105.13 | Conference Services Tax         |                      1 |            4183529.02 |            4217521.76 |        73708.29
 TIN100011    | Aline Nyirahabimana          | RAK011K      |   39057606.63 | Stamp Duty                      |                      1 |             480077.44 |             532681.00 |        39896.97
 TIN100075    | Claude Muryango              | RAW075W      |   37616854.23 | Television Broadcasting Levy    |                      1 |            3955308.06 |            4000116.73 |        96089.84
 TIN100059    | Gilbert Mucyo                | RAG059G      |   37426839.08 | Export Inspection Fee           |                      1 |            7480745.60 |            7467205.01 |        36196.39
 TIN100090    | Kigali Printing Services Ltd | RAL090L      |   37292084.16 | Port Handling Levy              |                      1 |            5050205.92 |            5131408.29 |       103777.90
 TIN100081    | Yvonne Ingabire              | RAC081C      |   35817674.80 | Freight Transport Levy          |                      1 |            6913153.16 |            6830269.50 |        67655.04
 TIN100042    | Smart Choice Electronics Ltd | RAP042P      |   33756706.40 | Small Business Tax              |                      1 |            4145807.11 |            3940162.25 |        64075.56
 TIN100074    | Rwanda Textile Ltd           | RAV074V      |   33562801.13 | Quarry Operations Tax           |                      1 |            7297594.31 |            8100656.54 |        33130.42
 TIN100071    | David Ndayambaje             | RAS071S      |   32940990.57 | Livestock Trading Tax           |                      1 |            1103175.65 |            1047062.93 |        56354.00
 TIN100094    | East African Traders Ltd     | RAP094P      |   32745082.89 | Data Processing Tax             |                      1 |            5737909.42 |            5871412.81 |       189456.01
 TIN100055    | Jean de Dieu Ndayambaje      | RAC055C      |   32323812.91 | Municipal Service Tax           |                      1 |            2075718.06 |            2057229.27 |       110715.15
 TIN100098    | Great Vision Academy Ltd     | RAT098T      |   31925888.09 | Investment Income Tax           |                      1 |            3550700.22 |            3478329.63 |        53817.65
 TIN100038    | Kivu Fisheries Ltd           | RAL038L      |   31589404.41 | Infrastructure Development Levy |                      1 |            1471109.50 |            1568039.52 |        75287.55
 TIN100025    | Gilbert Habumuremyi          | RAY025Y      |   31507701.82 | Carbon Emission Tax             |                      1 |            1035913.99 |            1065061.69 |       242650.18
 TIN100065    | Aline Mukamana               | RAM065M      |   31249054.04 | Sewerage Service Levy           |                      1 |            3047658.86 |            3219987.55 |        85067.03
 TIN100024    | Excellent Pharmacy Ltd       | RAX024X      |   31115102.70 | Plastic Packaging Levy          |                      1 |            7191934.12 |            7033149.57 |        93112.31
 TIN100032    | Reliable Motors Ltd          | RAF032F      |   30921778.31 | Motor Vehicle Tax               |                      1 |            4456935.45 |            4793192.31 |        73707.48
 TIN100040    | Elite Security Ltd           | RAN040N      |   30233733.83 | Luxury Vehicle Tax              |                      1 |            5353106.26 |            5051261.49 |       100821.24
 TIN100031    | Ange Iradukunda              | RAE031E      |   30227721.61 | Vehicle Registration Tax        |                      1 |            6271713.58 |            6623431.24 |       157031.69
 100000006    | Hope Traders                 | RAF606F      |   30000000.00 | Rental Income Tax               |                      1 |            1450000.00 |            1500000.00 |       120000.00
 TIN100070    | Silver Star Hotel Ltd        | RAR070R      |   29774197.36 | Cross Border Trade Levy         |                      1 |            5706320.16 |            5549677.81 |       107589.74
 TIN100029    | Emmanuel Nkundimana          | RAC029C      |   29732146.63 | Financial Transaction Tax       |                      1 |            1198748.37 |            1273576.82 |        79050.57
 TIN100058    | Skyline Logistics Ltd        | RAF058F      |   28750905.64 | Import Inspection Fee           |                      1 |            3175683.64 |            3390590.65 |       238049.62
 TIN100035    | Yvette Mukandayisenga        | RAI035I      |   28545221.80 | Waste Management Levy           |                      1 |            6458287.59 |            6967690.81 |        81953.14
 TIN100084    | Modern Supermarket Ltd       | RAF084F      |   28496666.86 | Cold Storage Facility Tax       |                      1 |            6626797.52 |            6910076.23 |       112960.72
 TIN100048    | Rwanda Fresh Foods Ltd       | RAV048V      |   27288270.42 | Industrial Development Levy     |                      1 |            6096329.77 |            6760440.89 |        61126.06
 TIN100078    | Excellent Hardware Ltd       | RAZ078Z      |   27277216.42 | Market Stall Tax                |                      1 |            4684585.52 |            4904095.42 |        95180.48
 TIN100034    | Sunshine Agriculture Ltd     | RAH034H      |   27275709.21 | Forestry Levy                   |                      1 |            5866092.05 |            5821019.76 |       193068.38
 TIN100018    | Mountain Coffee Exporters    | RAR018R      |   26451874.74 | Gaming Tax                      |                      1 |            1731631.08 |            1624516.89 |        50988.49
 TIN100028    | Modern Printing Services     | RAB028B      |   26426576.18 | Import Processing Fee           |                      1 |            5554068.86 |            5523407.67 |        83948.11
 TIN100076    | Blue Mountain Coffee Ltd     | RAX076X      |   25768130.25 | Radio Broadcasting Levy         |                      1 |            6567733.70 |            6557723.04 |       151323.73
 TIN100044    | Excellent Builders Ltd       | RAR044R      |   25564706.13 | Agricultural Export Levy        |                      1 |            2243624.35 |            2407216.36 |        47519.24
 TIN100091    | Samuel Rugwizangoga          | RAM091M      |   25010345.23 | Telecom Infrastructure Levy     |                      1 |            1488914.10 |            1395375.95 |       145002.20
 100000004    | Vision Tech Ltd              | RAD404D      |   25000000.00 | Withholding Tax                 |                      1 |            1800000.00 |            1900000.00 |        60000.00
 TIN100099    | Fabrice Habimana             | RAU099U      |   23449302.89 | Research and Innovation Levy    |                      1 |            1917820.83 |            2031431.30 |        51772.19
 TIN100064    | Royal Paints Ltd             | RAL064L      |   22500911.01 | Electricity Consumption Tax     |                      1 |            4594145.02 |            4875671.20 |       242907.62
 TIN100067    | Patrick Nshimiyimana         | RAO067O      |   22217377.53 | Land Registration Fee           |                      1 |            6497613.86 |            6085645.25 |        82424.67
 TIN100023    | Josiane Uwimana              | RAW023W      |   21941016.33 | Construction Permit Fee         |                      1 |            2300673.66 |            2138054.08 |        76242.09
 TIN100073    | Anitha Nyiransabimana        | RAU073U      |   21926152.85 | Timber Harvest Levy             |                      1 |            7167474.68 |            7960337.76 |        89763.26
 TIN100030    | Green Valley Hotel           | RAD030D      |   21455874.30 | Luxury Goods Tax                |                      1 |             867361.43 |             905353.52 |       106602.90
 TIN100033    | Claude Tuyisenge             | RAG033G      |   20835002.19 | Mining Royalty                  |                      1 |             629935.56 |             653313.96 |        83929.25
 TIN100015    | Vestine Umutoni              | RAO015O      |   20726148.49 | Road Maintenance Levy           |                      1 |             528835.29 |             582745.19 |       106549.80
 TIN100026    | Prime Engineering Ltd        | RAZ026Z      |   20587387.57 | Agricultural Produce Tax        |                      1 |             996357.91 |            1028292.63 |        59853.14
 TIN100089    | Gloria Uwamwezi              | RAK089K      |   20446205.41 | Passenger Service Charge        |                      1 |            5814007.89 |            6336032.46 |        65304.75
 TIN100100    | Rwanda Premier Holdings Ltd  | RAV100V      |   20223153.59 | Public Infrastructure Tax       |                      1 |             451446.67 |             462136.64 |       213644.67
 TIN100022    | New Horizon Transport Ltd    | RAV022V      |   19580566.91 | Business Licence Tax            |                      1 |            5326603.64 |            4953303.87 |        87197.02
 TIN100020    | Royal Furniture Ltd          | RAT020T      |   18053328.50 | Airport Service Charge          |                      1 |            4542712.92 |            5040094.29 |        77625.06
 100000001    | John Smith                   | RAA101A      |   18000000.00 | Value Added Tax                 |                      1 |            1200000.00 |            1250000.00 |        50000.00
 TIN100082    | Prime Logistics Ltd          | RAD082D      |   17406307.26 | Courier Service Tax             |                      1 |            2633923.61 |            2477141.73 |       169356.73
 TIN100083    | Thierry Habumuremyi          | RAE083E      |   17292693.61 | Postal Service Levy             |                      1 |            1105447.62 |            1135652.58 |        58744.00
 100000009    | Samuel Mugisha               | RAI909I      |   17000000.00 | Tourism Levy                    |                      1 |             760000.00 |             800000.00 |       110000.00
 100000002    | Keza Ltd                     | RAB202B      |   15000000.00 | Pay As You Earn                 |                      1 |             900000.00 |             950000.00 |        75000.00
 TIN100063    | Jean Paul Nkurunziza         | RAK063K      |   14531451.05 | Water Supply Levy               |                      1 |            6002971.42 |            6560028.52 |        97313.12
 TIN100056    | Modern Furniture Ltd         | RAD056D      |   14061041.01 | Foreign Investment Levy         |                      1 |            4180636.49 |            4258975.76 |        67589.82
 100000007    | Grace Mukamana               | RAG707G      |   14000000.00 | Excise Duty                     |                      1 |             980000.00 |            1000000.00 |        45000.00
 TIN100019    | Beatha Mukeshimana           | RAS019S      |   13517774.22 | Hotel Occupancy Tax             |                      1 |            3320542.71 |            3094155.09 |       152792.49
 TIN100047    | Eric Tuyishime               | RAU047U      |   13297425.45 | Manufacturing Tax               |                      1 |            1949146.12 |            1820020.24 |        45942.28
 TIN100039    | Innocent Niyonzima           | RAM039M      |   13286952.06 | Air Travel Tax                  |                      1 |            1808450.62 |            1884029.03 |       119217.34
 TIN100061    | Benitha Uwimana              | RAI061I      |   12874666.52 | Road User Levy                  |                      1 |            5741631.53 |            5743519.67 |       212093.16
 TIN100096    | Unity Medical Centre Ltd     | RAR096R      |   12480708.28 | Electronic Payment Levy         |                      1 |            7465075.37 |            7407971.21 |        78392.44
 TIN100014    | Kigali Supermarket Ltd       | RAN014N      |   12426049.36 | Export Duty                     |                      1 |             925959.59 |             919605.45 |        89383.27
 TIN100072    | Capital Investments Ltd      | RAT072T      |   12222904.12 | Fishing Licence Levy            |                      1 |            1438735.83 |            1429888.63 |       104174.16
 100000005    | Eric Niyonzima               | RAE505E      |   12000000.00 | Property Tax                    |                      1 |            2500000.00 |            2600000.00 |        80000.00
 TIN100069    | Esperance Uwamahoro          | RAQ069Q      |   10605559.73 | Public Market Levy              |                      1 |            5208314.66 |            4804215.13 |        96685.53
 TIN100036    | Unity Construction Ltd       | RAJ036J      |   10472192.94 | Advertising Tax                 |                      1 |            3036908.82 |            2843673.36 |        55223.63
(100 rows)

7.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    tt.tax_type_name,
    tper.period_start_date,
    tper.period_end_date,
    tper.filing_due_date,

    COUNT(td.declaration_id) AS number_of_declarations,

    SUM(td.declared_amount) AS total_declared_amount,
    SUM(ta.assessed_amount) AS total_assessed_amount,
    SUM(tpay.payment_amount) AS total_amount_paid,

    SUM(ta.assessed_amount) - SUM(tpay.payment_amount) AS outstanding_balance

FROM taxpayer tp

INNER JOIN tax_registration tr
    ON tp.taxpayer_id = tr.taxpayer_id

INNER JOIN tax_type tt
    ON tr.tax_type_id = tt.tax_type_id

INNER JOIN tax_declaration td
    ON tr.registration_id = td.registration_id

INNER JOIN tax_period tper
    ON td.tax_period_id = tper.tax_period_id

INNER JOIN tax_assessment ta
    ON td.declaration_id = ta.declaration_id

INNER JOIN tax_payment tpay
    ON ta.assessment_id = tpay.assessment_id

GROUP BY
    tp.taxpayer_tin,
    tp.taxpayer_name,
    tt.tax_type_name,
    tper.period_start_date,
    tper.period_end_date,
    tper.filing_due_date

HAVING
    SUM(ta.assessed_amount) - SUM(tpay.payment_amount) > 0

ORDER BY
    outstanding_balance DESC;
answer
 taxpayer_tin |  taxpayer_name  |    tax_type_name     | period_start_date | period_end_date | filing_due_date | number_of_declarations | total_declared_amount | total_assessed_amount | total_amount_paid | outstanding_balance
--------------+-----------------+----------------------+-------------------+-----------------+-----------------+------------------------+-----------------------+-----------------------+-------------------+---------------------
 100000003    | Alice Uwase     | Corporate Income Tax | 2024-01-01        | 2024-12-31      | 2025-03-31      |                      1 |            6500000.00 |            6800000.00 |        6500000.00 |           300000.00
 100000008    | Future Builders | Capital Gains Tax    | 2024-01-01        | 2024-12-31      | 2025-03-31      |                      1 |            4200000.00 |            4400000.00 |        4200000.00 |           200000.00
 100000010    | Smart Holdings  | Environmental Tax    | 2024-01-01        | 2024-12-31      | 2025-01-31      |                      1 |            3600000.00 |            3750000.00 |        3600000.00 |           150000.00
 100000005    | Eric Niyonzima  | Property Tax         | 2024-01-01        | 2024-12-31      | 2025-01-31      |                      1 |            2500000.00 |            2600000.00 |        2500000.00 |           100000.00
 100000004    | Vision Tech Ltd | Withholding Tax      | 2024-01-01        | 2024-01-31      | 2024-02-15      |                      1 |            1800000.00 |            1900000.00 |        1800000.00 |           100000.00
 100000002    | Keza Ltd        | Pay As You Earn      | 2024-01-01        | 2024-01-31      | 2024-02-15      |                      1 |             900000.00 |             950000.00 |         900000.00 |            50000.00
 100000006    | Hope Traders    | Rental Income Tax    | 2024-01-01        | 2024-03-31      | 2024-04-15      |                      1 |            1450000.00 |            1500000.00 |        1450000.00 |            50000.00
 100000009    | Samuel Mugisha  | Tourism Levy         | 2024-01-01        | 2024-03-31      | 2024-04-15      |                      1 |             760000.00 |             800000.00 |         760000.00 |            40000.00
 100000007    | Grace Mukamana  | Excise Duty          | 2024-01-01        | 2024-01-31      | 2024-02-15      |                      1 |             980000.00 |            1000000.00 |         980000.00 |            20000.00
(9 rows)

8.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    ta.audit_status,
    tof.officer_name,
    tc.centre_name,
    tt.tax_type_name,

    COUNT(af.finding_id) AS number_of_audit_findings,
    COALESCE(SUM(af.finding_amount), 0) AS total_finding_amount

FROM tax_audit ta

INNER JOIN taxpayer tp
    ON ta.taxpayer_id = tp.taxpayer_id

INNER JOIN tax_officer tof
    ON ta.officer_id = tof.officer_id

INNER JOIN tax_centre tc
    ON tof.tax_centre_id = tc.tax_centre_id

LEFT JOIN audit_finding af
    ON ta.audit_id = af.audit_id

LEFT JOIN tax_type tt
    ON af.tax_type_id = tt.tax_type_id

GROUP BY
    tp.taxpayer_tin,
    tp.taxpayer_name,
    ta.audit_status,
    tof.officer_name,
    tc.centre_name,
    tt.tax_type_name

HAVING
    COALESCE(SUM(af.finding_amount), 0) > 2000000

ORDER BY
    total_finding_amount DESC;
answer 

 taxpayer_tin | taxpayer_name | audit_status | officer_name | centre_name | tax_type_name | number_of_audit_findings | total_finding_amount
--------------+---------------+--------------+--------------+-------------+---------------+--------------------------+----------------------
(0 rows)

9.SELECT
    o.officer_id,
    o.officer_name,
    o.officer_position,
    tc.centre_name,
    tc.district_name,

    COUNT(DISTINCT a.audit_id) AS number_of_audits,

    COALESCE(SUM(af.finding_amount), 0) AS total_audit_finding_amount,

    COALESCE(AVG(af.finding_amount), 0) AS average_audit_finding_amount

FROM tax_audit a

RIGHT JOIN tax_officer o
    ON a.officer_id = o.officer_id

LEFT JOIN tax_centre tc
    ON o.tax_centre_id = tc.tax_centre_id

LEFT JOIN audit_finding af
    ON a.audit_id = af.audit_id

GROUP BY
    o.officer_id,
    o.officer_name,
    o.officer_position,
    tc.centre_name,
    tc.district_name

HAVING
    COALESCE(AVG(af.finding_amount), 0) > 500000

ORDER BY
    average_audit_finding_amount DESC;

answer 

 officer_id |    officer_name    |  officer_position  |     centre_name      | district_name | number_of_audits | total_audit_finding_amount | average_audit_finding_amount ------------+--------------------+--------------------+----------------------+---------------+------------------+----------------------------+------------------------------          2 | Alice Uwase        | Senior Tax Officer | Gasabo Tax Centre    | Gasabo        |               10 |                 6352161.40 |          635216.140000000000
          1 | John Nkurunziza    | Tax Officer        | Kigali Tax Centre    | Nyarugenge    |               10 |                 5919177.17 |          591917.717000000000
          9 | Emmanuel Ndayisaba | Revenue Officer    | Rwamagana Tax Centre | Rwamagana     |               10 |                 5413170.79 |          541317.079000000000
          3 | Eric Mugabo        | Tax Auditor        | Kicukiro Tax Centre  | Kicukiro      |               10 |                 5377237.36 |          537723.736000000000
          5 | Patrick Habimana   | Tax Officer        | Huye Tax Centre      | Huye          |               10 |                 5296628.16 |          529662.816000000000
          8 | Diane Mukeshimana  | Senior Tax Officer | Muhanga Tax Centre   | Muhanga       |               10 |                 5183873.96 |          518387.396000000000
(6 rows)

10.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    ta.assessment_id,
    ta.assessment_date,
    ta.assessed_amount,
    tob.objection_status,

    SUM(tpay.payment_amount) AS total_payment_amount,
    SUM(p.penalty_amount) AS total_penalty_amount

FROM tax_assessment ta

INNER JOIN tax_declaration td
    ON ta.declaration_id = td.declaration_id

INNER JOIN tax_registration tr
    ON td.registration_id = tr.registration_id

INNER JOIN taxpayer tp
    ON tr.taxpayer_id = tp.taxpayer_id

INNER JOIN tax_objection tob
    ON ta.assessment_id = tob.assessment_id

INNER JOIN tax_payment tpay
    ON ta.assessment_id = tpay.assessment_id

INNER JOIN penalty p
    ON ta.assessment_id = p.assessment_id

GROUP BY
    tp.taxpayer_tin,
    tp.taxpayer_name,
    ta.assessment_id,
    ta.assessment_date,
    ta.assessed_amount,
    tob.objection_status

HAVING
    SUM(p.penalty_amount) > 100000

ORDER BY
    total_penalty_amount DESC;

answer

 taxpayer_tin |        taxpayer_name         | assessment_id | assessment_date | assessed_amount | objection_status | total_payment_amount | total_penalty_amount
--------------+------------------------------+---------------+-----------------+-----------------+------------------+----------------------+----------------------
 TIN100046    | Crystal Water Ltd            |            46 | 2025-01-19      |      6616104.06 | Rejected         |           6616104.06 |            249123.26
 TIN100049    | Jeannette Mukarwego          |            49 | 2025-04-09      |      2360080.47 | Approved         |           2360080.47 |            248779.98
 TIN100079    | Isaac Mugiraneza             |            79 | 2024-07-22      |      2866872.96 | Pending          |           2866872.96 |            247186.00
 TIN100064    | Royal Paints Ltd             |            64 | 2025-04-28      |      4875671.20 | Rejected         |           4875671.20 |            242907.62
 TIN100025    | Gilbert Habumuremyi          |            25 | 2025-01-28      |      1065061.69 | Approved         |           1065061.69 |            242650.18
 TIN100058    | Skyline Logistics Ltd        |            58 | 2025-10-08      |      3390590.65 | Rejected         |           3390590.65 |            238049.62
 TIN100043    | Theogene Habimana            |            43 | 2024-10-31      |      1482905.48 | Pending          |           1482905.48 |            230885.15
 TIN100085    | Vestine Nyirahabimana        |            85 | 2024-12-28      |      2216071.75 | Approved         |           2216071.75 |            215187.11
 TIN100100    | Rwanda Premier Holdings Ltd  |           100 | 2025-02-01      |       462136.64 | Approved         |            462136.64 |            213644.67
 TIN100061    | Benitha Uwimana              |            61 | 2024-05-27      |      5743519.67 | Pending          |           5743519.67 |            212093.16
 100000003    | Alice Uwase                  |             3 | 2025-03-25      |      6800000.00 | Pending          |           6500000.00 |            200000.00
 TIN100034    | Sunshine Agriculture Ltd     |            34 | 2024-10-14      |      5821019.76 | Approved         |           5821019.76 |            193068.38
 TIN100094    | East African Traders Ltd     |            94 | 2025-08-24      |      5871412.81 | Rejected         |           5871412.81 |            189456.01
 TIN100082    | Prime Logistics Ltd          |            82 | 2025-10-22      |      2477141.73 | Approved         |           2477141.73 |            169356.73
 TIN100052    | Vision Agro Ltd              |            52 | 2025-01-11      |      1788652.06 | Approved         |           1788652.06 |            168769.38
 TIN100013    | Jean Claude Mugenzi          |            13 | 2024-07-09      |      6074638.40 | Approved         |           6074638.40 |            161447.08
 TIN100031    | Ange Iradukunda              |            31 | 2024-12-20      |      6623431.24 | Pending          |           6623431.24 |            157031.69
 TIN100019    | Beatha Mukeshimana           |            19 | 2025-09-03      |      3094155.09 | Approved         |           3094155.09 |            152792.49
 TIN100076    | Blue Mountain Coffee Ltd     |            76 | 2024-06-12      |      6557723.04 | Rejected         |           6557723.04 |            151323.73
 TIN100091    | Samuel Rugwizangoga          |            91 | 2025-09-05      |      1395375.95 | Approved         |           1395375.95 |            145002.20
 TIN100088    | Bright Future Pharmacy Ltd   |            88 | 2025-07-03      |      6266949.93 | Approved         |           6266949.93 |            132356.14
 100000006    | Hope Traders                 |             6 | 2024-04-15      |      1500000.00 | Rejected         |           1450000.00 |            120000.00
 TIN100039    | Innocent Niyonzima           |            39 | 2025-02-18      |      1884029.03 | Approved         |           1884029.03 |            119217.34
 TIN100054    | Lake View Hotel Ltd          |            54 | 2025-06-05      |      1228377.18 | Approved         |           1228377.18 |            118599.66
 TIN100066    | Topline Furniture Ltd        |            66 | 2025-06-16      |      4568036.31 | Rejected         |           4568036.31 |            117300.08
 TIN100037    | Francine Mukamugema          |            37 | 2025-05-30      |      4999042.87 | Approved         |           4999042.87 |            115455.58
 TIN100060    | Great Lakes Trading Ltd      |            60 | 2024-07-14      |      3715060.98 | Pending          |           3715060.98 |            114619.08
 TIN100021    | Patrick Nizeyimana           |            21 | 2024-02-23      |      5967556.53 | Approved         |           5967556.53 |            114504.65
 TIN100084    | Modern Supermarket Ltd       |            84 | 2025-02-27      |      6910076.23 | Approved         |           6910076.23 |            112960.72
 TIN100016    | Bright Future Academy        |            16 | 2024-05-25      |      1738312.77 | Approved         |           1738312.77 |            111208.82
 TIN100055    | Jean de Dieu Ndayambaje      |            55 | 2024-07-15      |      2057229.27 | Pending          |           2057229.27 |            110715.15
 100000009    | Samuel Mugisha               |             9 | 2024-04-16      |       800000.00 | Rejected         |            760000.00 |            110000.00
 TIN100070    | Silver Star Hotel Ltd        |            70 | 2025-08-21      |      5549677.81 | Pending          |           5549677.81 |            107589.74
 TIN100030    | Green Valley Hotel           |            30 | 2025-03-10      |       905353.52 | Rejected         |            905353.52 |            106602.90
 TIN100015    | Vestine Umutoni              |            15 | 2025-04-24      |       582745.19 | Pending          |            582745.19 |            106549.80
 TIN100072    | Capital Investments Ltd      |            72 | 2025-05-15      |      1429888.63 | Pending          |           1429888.63 |            104174.16
 TIN100090    | Kigali Printing Services Ltd |            90 | 2024-07-04      |      5131408.29 | Approved         |           5131408.29 |            103777.90
 TIN100097    | Sandrine Uwimbabazi          |            97 | 2025-03-13      |      3809525.47 | Rejected         |           3809525.47 |            102701.42
 TIN100040    | Elite Security Ltd           |            40 | 2024-11-17      |      5051261.49 | Approved         |           5051261.49 |            100821.24
(39 rows)

11.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    ta.assessment_id,
    ta.assessed_amount,
    COUNT(toj.objection_id) AS number_of_objections,
    COALESCE(SUM(tpay.payment_amount),0) AS total_payment_amount,
    ta.assessed_amount - COALESCE(SUM(tpay.payment_amount),0) AS outstanding_balance

FROM tax_assessment ta

INNER JOIN tax_declaration td
ON ta.declaration_id = td.declaration_id

INNER JOIN tax_registration tr
ON td.registration_id = tr.registration_id

INNER JOIN taxpayer tp
ON tr.taxpayer_id = tp.taxpayer_id

LEFT JOIN tax_objection toj
ON ta.assessment_id = toj.assessment_id

LEFT JOIN tax_payment tpay
ON ta.assessment_id = tpay.assessment_id

GROUP BY
tp.taxpayer_tin,
tp.taxpayer_name,
ta.assessment_id,
ta.assessed_amount

HAVING
(ta.assessed_amount - COALESCE(SUM(tpay.payment_amount),0)) > 500000;

answer

 taxpayer_tin | taxpayer_name | assessment_id | assessed_amount | number_of_objections | total_payment_amount | outstanding_balance
--------------+---------------+---------------+-----------------+----------------------+----------------------+---------------------
(0 rows)

12.SELECT
    b.bank_id,
    b.bank_name,
    b.bank_code,
    b.branch_name,
    COUNT(tp.payment_id) AS number_of_payments,
    COALESCE(SUM(tp.payment_amount),0) AS total_payment_amount,
    COALESCE(AVG(tp.payment_amount),0) AS average_payment_amount,
    COALESCE(MAX(tp.payment_amount),0) AS maximum_payment_amount,
    COALESCE(MIN(tp.payment_amount),0) AS minimum_payment_amount

FROM tax_payment tp

RIGHT JOIN bank b
ON tp.bank_id = b.bank_id

GROUP BY
b.bank_id,
b.bank_name,
b.bank_code,
b.branch_name

HAVING
COALESCE(SUM(tp.payment_amount),0) < 20000000;

ANSWER

 bank_id |         bank_name          | bank_code | branch_name | number_of_payments | total_payment_amount | average_payment_amount | maximum_payment_amount | minimum_payment_amount
---------+----------------------------+-----------+-------------+--------------------+----------------------+------------------------+------------------------+------------------------
      55 | Ecobank                    | EC015     | Gatsibo     |                  1 |           3219987.55 |   3219987.550000000000 |             3219987.55 |             3219987.55
      27 | Access Bank                | AC012     | Gatsibo     |                  1 |           4999042.87 |   4999042.870000000000 |             4999042.87 |             4999042.87
      23 | I&M Bank                   | IM012     | Kayonza     |                  1 |            653313.96 |    653313.960000000000 |              653313.96 |              653313.96
      56 | NCBA Bank                  | NC015     | Gicumbi     |                  1 |           4568036.31 |   4568036.310000000000 |             4568036.31 |             4568036.31
      91 | Bank of Kigali             | BK019     | Ngororero   |                  0 |                    0 |                      0 |                      0 |                      0
      58 | BPR Bank                   | BP015     | Burera      |                  1 |           5023341.55 |   5023341.550000000000 |             5023341.55 |             5023341.55
       8 | BPR Bank                   | BP008     | Musanze     |                  2 |           5824516.89 |   2912258.445000000000 |             4200000.00 |             1624516.89
      87 | Access Bank                | AC018     | Ruhango     |                  1 |           3809525.47 |   3809525.470000000000 |             3809525.47 |             3809525.47
      74 | Cogebanque                 | CG017     | Rwamagana   |                  1 |           6910076.23 |   6910076.230000000000 |             6910076.23 |             6910076.23
      54 | Cogebanque                 | CG015     | Bugesera    |                  1 |           4875671.20 |   4875671.200000000000 |             4875671.20 |             4875671.20
      29 | GT Bank                    | GT012     | Rulindo     |                  1 |           1884029.03 |   1884029.030000000000 |             1884029.03 |             1884029.03
      71 | Bank of Kigali             | BK017     | Rubavu      |                  1 |           6830269.50 |   6830269.500000000000 |             6830269.50 |             6830269.50
      68 | BPR Bank                   | BP016     | Kicukiro    |                  1 |           4904095.42 |   4904095.420000000000 |             4904095.42 |             4904095.42
       4 | Cogebanque                 | CG004     | Gasabo      |                  2 |           2719605.45 |   1359802.725000000000 |             1800000.00 |              919605.45
      34 | Cogebanque                 | CG013     | Gisagara    |                  1 |           2407216.36 |   2407216.360000000000 |             2407216.36 |             2407216.36
      51 | Bank of Kigali             | BK015     | Kayonza     |                  1 |           5743519.67 |   5743519.670000000000 |             5743519.67 |             5743519.67
      96 | NCBA Bank                  | NC019     | Kicukiro    |                  0 |                    0 |                      0 |                      0 |                      0
      80 | Development Bank of Rwanda | BR017     | Kirehe      |                  1 |           5131408.29 |   5131408.290000000000 |             5131408.29 |             5131408.29
      70 | Development Bank of Rwanda | BR016     | Huye        |                  1 |           4217521.76 |   4217521.760000000000 |             4217521.76 |             4217521.76
      52 | Equity Bank                | EQ015     | Kirehe      |                  1 |           1535849.20 |   1535849.200000000000 |             1535849.20 |             1535849.20
      83 | I&M Bank                   | IM018     | Gatsibo     |                  1 |           7357311.16 |   7357311.160000000000 |             7357311.16 |             7357311.16
      67 | Access Bank                | AC016     | Nyarugenge  |                  1 |           6352539.95 |   6352539.950000000000 |             6352539.95 |             6352539.95
      63 | I&M Bank                   | IM016     | Ngororero   |                  1 |           7960337.76 |   7960337.760000000000 |             7960337.76 |             7960337.76
      90 | Development Bank of Rwanda | BR018     | Gisagara    |                  1 |            462136.64 |    462136.640000000000 |              462136.64 |              462136.64
      10 | Development Bank of Rwanda | BR010     | Head Office |                  2 |           8640094.29 |   4320047.145000000000 |             5040094.29 |             3600000.00
      35 | Ecobank                    | EC013     | Ngororero   |                  1 |           1858700.54 |   1858700.540000000000 |             1858700.54 |             1858700.54
      45 | Ecobank                    | EC014     | Muhanga     |                  1 |           2057229.27 |   2057229.270000000000 |             2057229.27 |             2057229.27
       6 | NCBA Bank                  | NC006     | Rubavu      |                  2 |           3188312.77 |   1594156.385000000000 |             1738312.77 |             1450000.00
      86 | NCBA Bank                  | NC018     | Burera      |                  1 |           7407971.21 |   7407971.210000000000 |             7407971.21 |             7407971.21
      84 | Cogebanque                 | CG018     | Gicumbi     |                  1 |           5871412.81 |   5871412.810000000000 |             5871412.81 |             5871412.81
      39 | GT Bank                    | GT013     | Nyarugenge  |                  1 |           2360080.47 |   2360080.470000000000 |             2360080.47 |             2360080.47
      92 | Equity Bank                | EQ019     | Rutsiro     |                  0 |                    0 |                      0 |                      0 |                      0
      93 | I&M Bank                   | IM019     | Nyabihu     |                  0 |                    0 |                      0 |                      0 |                      0
      89 | GT Bank                    | GT018     | Nyaruguru   |                  1 |           2031431.30 |   2031431.300000000000 |             2031431.30 |             2031431.30
      69 | GT Bank                    | GT016     | Gasabo      |                  1 |           2866872.96 |   2866872.960000000000 |             2866872.96 |             2866872.96
      36 | NCBA Bank                  | NC013     | Rutsiro     |                  1 |           6616104.06 |   6616104.060000000000 |             6616104.06 |             6616104.06
      31 | Bank of Kigali             | BK013     | Ruhango     |                  1 |           4465477.79 |   4465477.790000000000 |             4465477.79 |             4465477.79
      50 | Development Bank of Rwanda | BR014     | Nyanza      |                  1 |           3715060.98 |   3715060.980000000000 |             3715060.98 |             3715060.98
      60 | Development Bank of Rwanda | BR015     | Nyamagabe   |                  1 |           5549677.81 |   5549677.810000000000 |             5549677.81 |             5549677.81
      97 | Access Bank                | AC019     | Gasabo      |                  0 |                    0 |                      0 |                      0 |                      0
      14 | Cogebanque                 | CG011     | Huye        |                  1 |           7033149.57 |   7033149.570000000000 |             7033149.57 |             7033149.57
      66 | NCBA Bank                  | NC016     | Gakenke     |                  1 |           6557723.04 |   6557723.040000000000 |             6557723.04 |             6557723.04
      22 | Equity Bank                | EQ012     | Nyanza      |                  1 |           4793192.31 |   4793192.310000000000 |             4793192.31 |             4793192.31
      59 | GT Bank                    | GT015     | Ruhango     |                  1 |           4804215.13 |   4804215.130000000000 |             4804215.13 |             4804215.13
      13 | I&M Bank                   | IM011     | Gasabo      |                  1 |           2138054.08 |   2138054.080000000000 |             2138054.08 |             2138054.08
      65 | Ecobank                    | EC016     | Nyabihu     |                  1 |           4000116.73 |   4000116.730000000000 |             4000116.73 |             4000116.73
       2 | Equity Bank                | EQ002     | Kigali      |                  2 |           3066768.02 |   1533384.010000000000 |             2166768.02 |              900000.00
      16 | NCBA Bank                  | NC011     | Musanze     |                  1 |           1028292.63 |   1028292.630000000000 |             1028292.63 |             1028292.63
      62 | Equity Bank                | EQ016     | Gisagara    |                  1 |           1429888.63 |   1429888.630000000000 |             1429888.63 |             1429888.63
      75 | Ecobank                    | EC017     | Nyagatare   |                  1 |           2216071.75 |   2216071.750000000000 |             2216071.75 |             2216071.75
      98 | BPR Bank                   | BP019     | Huye        |                  0 |                    0 |                      0 |                      0 |                      0
      73 | I&M Bank                   | IM017     | Muhanga     |                  1 |           1135652.58 |   1135652.580000000000 |             1135652.58 |             1135652.58
      44 | Cogebanque                 | CG014     | Musanze     |                  1 |           1228377.18 |   1228377.180000000000 |             1228377.18 |             1228377.18
      11 | Bank of Kigali             | BK011     | Nyarugenge  |                  1 |           5967556.53 |   5967556.530000000000 |             5967556.53 |             5967556.53
      99 | GT Bank                    | GT019     | Rubavu      |                  0 |                    0 |                      0 |                      0 |                      0
      42 | Equity Bank                | EQ014     | Huye        |                  1 |           1788652.06 |   1788652.060000000000 |             1788652.06 |             1788652.06
      88 | BPR Bank                   | BP018     | Nyamagabe   |                  1 |           3478329.63 |   3478329.630000000000 |             3478329.63 |             3478329.63
      82 | Equity Bank                | EQ018     | Bugesera    |                  1 |           7041794.93 |   7041794.930000000000 |             7041794.93 |             7041794.93
      41 | Bank of Kigali             | BK014     | Gasabo      |                  1 |           6936543.69 |   6936543.690000000000 |             6936543.69 |             6936543.69
      46 | NCBA Bank                  | NC014     | Rwamagana   |                  1 |           4258975.76 |   4258975.760000000000 |             4258975.76 |             4258975.76
      40 | Development Bank of Rwanda | BR013     | Kicukiro    |                  1 |           6408029.05 |   6408029.050000000000 |             6408029.05 |             6408029.05
      43 | I&M Bank                   | IM014     | Rubavu      |                  1 |           3455243.80 |   3455243.800000000000 |             3455243.80 |             3455243.80
      53 | I&M Bank                   | IM015     | Ngoma       |                  1 |           6560028.52 |   6560028.520000000000 |             6560028.52 |             6560028.52
      32 | Equity Bank                | EQ013     | Nyamagabe   |                  1 |           3940162.25 |   3940162.250000000000 |             3940162.25 |             3940162.25
       9 | GT Bank                    | GT009     | Rwamagana   |                  2 |           3854155.09 |   1927077.545000000000 |             3094155.09 |              760000.00
       7 | Access Bank                | AC007     | Muhanga     |                  2 |           5631378.74 |   2815689.370000000000 |             4651378.74 |              980000.00
     100 | Development Bank of Rwanda | BR019     | Musanze     |                  0 |                    0 |                      0 |                      0 |                      0
      38 | BPR Bank                   | BP013     | Gakenke     |                  1 |           6760440.89 |   6760440.890000000000 |             6760440.89 |             6760440.89
      15 | Ecobank                    | EC011     | Rubavu      |                  1 |           1065061.69 |   1065061.690000000000 |             1065061.69 |             1065061.69
      79 | GT Bank                    | GT017     | Kayonza     |                  1 |           6336032.46 |   6336032.460000000000 |             6336032.46 |             6336032.46
      48 | BPR Bank                   | BP014     | Karongi     |                  1 |           3390590.65 |   3390590.650000000000 |             3390590.65 |             3390590.65
      26 | NCBA Bank                  | NC012     | Bugesera    |                  1 |           2843673.36 |   2843673.360000000000 |             2843673.36 |             2843673.36
      12 | Equity Bank                | EQ011     | Kicukiro    |                  1 |           4953303.87 |   4953303.870000000000 |             4953303.87 |             4953303.87
      85 | Ecobank                    | EC018     | Rulindo     |                  1 |           6031959.16 |   6031959.160000000000 |             6031959.16 |             6031959.16
      72 | Equity Bank                | EQ017     | Musanze     |                  1 |           2477141.73 |   2477141.730000000000 |             2477141.73 |             2477141.73
      95 | Ecobank                    | EC019     | Nyarugenge  |                  0 |                    0 |                      0 |                      0 |                      0
      78 | BPR Bank                   | BP017     | Nyanza      |                  1 |           6266949.93 |   6266949.930000000000 |             6266949.93 |             6266949.93
      57 | Access Bank                | AC015     | Rulindo     |                  1 |           6085645.25 |   6085645.250000000000 |             6085645.25 |             6085645.25
      24 | Cogebanque                 | CG012     | Kirehe      |                  1 |           5821019.76 |   5821019.760000000000 |             5821019.76 |             5821019.76
      81 | Bank of Kigali             | BK018     | Ngoma       |                  1 |           1395375.95 |   1395375.950000000000 |             1395375.95 |             1395375.95
      61 | Bank of Kigali             | BK016     | Nyaruguru   |                  1 |           1047062.93 |   1047062.930000000000 |             1047062.93 |             1047062.93
      19 | GT Bank                    | GT011     | Nyagatare   |                  1 |           1273576.82 |   1273576.820000000000 |             1273576.82 |             1273576.82
      77 | Access Bank                | AC017     | Rusizi      |                  1 |           1018544.90 |   1018544.900000000000 |             1018544.90 |             1018544.90
      25 | Ecobank                    | EC012     | Ngoma       |                  1 |           6967690.81 |   6967690.810000000000 |             6967690.81 |             6967690.81
      94 | Cogebanque                 | CG019     | Gakenke     |                  0 |                    0 |                      0 |                      0 |                      0
      30 | Development Bank of Rwanda | BR012     | Burera      |                  1 |           5051261.49 |   5051261.490000000000 |             5051261.49 |             5051261.49
      21 | Bank of Kigali             | BK012     | Rusizi      |                  1 |           6623431.24 |   6623431.240000000000 |             6623431.24 |             6623431.24
      49 | GT Bank                    | GT014     | Rusizi      |                  1 |           7467205.01 |   7467205.010000000000 |             7467205.01 |             7467205.01
      47 | Access Bank                | AC014     | Nyagatare   |                  1 |           3633996.93 |   3633996.930000000000 |             3633996.93 |             3633996.93
       3 | I&M Bank                   | IM003     | Kicukiro    |                  2 |          12574638.40 |   6287319.200000000000 |             6500000.00 |             6074638.40
      17 | Access Bank                | AC011     | Muhanga     |                  1 |           4370857.66 |   4370857.660000000000 |             4370857.66 |             4370857.66
      37 | Access Bank                | AC013     | Nyabihu     |                  1 |           1820020.24 |   1820020.240000000000 |             1820020.24 |             1820020.24
      28 | BPR Bank                   | BP012     | Gicumbi     |                  1 |           1568039.52 |   1568039.520000000000 |             1568039.52 |             1568039.52
      20 | Development Bank of Rwanda | BR011     | Karongi     |                  1 |            905353.52 |    905353.520000000000 |              905353.52 |              905353.52
      33 | I&M Bank                   | IM013     | Nyaruguru   |                  1 |           1482905.48 |   1482905.480000000000 |             1482905.48 |             1482905.48
       1 | Bank of Kigali             | BK001     | Kigali Main |                  2 |           1782681.00 |    891340.500000000000 |             1250000.00 |              532681.00
      76 | NCBA Bank                  | NC017     | Karongi     |                  1 |           6288666.01 |   6288666.010000000000 |             6288666.01 |             6288666.01
       5 | Ecobank                    | EC005     | Huye        |                  2 |           3082745.19 |   1541372.595000000000 |             2500000.00 |              582745.19
      18 | BPR Bank                   | BP011     | Rwamagana   |                  1 |           5523407.67 |   5523407.670000000000 |             5523407.67 |             5523407.67
      64 | Cogebanque                 | CG016     | Rutsiro     |                  1 |           8100656.54 |   8100656.540000000000 |             8100656.54 |             8100656.54
(100 rows)

13.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    pay.payment_date,
    b.bank_name,
    tt.tax_type_name,

    COUNT(pay.payment_id) AS number_of_payments,

    SUM(pay.payment_amount) AS total_payment_amount,

    SUM(trf.refund_amount) AS total_refund_amount,

    SUM(pay.payment_amount)-SUM(trf.refund_amount)
    AS net_revenue_collected

FROM taxpayer tp

INNER JOIN tax_registration tr
ON tp.taxpayer_id=tr.taxpayer_id

INNER JOIN tax_type tt
ON tr.tax_type_id=tt.tax_type_id

INNER JOIN tax_declaration td
ON tr.registration_id=td.registration_id

INNER JOIN tax_assessment ta
ON td.declaration_id=ta.declaration_id

INNER JOIN tax_payment pay
ON ta.assessment_id=pay.assessment_id

INNER JOIN bank b
ON pay.bank_id=b.bank_id

INNER JOIN tax_refund trf
ON pay.payment_id=trf.payment_id

GROUP BY
tp.taxpayer_tin,
tp.taxpayer_name,
pay.payment_date,
b.bank_name,
tt.tax_type_name

HAVING
SUM(pay.payment_amount)-SUM(trf.refund_amount)>1000000;

ANSWER

 taxpayer_tin |        taxpayer_name         | payment_date |         bank_name          |          tax_type_name          | number_of_payments | total_payment_amount | total_refund_amount | net_revenue_collected
--------------+------------------------------+--------------+----------------------------+---------------------------------+--------------------+----------------------+---------------------+-----------------------
 TIN100036    | Unity Construction Ltd       | 2024-06-05   | NCBA Bank                  | Advertising Tax                 |                  1 |           2843673.36 |           160926.03 |            2682747.33
 TIN100070    | Silver Star Hotel Ltd        | 2025-08-28   | Development Bank of Rwanda | Cross Border Trade Levy         |                  1 |           5549677.81 |           440931.32 |            5108746.49
 TIN100089    | Gloria Uwamwezi              | 2025-08-19   | GT Bank                    | Passenger Service Charge        |                  1 |           6336032.46 |           160299.04 |            6175733.42
 TIN100083    | Thierry Habumuremyi          | 2024-03-12   | I&M Bank                   | Postal Service Levy             |                  1 |           1135652.58 |            89307.92 |            1046344.66
 TIN100081    | Yvonne Ingabire              | 2025-08-20   | Bank of Kigali             | Freight Transport Levy          |                  1 |           6830269.50 |           337898.51 |            6492370.99
 TIN100096    | Unity Medical Centre Ltd     | 2025-04-12   | NCBA Bank                  | Electronic Payment Levy         |                  1 |           7407971.21 |           304309.42 |            7103661.79
 TIN100075    | Claude Muryango              | 2024-08-25   | Ecobank                    | Television Broadcasting Levy    |                  1 |           4000116.73 |           212141.44 |            3787975.29
 TIN100039    | Innocent Niyonzima           | 2025-02-24   | GT Bank                    | Air Travel Tax                  |                  1 |           1884029.03 |            93360.63 |            1790668.40
 TIN100093    | Chantal Mukeshimana          | 2025-05-05   | I&M Bank                   | Online Marketplace Levy         |                  1 |           7357311.16 |           471955.18 |            6885355.98
 TIN100072    | Capital Investments Ltd      | 2025-05-19   | Equity Bank                | Fishing Licence Levy            |                  1 |           1429888.63 |            82219.23 |            1347669.40
 TIN100071    | David Ndayambaje             | 2025-02-01   | Bank of Kigali             | Livestock Trading Tax           |                  1 |           1047062.93 |            27807.74 |            1019255.19
 TIN100056    | Modern Furniture Ltd         | 2025-09-18   | NCBA Bank                  | Foreign Investment Levy         |                  1 |           4258975.76 |           278936.04 |            3980039.72
 TIN100022    | New Horizon Transport Ltd    | 2024-08-12   | Equity Bank                | Business Licence Tax            |                  1 |           4953303.87 |           188783.99 |            4764519.88
 TIN100040    | Elite Security Ltd           | 2024-11-19   | Development Bank of Rwanda | Luxury Vehicle Tax              |                  1 |           5051261.49 |           198221.75 |            4853039.74
 100000004    | Vision Tech Ltd              | 2024-02-22   | Cogebanque                 | Withholding Tax                 |                  1 |           1800000.00 |            45000.00 |            1755000.00
 TIN100099    | Fabrice Habimana             | 2024-11-03   | GT Bank                    | Research and Innovation Levy    |                  1 |           2031431.30 |           106282.11 |            1925149.19
 100000005    | Eric Niyonzima               | 2025-01-30   | Ecobank                    | Property Tax                    |                  1 |           2500000.00 |            60000.00 |            2440000.00
 TIN100048    | Rwanda Fresh Foods Ltd       | 2024-03-29   | BPR Bank                   | Industrial Development Levy     |                  1 |           6760440.89 |           405066.38 |            6355374.51
 TIN100055    | Jean de Dieu Ndayambaje      | 2024-07-23   | Ecobank                    | Municipal Service Tax           |                  1 |           2057229.27 |            59782.31 |            1997446.96
 TIN100020    | Royal Furniture Ltd          | 2025-05-29   | Development Bank of Rwanda | Airport Service Charge          |                  1 |           5040094.29 |           300368.51 |            4739725.78
 100000001    | John Smith                   | 2024-02-20   | Bank of Kigali             | Value Added Tax                 |                  1 |           1250000.00 |            50000.00 |            1200000.00
 TIN100090    | Kigali Printing Services Ltd | 2024-07-08   | Development Bank of Rwanda | Port Handling Levy              |                  1 |           5131408.29 |           306812.66 |            4824595.63
 TIN100067    | Patrick Nshimiyimana         | 2025-09-12   | Access Bank                | Land Registration Fee           |                  1 |           6085645.25 |           334112.57 |            5751532.68
 TIN100074    | Rwanda Textile Ltd           | 2024-11-26   | Cogebanque                 | Quarry Operations Tax           |                  1 |           8100656.54 |           599647.00 |            7501009.54
 TIN100044    | Excellent Builders Ltd       | 2025-03-14   | Cogebanque                 | Agricultural Export Levy        |                  1 |           2407216.36 |            53075.52 |            2354140.84
 TIN100035    | Yvette Mukandayisenga        | 2024-05-16   | Ecobank                    | Waste Management Levy           |                  1 |           6967690.81 |           332757.62 |            6634933.19
 TIN100078    | Excellent Hardware Ltd       | 2025-08-03   | BPR Bank                   | Market Stall Tax                |                  1 |           4904095.42 |           222284.94 |            4681810.48
 TIN100061    | Benitha Uwimana              | 2024-06-04   | Bank of Kigali             | Road User Levy                  |                  1 |           5743519.67 |           432465.19 |            5311054.48
 TIN100062    | East Horizon Ltd             | 2024-06-18   | Equity Bank                | Solid Waste Collection Tax      |                  1 |           1535849.20 |            87271.60 |            1448577.60
 TIN100013    | Jean Claude Mugenzi          | 2024-07-16   | I&M Bank                   | Import Duty                     |                  1 |           6074638.40 |           269252.14 |            5805386.26
 TIN100047    | Eric Tuyishime               | 2024-04-29   | Access Bank                | Manufacturing Tax               |                  1 |           1820020.24 |            89953.29 |            1730066.95
 TIN100041    | Christine Uwase              | 2024-05-10   | Bank of Kigali             | Commercial Vehicle Tax          |                  1 |           4465477.79 |           219569.70 |            4245908.09
 100000008    | Future Builders              | 2025-04-01   | BPR Bank                   | Capital Gains Tax               |                  1 |           4200000.00 |            80000.00 |            4120000.00
 TIN100021    | Patrick Nizeyimana           | 2024-02-26   | Bank of Kigali             | Telecommunication Levy          |                  1 |           5967556.53 |           155567.27 |            5811989.26
 100000006    | Hope Traders                 | 2024-04-20   | NCBA Bank                  | Rental Income Tax               |                  1 |           1450000.00 |            55000.00 |            1395000.00
 TIN100038    | Kivu Fisheries Ltd           | 2025-03-08   | BPR Bank                   | Infrastructure Development Levy |                  1 |           1568039.52 |            48024.04 |            1520015.48
 TIN100080    | Golden Vision Ltd            | 2024-08-09   | Development Bank of Rwanda | Conference Services Tax         |                  1 |           4217521.76 |           286268.01 |            3931253.75
 TIN100060    | Great Lakes Trading Ltd      | 2024-07-19   | Development Bank of Rwanda | Business Renewal Fee            |                  1 |           3715060.98 |            93860.09 |            3621200.89
 TIN100064    | Royal Paints Ltd             | 2025-05-03   | Cogebanque                 | Electricity Consumption Tax     |                  1 |           4875671.20 |           121748.64 |            4753922.56
 TIN100051    | Aimable Nshimiyimana         | 2025-09-28   | Bank of Kigali             | Communication Service Tax       |                  1 |           6936543.69 |           549086.11 |            6387457.58
 TIN100082    | Prime Logistics Ltd          | 2025-10-29   | Equity Bank                | Courier Service Tax             |                  1 |           2477141.73 |           103830.16 |            2373311.57
 TIN100084    | Modern Supermarket Ltd       | 2025-03-04   | Cogebanque                 | Cold Storage Facility Tax       |                  1 |           6910076.23 |           501417.55 |            6408658.68
 TIN100034    | Sunshine Agriculture Ltd     | 2024-10-16   | Cogebanque                 | Forestry Levy                   |                  1 |           5821019.76 |           216116.25 |            5604903.51
 TIN100097    | Sandrine Uwimbabazi          | 2025-03-18   | Access Bank                | Financial Services Levy         |                  1 |           3809525.47 |            81963.59 |            3727561.88
 TIN100092    | Sunrise Motors Ltd           | 2025-08-14   | Equity Bank                | E-Commerce Tax                  |                  1 |           7041794.93 |           209638.36 |            6832156.57
 TIN100095    | Aimé Ndayisenga              | 2024-09-16   | Ecobank                    | Cloud Computing Service Tax     |                  1 |           6031959.16 |           293349.64 |            5738609.52
 TIN100045    | Alice Uwera                  | 2025-09-22   | Ecobank                    | Import Service Tax              |                  1 |           1858700.54 |            41378.10 |            1817322.44
 TIN100049    | Jeannette Mukarwego          | 2025-04-13   | GT Bank                    | Natural Resources Levy          |                  1 |           2360080.47 |            91833.51 |            2268246.96
 TIN100016    | Bright Future Academy        | 2024-06-02   | NCBA Bank                  | Digital Services Tax            |                  1 |           1738312.77 |            64379.35 |            1673933.42
 TIN100076    | Blue Mountain Coffee Ltd     | 2024-06-19   | NCBA Bank                  | Radio Broadcasting Levy         |                  1 |           6557723.04 |           195166.88 |            6362556.16
 TIN100098    | Great Vision Academy Ltd     | 2025-08-11   | BPR Bank                   | Investment Income Tax           |                  1 |           3478329.63 |           177721.15 |            3300608.48
 TIN100050    | City Express Ltd             | 2024-09-29   | Development Bank of Rwanda | Petroleum Levy                  |                  1 |           6408029.05 |           446289.43 |            5961739.62
 TIN100052    | Vision Agro Ltd              | 2025-01-18   | Equity Bank                | Public Health Levy              |                  1 |           1788652.06 |            51543.44 |            1737108.62
 TIN100091    | Samuel Rugwizangoga          | 2025-09-08   | Bank of Kigali             | Telecom Infrastructure Levy     |                  1 |           1395375.95 |            28479.80 |            1366896.15
 TIN100027    | Claudine Uwamahoro           | 2025-02-08   | Access Bank                | Export Documentation Fee        |                  1 |           4370857.66 |           120260.15 |            4250597.51
 TIN100028    | Modern Printing Services     | 2024-04-06   | BPR Bank                   | Import Processing Fee           |                  1 |           5523407.67 |           348742.15 |            5174665.52
 TIN100024    | Excellent Pharmacy Ltd       | 2024-10-03   | Cogebanque                 | Plastic Packaging Levy          |                  1 |           7033149.57 |           213332.62 |            6819816.95
 TIN100037    | Francine Mukamugema          | 2025-06-07   | Access Bank                | Fire Safety Levy                |                  1 |           4999042.87 |           286932.97 |            4712109.90
 TIN100012    | East Africa Supplies Ltd     | 2024-12-04   | Equity Bank                | Customs Duty                    |                  1 |           2166768.02 |            48692.45 |            2118075.57
 TIN100068    | Green Hills Ltd              | 2024-03-08   | BPR Bank                   | Business Permit Renewal Tax     |                  1 |           5023341.55 |           328932.34 |            4694409.21
 TIN100058    | Skyline Logistics Ltd        | 2025-10-16   | BPR Bank                   | Import Inspection Fee           |                  1 |           3390590.65 |           140930.32 |            3249660.33
 TIN100023    | Josiane Uwimana              | 2025-02-05   | I&M Bank                   | Construction Permit Fee         |                  1 |           2138054.08 |           154125.60 |            1983928.48
 TIN100086    | Victory Construction Ltd     | 2024-11-02   | NCBA Bank                  | Border Security Levy            |                  1 |           6288666.01 |           248839.28 |            6039826.73
 TIN100063    | Jean Paul Nkurunziza         | 2024-08-10   | I&M Bank                   | Water Supply Levy               |                  1 |           6560028.52 |           311113.75 |            6248914.77
 TIN100042    | Smart Choice Electronics Ltd | 2024-08-23   | Equity Bank                | Small Business Tax              |                  1 |           3940162.25 |           108745.48 |            3831416.77
 TIN100077    | Florence Mukarubayiza        | 2024-12-28   | Access Bank                | Parking Services Tax            |                  1 |           6352539.95 |           331761.99 |            6020777.96
 TIN100043    | Theogene Habimana            | 2024-11-03   | I&M Bank                   | Large Enterprise Tax            |                  1 |           1482905.48 |            41067.08 |            1441838.40
 TIN100085    | Vestine Nyirahabimana        | 2025-01-04   | Ecobank                    | Warehouse Operations Levy       |                  1 |           2216071.75 |            87967.33 |            2128104.42
 TIN100046    | Crystal Water Ltd            | 2025-01-27   | NCBA Bank                  | Export Service Tax              |                  1 |           6616104.06 |           181580.37 |            6434523.69
 TIN100073    | Anitha Nyiransabimana        | 2024-03-04   | I&M Bank                   | Timber Harvest Levy             |                  1 |           7960337.76 |           527221.58 |            7433116.18
 TIN100019    | Beatha Mukeshimana           | 2025-09-06   | GT Bank                    | Hotel Occupancy Tax             |                  1 |           3094155.09 |           145853.09 |            2948302.00
 100000010    | Smart Holdings               | 2025-01-28   | Development Bank of Rwanda | Environmental Tax               |                  1 |           3600000.00 |            70000.00 |            3530000.00
 TIN100069    | Esperance Uwamahoro          | 2024-06-20   | GT Bank                    | Public Market Levy              |                  1 |           4804215.13 |           301988.93 |            4502226.20
 TIN100054    | Lake View Hotel Ltd          | 2025-06-08   | Cogebanque                 | Urban Development Tax           |                  1 |           1228377.18 |            54995.23 |            1173381.95
 TIN100066    | Topline Furniture Ltd        | 2025-06-20   | NCBA Bank                  | Building Inspection Fee         |                  1 |           4568036.31 |           307637.01 |            4260399.30
 TIN100032    | Reliable Motors Ltd          | 2025-03-06   | Equity Bank                | Motor Vehicle Tax               |                  1 |           4793192.31 |           264676.51 |            4528515.80
 TIN100031    | Ange Iradukunda              | 2024-12-23   | Bank of Kigali             | Vehicle Registration Tax        |                  1 |           6623431.24 |           322653.07 |            6300778.17
 TIN100057    | Agnès Mukarurangwa           | 2025-10-14   | Access Bank                | Business Expansion Tax          |                  1 |           3633996.93 |           104123.01 |            3529873.92
 TIN100018    | Mountain Coffee Exporters    | 2025-09-23   | BPR Bank                   | Gaming Tax                      |                  1 |           1624516.89 |            78297.86 |            1546219.03
 TIN100053    | Clarisse Nyiransabimana      | 2025-07-23   | I&M Bank                   | Education Development Levy      |                  1 |           3455243.80 |           206708.85 |            3248534.95
 TIN100017    | Didier Nsengimana            | 2025-07-27   | Access Bank                | Insurance Premium Tax           |                  1 |           4651378.74 |            96496.41 |            4554882.33
 TIN100029    | Emmanuel Nkundimana          | 2025-09-02   | GT Bank                    | Financial Transaction Tax       |                  1 |           1273576.82 |            27799.72 |            1245777.10
 TIN100059    | Gilbert Mucyo                | 2024-10-07   | GT Bank                    | Export Inspection Fee           |                  1 |           7467205.01 |           316051.19 |            7151153.82
 TIN100065    | Aline Mukamana               | 2025-03-29   | Ecobank                    | Sewerage Service Levy           |                  1 |           3219987.55 |           175403.43 |            3044584.12
 TIN100094    | East African Traders Ltd     | 2025-08-28   | Cogebanque                 | Data Processing Tax             |                  1 |           5871412.81 |           301730.04 |            5569682.77
 TIN100088    | Bright Future Pharmacy Ltd   | 2025-07-09   | BPR Bank                   | Aviation Fuel Levy              |                  1 |           6266949.93 |           334202.37 |            5932747.56
 TIN100079    | Isaac Mugiraneza             | 2024-07-27   | GT Bank                    | Advertising Billboard Levy      |                  1 |           2866872.96 |           133753.98 |            2733118.98
 100000003    | Alice Uwase                  | 2025-03-30   | I&M Bank                   | Corporate Income Tax            |                  1 |           6500000.00 |           100000.00 |            6400000.00
(88 rows)

14.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    pay.payment_id,
    pay.payment_amount,

    COALESCE(trf.refund_amount,0) AS refund_amount,

    trf.refund_date,

    (COALESCE(trf.refund_amount,0)/pay.payment_amount)*100
    AS refund_percentage

FROM taxpayer tp

INNER JOIN tax_registration tr
ON tp.taxpayer_id=tr.taxpayer_id

INNER JOIN tax_declaration td
ON tr.registration_id=td.registration_id

INNER JOIN tax_assessment ta
ON td.declaration_id=ta.declaration_id

INNER JOIN tax_payment pay
ON ta.assessment_id=pay.assessment_id

LEFT JOIN tax_refund trf
ON pay.payment_id=trf.payment_id

GROUP BY
tp.taxpayer_tin,
tp.taxpayer_name,
pay.payment_id,
pay.payment_amount,
trf.refund_amount,
trf.refund_date

HAVING
(COALESCE(trf.refund_amount,0)/pay.payment_amount)*100>10;

ANSWER
 taxpayer_tin | taxpayer_name | payment_id | payment_amount | refund_amount | refund_date | refund_percentage
--------------+---------------+------------+----------------+---------------+-------------+-------------------
(0 rows)

15.SELECT
    tc.tax_centre_id,
    tc.centre_name,
    tc.district_name,
    tc.centre_manager,
    tt.tax_type_name,
    rt.target_year,
    rt.target_amount,

    COALESCE(SUM(td.declared_amount),0)
    AS total_declared_amount,

    COALESCE(SUM(ta.assessed_amount),0)
    AS total_assessed_amount,

    COALESCE(SUM(tp.payment_amount),0)
    AS total_revenue_collected

FROM tax_payment tp

LEFT JOIN tax_assessment ta
ON tp.assessment_id=ta.assessment_id

LEFT JOIN tax_declaration td
ON ta.declaration_id=td.declaration_id

LEFT JOIN tax_registration tr
ON td.registration_id=tr.registration_id

LEFT JOIN tax_type tt
ON tr.tax_type_id=tt.tax_type_id

RIGHT JOIN revenue_target rt
ON tt.tax_type_id=rt.tax_type_id

LEFT JOIN tax_centre tc
ON tr.tax_centre_id=tc.tax_centre_id

GROUP BY
tc.tax_centre_id,
tc.centre_name,
tc.district_name,
tc.centre_manager,
tt.tax_type_name,
rt.target_year,
rt.target_amount

HAVING
COALESCE(SUM(tp.payment_amount),0)<rt.target_amount;

ANSWER

 tax_centre_id |          centre_name          | district_name |      centre_manager      |          tax_type_name          | target_year | target_amount | total_declared_amount | total_assessed_amount | total_revenue_collected
---------------+-------------------------------+---------------+--------------------------+---------------------------------+-------------+---------------+-----------------------+-----------------------+-------------------------
            99 | Kibungo Central Tax Centre    | Ngoma         | Sandrine Uwimbabazi      | Research and Innovation Levy    |        2026 |  333180824.83 |            1917820.83 |            2031431.30 |              2031431.30
            84 | Kagano Tax Centre             | Nyamasheke    | Thierry Mukeshimana      | Cold Storage Facility Tax       |        2025 |  374815249.07 |            6626797.52 |            6910076.23 |              6910076.23
            79 | Murunda Tax Centre            | Rutsiro       | Ange Umutoni             | Advertising Billboard Levy      |        2024 |  328862493.99 |            2992179.74 |            2866872.96 |              2866872.96
            59 | Bwishyura Tax Centre          | Karongi       | Innocent Nkurunziza      | Export Inspection Fee           |        2026 |  638180011.60 |            7480745.60 |            7467205.01 |              7467205.01
            33 | Rubavu West Tax Centre        | Rubavu        | Sandrine Mukamana        | Mining Royalty                  |        2025 |  855204105.07 |             629935.56 |             653313.96 |               653313.96
            28 | Gatsibo Tax Centre            | Gatsibo       | Aimable Rugwizangoga     | Import Processing Fee           |        2020 |  388006042.62 |            5554068.86 |            5523407.67 |              5523407.67
             8 | Muhanga Tax Centre            | Muhanga       | Diane Uwera              | Capital Gains Tax               |        2025 |  750000000.00 |            4200000.00 |            4400000.00 |              4200000.00
           100 | Kirehe Central Tax Centre     | Kirehe        | Fabrice Ndayisaba        | Public Infrastructure Tax       |        2024 |  737491970.47 |             451446.67 |             462136.64 |               462136.64
            78 | Rambura Tax Centre            | Nyabihu       | Gilbert Ndayambaje       | Market Stall Tax                |        2026 |  590707915.69 |            4684585.52 |            4904095.42 |              4904095.42
            35 | Huye Central Tax Centre       | Huye          | Gloria Uwimbabazi        | Waste Management Levy           |        2023 |  510410764.30 |            6458287.59 |            6967690.81 |              6967690.81
             2 | Gasabo Tax Centre             | Gasabo        | Alice Uwimana            | Pay As You Earn                 |        2025 |  350000000.00 |             900000.00 |             950000.00 |               900000.00
            46 | Gahanga Tax Centre            | Kicukiro      | Alice Mukandayisenga     | Export Service Tax              |        2021 |  867679570.25 |            6368533.83 |            6616104.06 |              6616104.06
            65 | Kabeza Tax Centre             | Kicukiro      | Eric Habimana            | Sewerage Service Levy           |        2024 |  439273423.23 |            3047658.86 |            3219987.55 |              3219987.55
            86 | Mahembe Tax Centre            | Nyamasheke    | Jean Claude Habineza     | Border Security Levy            |        2023 |  805034319.20 |            6621669.11 |            6288666.01 |              6288666.01
            34 | Musanze North Tax Centre      | Musanze       | Thierry Ndayambaje       | Forestry Levy                   |        2025 |  355743742.57 |            5866092.05 |            5821019.76 |              5821019.76
            32 | Nyamasheke Tax Centre         | Nyamasheke    | Fabrice Nkundimana       | Motor Vehicle Tax               |        2023 |  632919158.62 |            4456935.45 |            4793192.31 |              4793192.31
            55 | Kibirizi Tax Centre           | Nyanza        | Fabrice Habineza         | Municipal Service Tax           |        2021 |  554717265.38 |            2075718.06 |            2057229.27 |              2057229.27
            67 | Kinyinya Tax Centre           | Gasabo        | Didier Muryango          | Land Registration Fee           |        2022 |  318463108.65 |            6497613.86 |            6085645.25 |              6085645.25
            47 | Masaka Tax Centre             | Kicukiro      | Gilbert Nshimiyimana     | Manufacturing Tax               |        2021 |  593745820.97 |            1949146.12 |            1820020.24 |              1820020.24
            68 | Gisozi Tax Centre             | Gasabo        | Olivia Mukeshimana       | Business Permit Renewal Tax     |        2020 |  463796702.77 |            5198040.55 |            5023341.55 |              5023341.55
            23 | Nyaruguru Tax Centre          | Nyaruguru     | Yvonne Mukandayisenga    | Construction Permit Fee         |        2025 |  746348437.51 |            2300673.66 |            2138054.08 |              2138054.08
            60 | Gisenyi Tax Centre            | Rubavu        | Chantal Uwimbabazi       | Business Renewal Fee            |        2026 |  597878931.10 |            3968589.31 |            3715060.98 |              3715060.98
            22 | Gisagara Tax Centre           | Gisagara      | Emmanuel Mucyo           | Business Licence Tax            |        2026 |  128153178.96 |            5326603.64 |            4953303.87 |              4953303.87
             6 | Rubavu Tax Centre             | Rubavu        | Samuel Uwizeye           | Rental Income Tax               |        2025 |  300000000.00 |            1450000.00 |            1500000.00 |              1450000.00
            85 | Macuba Tax Centre             | Nyamasheke    | Gloria Habimana          | Warehouse Operations Levy       |        2024 |  460649915.27 |            2024056.63 |            2216071.75 |              2216071.75
            80 | Boneza Tax Centre             | Rutsiro       | Emmanuel Tuyisenge       | Conference Services Tax         |        2021 |  449298203.41 |            4183529.02 |            4217521.76 |              4217521.76
            25 | Kirehe Tax Centre             | Kirehe        | Ange Uwamahoro           | Carbon Emission Tax             |        2023 |  446327368.95 |            1035913.99 |            1065061.69 |              1065061.69
            50 | Kabarondo Tax Centre          | Kayonza       | Emmanuel Tuyishime       | Petroleum Levy                  |        2020 |  907918751.73 |            6874580.09 |            6408029.05 |              6408029.05
            57 | Muganza Tax Centre            | Nyaruguru     | Theogene Mucyo           | Business Expansion Tax          |        2020 |  484591474.00 |            3384723.56 |            3633996.93 |              3633996.93
            44 | Kacyiru Tax Centre            | Gasabo        | Jeannette Uwase          | Agricultural Export Levy        |        2020 |  411972377.74 |            2243624.35 |            2407216.36 |              2407216.36
             5 | Huye Tax Centre               | Huye          | Patrick Niyonsaba        | Property Tax                    |        2025 |  150000000.00 |            2500000.00 |            2600000.00 |              2500000.00
            63 | Gikondo Tax Centre            | Kicukiro      | Patrick Nshimiyimana     | Water Supply Levy               |        2024 |  606371840.44 |            6002971.42 |            6560028.52 |              6560028.52
            41 | Nyabugogo Tax Centre          | Nyarugenge    | Eric Manzi               | Commercial Vehicle Tax          |        2023 |  922837833.00 |            4685743.24 |            4465477.79 |              4465477.79
            53 | Kinihira Tax Centre           | Rulindo       | Aimable Ndayambaje       | Education Development Levy      |        2021 |  745716476.05 |            3148549.69 |            3455243.80 |              3455243.80
            11 | Nyamagabe Tax Centre          | Nyamagabe     | Aline Uwimana            | Stamp Duty                      |        2026 |  906412799.89 |             480077.44 |             532681.00 |               532681.00
            31 | Rusizi South Tax Centre       | Rusizi        | Beatha Umutoni           | Vehicle Registration Tax        |        2020 |  696296847.75 |            6271713.58 |            6623431.24 |              6623431.24
            39 | Muhanga East Tax Centre       | Muhanga       | Vestine Uwamahoro        | Air Travel Tax                  |        2024 |  232392584.33 |            1808450.62 |            1884029.03 |              1884029.03
            70 | Jabana Tax Centre             | Gasabo        | Jeannette Niyonsaba      | Cross Border Trade Levy         |        2020 |  754694346.39 |            5706320.16 |            5549677.81 |              5549677.81
            72 | Rushashi Tax Centre           | Gakenke       | David Manzi              | Fishing Licence Levy            |        2020 |  272048224.89 |            1438735.83 |            1429888.63 |              1429888.63
            62 | Kimisagara Tax Centre         | Nyarugenge    | Alice Nyirahabimana      | Solid Waste Collection Tax      |        2021 |  710775408.27 |            1400457.50 |            1535849.20 |              1535849.20
            82 | Murambi Tax Centre            | Karongi       | Innocent Rugwizangoga    | Courier Service Tax             |        2021 |  430222638.97 |            2633923.61 |            2477141.73 |              2477141.73
            24 | Kayonza Tax Centre            | Kayonza       | Claude Niyonzima         | Plastic Packaging Levy          |        2021 |  856163880.48 |            7191934.12 |            7033149.57 |              7033149.57
            43 | Kimironko Tax Centre          | Gasabo        | Didier Ndayisaba         | Large Enterprise Tax            |        2024 |  596371645.84 |            1476497.96 |            1482905.48 |              1482905.48
            16 | Gicumbi Tax Centre            | Gicumbi       | Samuel Habimana          | Digital Services Tax            |        2024 |  295248812.85 |            1874193.42 |            1738312.77 |              1738312.77
            98 | Rukomo Tax Centre             | Nyagatare     | Emmanuel Mugiraneza      | Investment Income Tax           |        2022 |  250579977.20 |            3550700.22 |            3478329.63 |              3478329.63
            30 | Rwamagana East Tax Centre     | Rwamagana     | Didier Manzi             | Luxury Goods Tax                |        2024 |  899556483.20 |             867361.43 |             905353.52 |               905353.52
            29 | Nyagatare East Tax Centre     | Nyagatare     | Christine Nyiransabimana | Financial Transaction Tax       |        2021 |  389638129.64 |            1198748.37 |            1273576.82 |              1273576.82
            66 | Niboye Tax Centre             | Kicukiro      | Grace Uwamahoro          | Building Inspection Fee         |        2021 |  647155712.94 |            4109623.28 |            4568036.31 |              4568036.31
            88 | Nyakabuye Tax Centre          | Rusizi        | Patrick Muryango         | Aviation Fuel Levy              |        2024 |  359315059.32 |            6175367.42 |            6266949.93 |              6266949.93
            10 | Nyagatare Tax Centre          | Nyagatare     | Olivia Mukeshimana       | Environmental Tax               |        2025 |  900000000.00 |            3600000.00 |            3750000.00 |              3600000.00
            48 | Kabuga Tax Centre             | Gasabo        | Yvonne Mukamana          | Industrial Development Levy     |        2024 |  430490575.74 |            6096329.77 |            6760440.89 |              6760440.89
            87 | Kanjongo Tax Centre           | Nyamasheke    | Vestine Mukarwego        | Maritime Service Tax            |        2024 |  259934194.42 |             916704.85 |            1018544.90 |              1018544.90
            21 | Nyanza Tax Centre             | Nyanza        | Jeannette Uwase          | Telecommunication Levy          |        2026 |  397703964.82 |            5763413.04 |            5967556.53 |              5967556.53
            74 | Kinigi Tax Centre             | Musanze       | Fabrice Mucyo            | Quarry Operations Tax           |        2026 |  616059498.91 |            7297594.31 |            8100656.54 |              8100656.54
            18 | Rulindo Tax Centre            | Rulindo       | David Nshimiyimana       | Gaming Tax                      |        2026 |  426004714.57 |            1731631.08 |            1624516.89 |              1624516.89
            94 | Kiziguro Tax Centre           | Gatsibo       | David Habimana           | Data Processing Tax             |        2024 |  617075510.40 |            5737909.42 |            5871412.81 |              5871412.81
            83 | Rwankuba Tax Centre           | Karongi       | Sandrine Uwimbabazi      | Postal Service Levy             |        2025 |  582404931.77 |            1105447.62 |            1135652.58 |              1135652.58
             9 | Rwamagana Tax Centre          | Rwamagana     | Emmanuel Habimana        | Tourism Levy                    |        2025 |  180000000.00 |             760000.00 |             800000.00 |               760000.00
             3 | Kicukiro Tax Centre           | Kicukiro      | Eric Mugisha             | Corporate Income Tax            |        2025 |  800000000.00 |            6500000.00 |            6800000.00 |              6500000.00
            52 | Byumba Tax Centre             | Gicumbi       | Clarisse Uwera           | Public Health Levy              |        2025 |  918379269.78 |            1830911.12 |            1788652.06 |              1788652.06
            15 | Burera Tax Centre             | Burera        | Alice Uwera              | Road Maintenance Levy           |        2021 |  693225506.76 |             528835.29 |             582745.19 |               582745.19
            56 | Save Tax Centre               | Gisagara      | Sandrine Umutoni         | Foreign Investment Levy         |        2025 |  330921280.85 |            4180636.49 |            4258975.76 |              4258975.76
            61 | Nyamirambo Tax Centre         | Nyarugenge    | Jean Pierre Uwimana      | Road User Levy                  |        2026 |  453378975.46 |            5741631.53 |            5743519.67 |              5743519.67
            37 | Gasabo North Tax Centre       | Gasabo        | Aline Nyirahabimana      | Fire Safety Levy                |        2024 |  191390559.79 |            4876928.00 |            4999042.87 |              4999042.87
            49 | Kibungo Tax Centre            | Ngoma         | David Rugwizangoga       | Natural Resources Levy          |        2025 |  580333716.84 |            2227734.31 |            2360080.47 |              2360080.47
            97 | Ngarama Tax Centre            | Gatsibo       | Olivia Uwamahoro         | Financial Services Levy         |        2020 |  805422419.36 |            3454320.60 |            3809525.47 |              3809525.47
            73 | Cyanika Tax Centre            | Burera        | Clarisse Ingabire        | Timber Harvest Levy             |        2021 |  451907456.20 |            7167474.68 |            7960337.76 |              7960337.76
            58 | Kibeho Tax Centre             | Nyaruguru     | Gloria Mukeshimana       | Import Inspection Fee           |        2026 |  408522916.88 |            3175683.64 |            3390590.65 |              3390590.65
            96 | Muhura Tax Centre             | Gatsibo       | Claude Rugwizangoga      | Electronic Payment Levy         |        2026 |  389142140.07 |            7465075.37 |            7407971.21 |              7407971.21
            40 | Rutsiro Tax Centre            | Rutsiro       | Claude Habimana          | Luxury Vehicle Tax              |        2026 |  110399663.03 |            5353106.26 |            5051261.49 |              5051261.49
            51 | Mimuri Tax Centre             | Nyagatare     | Beatha Ingabire          | Communication Service Tax       |        2024 |  610427117.14 |            6609846.91 |            6936543.69 |              6936543.69
            91 | Rwimiyaga Tax Centre          | Nyagatare     | Grace Uwase              | Telecom Infrastructure Levy     |        2024 |  511415036.64 |            1488914.10 |            1395375.95 |              1395375.95
            54 | Base Tax Centre               | Rulindo       | Florence Nyiransabimana  | Urban Development Tax           |        2026 |  744645008.86 |            1328675.45 |            1228377.18 |              1228377.18
            38 | Nyarugenge Central Tax Centre | Nyarugenge    | Patrick Mugisha          | Infrastructure Development Levy |        2025 |  753408408.25 |            1471109.50 |            1568039.52 |              1568039.52
             7 | Rusizi Tax Centre             | Rusizi        | Claire Ingabire          | Excise Duty                     |        2025 |  220000000.00 |             980000.00 |            1000000.00 |               980000.00
            27 | Bugesera Tax Centre           | Bugesera      | Clarisse Mukarurangwa    | Export Documentation Fee        |        2024 |  191623047.73 |            4646827.43 |            4370857.66 |              4370857.66
            95 | Kiramuruzi Tax Centre         | Gatsibo       | Yvette Mukandayisenga    | Cloud Computing Service Tax     |        2021 |  818758310.97 |            5433232.60 |            6031959.16 |              6031959.16
            12 | Karongi Tax Centre            | Karongi       | Jean Claude Mugenzi      | Customs Duty                    |        2022 |  519831759.22 |            2063221.35 |            2166768.02 |              2166768.02
            77 | Mukamira Tax Centre           | Nyabihu       | Christine Mukamana       | Parking Services Tax            |        2021 |  862700910.82 |            6360019.31 |            6352539.95 |              6352539.95
            89 | Kamembe Tax Centre            | Rusizi        | Alice Nyirahabimana      | Passenger Service Charge        |        2025 |  846320263.21 |            5814007.89 |            6336032.46 |              6336032.46
            69 | Bumbogo Tax Centre            | Gasabo        | Samuel Rugwizangoga      | Public Market Levy              |        2021 |  260917690.88 |            5208314.66 |            4804215.13 |              4804215.13
            45 | Kanombe Tax Centre            | Kicukiro      | Samuel Muryango          | Import Service Tax              |        2021 |  476946560.56 |            1881229.25 |            1858700.54 |              1858700.54
             4 | Musanze Tax Centre            | Musanze       | Grace Mukamana           | Withholding Tax                 |        2025 |  250000000.00 |            1800000.00 |            1900000.00 |              1800000.00
            13 | Ngororero Tax Centre          | Ngororero     | Vestine Mukamana         | Import Duty                     |        2023 |  454425656.23 |            5602592.74 |            6074638.40 |              6074638.40
            93 | Tabagwe Tax Centre            | Nyagatare     | Claire Mukamana          | Online Marketplace Levy         |        2024 |  389015647.24 |            7243412.92 |            7357311.16 |              7357311.16
            81 | Gashari Tax Centre            | Karongi       | Beatha Nyiransabimana    | Freight Transport Levy          |        2022 |  626193937.81 |            6913153.16 |            6830269.50 |              6830269.50
            14 | Nyabihu Tax Centre            | Nyabihu       | Patrick Ndayisaba        | Export Duty                     |        2026 |  244185002.41 |             925959.59 |             919605.45 |               919605.45
            71 | Rutunga Tax Centre            | Gasabo        | Claude Nkurunziza        | Livestock Trading Tax           |        2023 |  333784463.21 |            1103175.65 |            1047062.93 |              1047062.93
            19 | Kamonyi Tax Centre            | Kamonyi       | Olivia Ingabire          | Hotel Occupancy Tax             |        2022 |  421420561.43 |            3320542.71 |            3094155.09 |              3094155.09
            90 | Bugarama Tax Centre           | Rusizi        | Eric Nkundimana          | Port Handling Levy              |        2020 |  700406644.97 |            5050205.92 |            5131408.29 |              5131408.29
            36 | Kicukiro South Tax Centre     | Kicukiro      | Jean Baptiste Nkurunziza | Advertising Tax                 |        2023 |  897421637.76 |            3036908.82 |            2843673.36 |              2843673.36
             1 | Kigali Tax Centre             | Nyarugenge    | Jean Bosco               | Value Added Tax                 |        2025 |  500000000.00 |            1200000.00 |            1250000.00 |              1250000.00
            92 | Karama Tax Centre             | Nyagatare     | Samuel Nshimiyimana      | E-Commerce Tax                  |        2020 |  694389900.36 |            6581517.90 |            7041794.93 |              7041794.93
            76 | Shyira Tax Centre             | Nyabihu       | Aimable Habineza         | Radio Broadcasting Levy         |        2022 |  329931155.20 |            6567733.70 |            6557723.04 |              6557723.04
            20 | Ruhango Tax Centre            | Ruhango       | Eric Tuyisenge           | Airport Service Charge          |        2026 |  708762653.29 |            4542712.92 |            5040094.29 |              5040094.29
            26 | Ngoma Tax Centre              | Ngoma         | Gilbert Habineza         | Agricultural Produce Tax        |        2026 |  461341982.69 |             996357.91 |            1028292.63 |              1028292.63
            64 | Kagarama Tax Centre           | Kicukiro      | Vestine Mukarurangwa     | Electricity Consumption Tax     |        2026 |  509333251.32 |            4594145.02 |            4875671.20 |              4875671.20
            75 | Busogo Tax Centre             | Musanze       | Yvonne Uwase             | Television Broadcasting Levy    |        2020 |  140132981.18 |            3955308.06 |            4000116.73 |              4000116.73
            17 | Gakenke Tax Centre            | Gakenke       | Claire Mukeshimana       | Insurance Premium Tax           |        2025 |  493551211.83 |            4634534.85 |            4651378.74 |              4651378.74
            42 | Remera Tax Centre             | Gasabo        | Grace Mukarwego          | Small Business Tax              |        2026 |  844921492.69 |            4145807.11 |            3940162.25 |              3940162.25
(100 rows)


16.SELECT
    o.officer_id,
    o.officer_name,
    o.officer_position,
    tc.centre_name,
    COUNT(DISTINCT ta.assessment_id) AS number_of_assessments,
    SUM(ta.assessed_amount) AS total_assessed_amount,
    COUNT(DISTINCT au.audit_id) AS number_of_audits,
    COALESCE(SUM(af.finding_amount),0) AS total_audit_finding_amount,
    COUNT(DISTINCT ec.enforcement_id) AS number_of_enforcement_cases,
    COALESCE(SUM(ec.outstanding_amount),0) AS total_enforcement_outstanding_amount
FROM tax_officer o
INNER JOIN tax_centre tc
    ON o.tax_centre_id = tc.tax_centre_id
INNER JOIN tax_assessment ta
    ON o.officer_id = ta.officer_id
INNER JOIN tax_audit au
    ON o.officer_id = au.officer_id
LEFT JOIN audit_finding af
    ON au.audit_id = af.audit_id
INNER JOIN enforcement_case ec
    ON o.officer_id = ec.officer_id
GROUP BY
    o.officer_id,
    o.officer_name,
    o.officer_position,
    tc.centre_name
HAVING
    COUNT(DISTINCT ta.assessment_id) > 5
    AND COALESCE(SUM(ec.outstanding_amount),0) > 1000000
ORDER BY total_enforcement_outstanding_amount DESC;

ANSWER

 officer_id |    officer_name    |  officer_position  |     centre_name      | number_of_assessments | total_assessed_amount | number_of_audits | total_audit_finding_amount | number_of_enforcement_cases | total_enforcement_outstanding_amount
------------+--------------------+--------------------+----------------------+-----------------------+-----------------------+------------------+----------------------------+-----------------------------+--------------------------------------
          2 | Alice Uwase        | Senior Tax Officer | Gasabo Tax Centre    |                    10 |         3107675300.00 |               10 |               635216140.00 |                          10 |                         362502582.00
          6 | Samuel Uwizeye     | Revenue Officer    | Rubavu Tax Centre    |                    10 |         4280775515.00 |               10 |               435576052.00 |                          10 |                         346420039.00
          4 | Grace Mukamana     | Revenue Officer    | Musanze Tax Centre   |                    10 |         4506718510.00 |               10 |               495575082.00 |                          10 |                         342601910.00
          5 | Patrick Habimana   | Tax Officer        | Huye Tax Centre      |                    10 |         3059956269.00 |               10 |               529662816.00 |                          10 |                         313999543.00
          3 | Eric Mugabo        | Tax Auditor        | Kicukiro Tax Centre  |                    10 |         4361748574.00 |               10 |               537723736.00 |                          10 |                         313079322.00
         10 | Olivia Uwimana     | Tax Officer        | Nyagatare Tax Centre |                    10 |         4023054383.00 |               10 |               469591116.00 |                          10 |                         300641168.00
          9 | Emmanuel Ndayisaba | Revenue Officer    | Rwamagana Tax Centre |                    10 |         3291759827.00 |               10 |               541317079.00 |                          10 |                         290884645.00
          1 | John Nkurunziza    | Tax Officer        | Kigali Tax Centre    |                    10 |         4079191830.00 |               10 |               591917717.00 |                          10 |                         276949271.00
          8 | Diane Mukeshimana  | Senior Tax Officer | Muhanga Tax Centre   |                    10 |         4293971215.00 |               10 |               518387396.00 |                          10 |                         261157646.00
          7 | Claire Ingabire    | Tax Auditor        | Rusizi Tax Centre    |                    10 |         3774155201.00 |               10 |               391459834.00 |                          10 |                         249272775.00
(10 rows)


17.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    COUNT(DISTINCT b.business_id) AS number_of_businesses,
    COUNT(DISTINCT p.property_id) AS number_of_properties,
    COUNT(DISTINCT v.vehicle_id) AS number_of_vehicles,
    COALESCE(SUM(DISTINCT p.property_value),0) AS total_property_value,
    COALESCE(SUM(DISTINCT v.vehicle_value),0) AS total_vehicle_value,
    COUNT(DISTINCT td.declaration_id) AS number_of_declarations,
    COALESCE(SUM(ta.assessed_amount),0) AS total_assessed_amount,
    COALESCE(SUM(pay.payment_amount),0) AS total_payment_amount,
    COALESCE(SUM(r.refund_amount),0) AS total_refund_amount
FROM taxpayer tp
LEFT JOIN business b
    ON tp.taxpayer_id = b.taxpayer_id
LEFT JOIN property p
    ON tp.taxpayer_id = p.taxpayer_id
LEFT JOIN vehicle v
    ON tp.taxpayer_id = v.taxpayer_id
LEFT JOIN tax_registration tr
    ON tp.taxpayer_id = tr.taxpayer_id
LEFT JOIN tax_declaration td
    ON tr.registration_id = td.registration_id
LEFT JOIN tax_assessment ta
    ON td.declaration_id = ta.declaration_id
LEFT JOIN tax_payment pay
    ON ta.assessment_id = pay.assessment_id
LEFT JOIN tax_refund r
    ON pay.payment_id = r.payment_id
GROUP BY
    tp.taxpayer_tin,
    tp.taxpayer_name
HAVING
    (COALESCE(SUM(DISTINCT p.property_value),0)
    + COALESCE(SUM(DISTINCT v.vehicle_value),0)) > 50000000
ORDER BY tp.taxpayer_name;

ANSWER

 taxpayer_tin |        taxpayer_name         | number_of_businesses | number_of_properties | number_of_vehicles | total_property_value | total_vehicle_value | number_of_declarations | total_assessed_amount | total_payment_amount | total_refund_amount
--------------+------------------------------+----------------------+----------------------+--------------------+----------------------+---------------------+------------------------+-----------------------+----------------------+---------------------
 TIN100057    | Agnès Mukarurangwa           |                    1 |                    1 |                  1 |         124365270.96 |         54223749.75 |                      1 |            3633996.93 |           3633996.93 |           104123.01
 TIN100095    | Aimé Ndayisenga              |                    1 |                    1 |                  1 |          86222755.51 |         47567648.68 |                      1 |            6031959.16 |           6031959.16 |           293349.64
 TIN100051    | Aimable Nshimiyimana         |                    1 |                    1 |                  1 |          45802865.12 |         48723940.63 |                      1 |            6936543.69 |           6936543.69 |           549086.11
 100000003    | Alice Uwase                  |                    1 |                    1 |                  1 |         120000000.00 |         45000000.00 |                      1 |            6800000.00 |           6500000.00 |           100000.00
 TIN100045    | Alice Uwera                  |                    1 |                    1 |                  1 |         120764719.50 |         44554014.18 |                      1 |            1858700.54 |           1858700.54 |            41378.10
 TIN100065    | Aline Mukamana               |                    1 |                    1 |                  1 |         126752519.71 |         31249054.04 |                      1 |            3219987.55 |           3219987.55 |           175403.43
 TIN100011    | Aline Nyirahabimana          |                    1 |                    1 |                  1 |          74437588.24 |         39057606.63 |                      1 |             532681.00 |            532681.00 |            17228.74
 TIN100031    | Ange Iradukunda              |                    1 |                    1 |                  1 |          44205369.53 |         30227721.61 |                      1 |            6623431.24 |           6623431.24 |           322653.07
 TIN100073    | Anitha Nyiransabimana        |                    1 |                    1 |                  1 |         112665687.91 |         21926152.85 |                      1 |            7960337.76 |           7960337.76 |           527221.58
 TIN100019    | Beatha Mukeshimana           |                    1 |                    1 |                  1 |         120455796.07 |         13517774.22 |                      1 |            3094155.09 |           3094155.09 |           145853.09
 TIN100061    | Benitha Uwimana              |                    1 |                    1 |                  1 |          67117844.40 |         12874666.52 |                      1 |            5743519.67 |           5743519.67 |           432465.19
 TIN100076    | Blue Mountain Coffee Ltd     |                    1 |                    1 |                  1 |          37664430.55 |         25768130.25 |                      1 |            6557723.04 |           6557723.04 |           195166.88
 TIN100016    | Bright Future Academy        |                    1 |                    1 |                  1 |         133221454.16 |         55876655.46 |                      1 |            1738312.77 |           1738312.77 |            64379.35
 TIN100088    | Bright Future Pharmacy Ltd   |                    1 |                    1 |                  1 |         116844178.29 |         43143057.53 |                      1 |            6266949.93 |           6266949.93 |           334202.37
 TIN100072    | Capital Investments Ltd      |                    1 |                    1 |                  1 |          72191002.98 |         12222904.12 |                      1 |            1429888.63 |           1429888.63 |            82219.23
 TIN100093    | Chantal Mukeshimana          |                    1 |                    1 |                  1 |          52274768.95 |         54105802.27 |                      1 |            7357311.16 |           7357311.16 |           471955.18
 TIN100041    | Christine Uwase              |                    1 |                    1 |                  1 |          87574229.13 |         54820794.71 |                      1 |            4465477.79 |           4465477.79 |           219569.70
 TIN100050    | City Express Ltd             |                    1 |                    1 |                  1 |          43680364.20 |         43791308.00 |                      1 |            6408029.05 |           6408029.05 |           446289.43
 TIN100053    | Clarisse Nyiransabimana      |                    1 |                    1 |                  1 |          46006259.26 |         44288408.30 |                      1 |            3455243.80 |           3455243.80 |           206708.85
 TIN100075    | Claude Muryango              |                    1 |                    1 |                  1 |         136018731.59 |         37616854.23 |                      1 |            4000116.73 |           4000116.73 |           212141.44
 TIN100033    | Claude Tuyisenge             |                    1 |                    1 |                  1 |          95495927.35 |         20835002.19 |                      1 |             653313.96 |            653313.96 |            35960.72
 TIN100027    | Claudine Uwamahoro           |                    1 |                    1 |                  1 |         138852696.59 |         51169574.72 |                      1 |            4370857.66 |           4370857.66 |           120260.15
 TIN100046    | Crystal Water Ltd            |                    1 |                    1 |                  1 |          68918937.40 |         53651661.65 |                      1 |            6616104.06 |           6616104.06 |           181580.37
 TIN100071    | David Ndayambaje             |                    1 |                    1 |                  1 |          54046435.54 |         32940990.57 |                      1 |            1047062.93 |           1047062.93 |            27807.74
 TIN100017    | Didier Nsengimana            |                    1 |                    1 |                  1 |          51941493.65 |         44621137.30 |                      1 |            4651378.74 |           4651378.74 |            96496.41
 TIN100012    | East Africa Supplies Ltd     |                    1 |                    1 |                  1 |          95938301.08 |         55418899.12 |                      1 |            2166768.02 |           2166768.02 |            48692.45
 TIN100094    | East African Traders Ltd     |                    1 |                    1 |                  1 |          64158826.88 |         32745082.89 |                      1 |            5871412.81 |           5871412.81 |           301730.04
 TIN100062    | East Horizon Ltd             |                    1 |                    1 |                  1 |          73901091.87 |         43953220.33 |                      1 |            1535849.20 |           1535849.20 |            87271.60
 TIN100040    | Elite Security Ltd           |                    1 |                    1 |                  1 |          71916766.29 |         30233733.83 |                      1 |            5051261.49 |           5051261.49 |           198221.75
 TIN100029    | Emmanuel Nkundimana          |                    1 |                    1 |                  1 |         129026648.94 |         29732146.63 |                      1 |            1273576.82 |           1273576.82 |            27799.72
 TIN100087    | Eric Manzi                   |                    1 |                    1 |                  1 |         128046185.40 |         51162021.59 |                      1 |            1018544.90 |           1018544.90 |            47161.60
 100000005    | Eric Niyonzima               |                    1 |                    1 |                  1 |          40000000.00 |         12000000.00 |                      1 |            2600000.00 |           2500000.00 |            60000.00
 TIN100047    | Eric Tuyishime               |                    1 |                    1 |                  1 |         131441933.04 |         13297425.45 |                      1 |            1820020.24 |           1820020.24 |            89953.29
 TIN100069    | Esperance Uwamahoro          |                    1 |                    1 |                  1 |         101870001.55 |         10605559.73 |                      1 |            4804215.13 |           4804215.13 |           301988.93
 TIN100044    | Excellent Builders Ltd       |                    1 |                    1 |                  1 |          58333423.14 |         25564706.13 |                      1 |            2407216.36 |           2407216.36 |            53075.52
 TIN100078    | Excellent Hardware Ltd       |                    1 |                    1 |                  1 |         116702457.54 |         27277216.42 |                      1 |            4904095.42 |           4904095.42 |           222284.94
 TIN100024    | Excellent Pharmacy Ltd       |                    1 |                    1 |                  1 |          81594295.24 |         31115102.70 |                      1 |            7033149.57 |           7033149.57 |           213332.62
 TIN100099    | Fabrice Habimana             |                    1 |                    1 |                  1 |          98857437.14 |         23449302.89 |                      1 |            2031431.30 |           2031431.30 |           106282.11
 TIN100077    | Florence Mukarubayiza        |                    1 |                    1 |                  1 |         129792621.92 |         56848714.03 |                      1 |            6352539.95 |           6352539.95 |           331761.99
 TIN100037    | Francine Mukamugema          |                    1 |                    1 |                  1 |          38927616.50 |         50969020.93 |                      1 |            4999042.87 |           4999042.87 |           286932.97
 100000008    | Future Builders              |                    1 |                    1 |                  1 |         110000000.00 |         50000000.00 |                      1 |            4400000.00 |           4200000.00 |            80000.00
 TIN100025    | Gilbert Habumuremyi          |                    1 |                    1 |                  1 |          34691661.59 |         31507701.82 |                      1 |            1065061.69 |           1065061.69 |            69947.12
 TIN100059    | Gilbert Mucyo                |                    1 |                    1 |                  1 |          85135612.65 |         37426839.08 |                      1 |            7467205.01 |           7467205.01 |           316051.19
 TIN100089    | Gloria Uwamwezi              |                    1 |                    1 |                  1 |         102288324.73 |         20446205.41 |                      1 |            6336032.46 |           6336032.46 |           160299.04
 TIN100080    | Golden Vision Ltd            |                    1 |                    1 |                  1 |          77401412.70 |         41918105.13 |                      1 |            4217521.76 |           4217521.76 |           286268.01
 100000007    | Grace Mukamana               |                    1 |                    1 |                  1 |          55000000.00 |         14000000.00 |                      1 |            1000000.00 |            980000.00 |            25000.00
 TIN100060    | Great Lakes Trading Ltd      |                    1 |                    1 |                  1 |          94426179.24 |         59927988.03 |                      1 |            3715060.98 |           3715060.98 |            93860.09
 TIN100098    | Great Vision Academy Ltd     |                    1 |                    1 |                  1 |          81482692.97 |         31925888.09 |                      1 |            3478329.63 |           3478329.63 |           177721.15
 TIN100068    | Green Hills Ltd              |                    1 |                    1 |                  1 |          64256063.95 |         42665483.65 |                      1 |            5023341.55 |           5023341.55 |           328932.34
 TIN100030    | Green Valley Hotel           |                    1 |                    1 |                  1 |         137438307.30 |         21455874.30 |                      1 |             905353.52 |            905353.52 |            54627.18
 100000006    | Hope Traders                 |                    1 |                    1 |                  1 |          70000000.00 |         30000000.00 |                      1 |            1500000.00 |           1450000.00 |            55000.00
 TIN100039    | Innocent Niyonzima           |                    1 |                    1 |                  1 |          64078761.77 |         13286952.06 |                      1 |            1884029.03 |           1884029.03 |            93360.63
 TIN100079    | Isaac Mugiraneza             |                    1 |                    1 |                  1 |          44000846.31 |         54708005.86 |                      1 |            2866872.96 |           2866872.96 |           133753.98
 TIN100013    | Jean Claude Mugenzi          |                    1 |                    1 |                  1 |          57327445.04 |         56198820.08 |                      1 |            6074638.40 |           6074638.40 |           269252.14
 TIN100055    | Jean de Dieu Ndayambaje      |                    1 |                    1 |                  1 |         114762386.79 |         32323812.91 |                      1 |            2057229.27 |           2057229.27 |            59782.31
 TIN100063    | Jean Paul Nkurunziza         |                    1 |                    1 |                  1 |          72453397.93 |         14531451.05 |                      1 |            6560028.52 |           6560028.52 |           311113.75
 TIN100049    | Jeannette Mukarwego          |                    1 |                    1 |                  1 |          96883802.22 |         53785353.91 |                      1 |            2360080.47 |           2360080.47 |            91833.51
 100000001    | John Smith                   |                    1 |                    1 |                  1 |          85000000.00 |         18000000.00 |                      1 |            1250000.00 |           1250000.00 |            50000.00
 TIN100023    | Josiane Uwimana              |                    1 |                    1 |                  1 |         104511527.23 |         21941016.33 |                      1 |            2138054.08 |           2138054.08 |           154125.60
 100000002    | Keza Ltd                     |                    1 |                    1 |                  1 |          65000000.00 |         15000000.00 |                      1 |             950000.00 |            900000.00 |            30000.00
 TIN100090    | Kigali Printing Services Ltd |                    1 |                    1 |                  1 |          74907043.01 |         37292084.16 |                      1 |            5131408.29 |           5131408.29 |           306812.66
 TIN100014    | Kigali Supermarket Ltd       |                    1 |                    1 |                  1 |          57626610.92 |         12426049.36 |                      1 |             919605.45 |            919605.45 |            62831.70
 TIN100038    | Kivu Fisheries Ltd           |                    1 |                    1 |                  1 |          99521616.99 |         31589404.41 |                      1 |            1568039.52 |           1568039.52 |            48024.04
 TIN100054    | Lake View Hotel Ltd          |                    1 |                    1 |                  1 |         126847375.64 |         46910831.90 |                      1 |            1228377.18 |           1228377.18 |            54995.23
 TIN100056    | Modern Furniture Ltd         |                    1 |                    1 |                  1 |         123073796.02 |         14061041.01 |                      1 |            4258975.76 |           4258975.76 |           278936.04
 TIN100028    | Modern Printing Services     |                    1 |                    1 |                  1 |          38889807.17 |         26426576.18 |                      1 |            5523407.67 |           5523407.67 |           348742.15
 TIN100084    | Modern Supermarket Ltd       |                    1 |                    1 |                  1 |         127622893.39 |         28496666.86 |                      1 |            6910076.23 |           6910076.23 |           501417.55
 TIN100018    | Mountain Coffee Exporters    |                    1 |                    1 |                  1 |         117187541.34 |         26451874.74 |                      1 |            1624516.89 |           1624516.89 |            78297.86
 TIN100022    | New Horizon Transport Ltd    |                    1 |                    1 |                  1 |          39126205.85 |         19580566.91 |                      1 |            4953303.87 |           4953303.87 |           188783.99
 TIN100021    | Patrick Nizeyimana           |                    1 |                    1 |                  1 |         123496391.27 |         48494596.83 |                      1 |            5967556.53 |           5967556.53 |           155567.27
 TIN100067    | Patrick Nshimiyimana         |                    1 |                    1 |                  1 |         114790378.13 |         22217377.53 |                      1 |            6085645.25 |           6085645.25 |           334112.57
 TIN100026    | Prime Engineering Ltd        |                    1 |                    1 |                  1 |          76772659.14 |         20587387.57 |                      1 |            1028292.63 |           1028292.63 |            30359.22
 TIN100082    | Prime Logistics Ltd          |                    1 |                    1 |                  1 |          61051994.20 |         17406307.26 |                      1 |            2477141.73 |           2477141.73 |           103830.16
 TIN100032    | Reliable Motors Ltd          |                    1 |                    1 |                  1 |         112225913.91 |         30921778.31 |                      1 |            4793192.31 |           4793192.31 |           264676.51
 TIN100020    | Royal Furniture Ltd          |                    1 |                    1 |                  1 |          46750418.77 |         18053328.50 |                      1 |            5040094.29 |           5040094.29 |           300368.51
 TIN100064    | Royal Paints Ltd             |                    1 |                    1 |                  1 |          88780467.88 |         22500911.01 |                      1 |            4875671.20 |           4875671.20 |           121748.64
 TIN100048    | Rwanda Fresh Foods Ltd       |                    1 |                    1 |                  1 |         111240949.00 |         27288270.42 |                      1 |            6760440.89 |           6760440.89 |           405066.38
 TIN100100    | Rwanda Premier Holdings Ltd  |                    1 |                    1 |                  1 |          52031306.63 |         20223153.59 |                      1 |             462136.64 |            462136.64 |            13960.42
 TIN100074    | Rwanda Textile Ltd           |                    1 |                    1 |                  1 |         127077464.00 |         33562801.13 |                      1 |            8100656.54 |           8100656.54 |           599647.00
 100000009    | Samuel Mugisha               |                    1 |                    1 |                  1 |          60000000.00 |         17000000.00 |                      1 |             800000.00 |            760000.00 |            20000.00
 TIN100091    | Samuel Rugwizangoga          |                    1 |                    1 |                  1 |         102221195.88 |         25010345.23 |                      1 |            1395375.95 |           1395375.95 |            28479.80
 TIN100097    | Sandrine Uwimbabazi          |                    1 |                    1 |                  1 |         112343462.36 |         46996590.30 |                      1 |            3809525.47 |           3809525.47 |            81963.59
 TIN100070    | Silver Star Hotel Ltd        |                    1 |                    1 |                  1 |          41632359.15 |         29774197.36 |                      1 |            5549677.81 |           5549677.81 |           440931.32
 TIN100058    | Skyline Logistics Ltd        |                    1 |                    1 |                  1 |          50454713.22 |         28750905.64 |                      1 |            3390590.65 |           3390590.65 |           140930.32
 TIN100042    | Smart Choice Electronics Ltd |                    1 |                    1 |                  1 |         128996716.49 |         33756706.40 |                      1 |            3940162.25 |           3940162.25 |           108745.48
 100000010    | Smart Holdings               |                    1 |                    1 |                  1 |         130000000.00 |         55000000.00 |                      1 |            3750000.00 |           3600000.00 |            70000.00
 TIN100092    | Sunrise Motors Ltd           |                    1 |                    1 |                  1 |          42356536.95 |         46738734.42 |                      1 |            7041794.93 |           7041794.93 |           209638.36
 TIN100034    | Sunshine Agriculture Ltd     |                    1 |                    1 |                  1 |         133830165.46 |         27275709.21 |                      1 |            5821019.76 |           5821019.76 |           216116.25
 TIN100043    | Theogene Habimana            |                    1 |                    1 |                  1 |         100447703.77 |         52192751.87 |                      1 |            1482905.48 |           1482905.48 |            41067.08
 TIN100083    | Thierry Habumuremyi          |                    1 |                    1 |                  1 |          51391909.66 |         17292693.61 |                      1 |            1135652.58 |           1135652.58 |            89307.92
 TIN100066    | Topline Furniture Ltd        |                    1 |                    1 |                  1 |         109382601.86 |         59051568.58 |                      1 |            4568036.31 |           4568036.31 |           307637.01
 TIN100036    | Unity Construction Ltd       |                    1 |                    1 |                  1 |          48830594.81 |         10472192.94 |                      1 |            2843673.36 |           2843673.36 |           160926.03
 TIN100096    | Unity Medical Centre Ltd     |                    1 |                    1 |                  1 |         132640075.70 |         12480708.28 |                      1 |            7407971.21 |           7407971.21 |           304309.42
 TIN100085    | Vestine Nyirahabimana        |                    1 |                    1 |                  1 |          30474245.28 |         53009186.41 |                      1 |            2216071.75 |           2216071.75 |            87967.33
 TIN100015    | Vestine Umutoni              |                    1 |                    1 |                  1 |          88389386.42 |         20726148.49 |                      1 |             582745.19 |            582745.19 |            45456.37
 TIN100086    | Victory Construction Ltd     |                    1 |                    1 |                  1 |         106377123.84 |         43835095.79 |                      1 |            6288666.01 |           6288666.01 |           248839.28
 TIN100052    | Vision Agro Ltd              |                    1 |                    1 |                  1 |         139023373.42 |         49611708.61 |                      1 |            1788652.06 |           1788652.06 |            51543.44
 100000004    | Vision Tech Ltd              |                    1 |                    1 |                  1 |          95000000.00 |         25000000.00 |                      1 |            1900000.00 |           1800000.00 |            45000.00
 TIN100035    | Yvette Mukandayisenga        |                    1 |                    1 |                  1 |          34076838.58 |         28545221.80 |                      1 |            6967690.81 |           6967690.81 |           332757.62
 TIN100081    | Yvonne Ingabire              |                    1 |                    1 |                  1 |          75026570.76 |         35817674.80 |                      1 |            6830269.50 |           6830269.50 |           337898.51
(100 rows)

18.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    b.business_sector,
    COUNT(DISTINCT b.business_id) AS number_of_businesses,
    COUNT(DISTINCT p.property_id) AS number_of_properties,
    COUNT(DISTINCT v.vehicle_id) AS number_of_vehicles,
    COALESCE(SUM(td.declared_amount),0) AS total_declared_amount,
    COALESCE(SUM(ta.assessed_amount),0) AS total_assessed_amount,
    COALESCE(SUM(pay.payment_amount),0) AS total_payment_amount,
    COALESCE(SUM(pe.penalty_amount),0) AS total_penalty_amount,
    COALESCE(SUM(af.finding_amount),0) AS total_audit_finding_amount
FROM taxpayer tp
RIGHT JOIN business b
    ON tp.taxpayer_id = b.taxpayer_id
LEFT JOIN property p
    ON tp.taxpayer_id = p.taxpayer_id
LEFT JOIN vehicle v
    ON tp.taxpayer_id = v.taxpayer_id
LEFT JOIN tax_registration tr
    ON tp.taxpayer_id = tr.taxpayer_id
LEFT JOIN tax_declaration td
    ON tr.registration_id = td.registration_id
LEFT JOIN tax_assessment ta
    ON td.declaration_id = ta.declaration_id
LEFT JOIN tax_payment pay
    ON ta.assessment_id = pay.assessment_id
LEFT JOIN penalty pe
    ON ta.assessment_id = pe.assessment_id
LEFT JOIN tax_audit au
    ON tp.taxpayer_id = au.taxpayer_id
LEFT JOIN audit_finding af
    ON au.audit_id = af.audit_id
GROUP BY
    tp.taxpayer_tin,
    tp.taxpayer_name,
    b.business_sector
HAVING
    (COUNT(DISTINCT b.business_id)
    + COUNT(DISTINCT p.property_id)
    + COUNT(DISTINCT v.vehicle_id)) > 1;

ANSWER
 taxpayer_tin |        taxpayer_name         | business_sector | number_of_businesses | number_of_properties | number_of_vehicles | total_declared_amount | total_assessed_amount | total_payment_amount | total_penalty_amount | total_audit_finding_amount
--------------+------------------------------+-----------------+----------------------+----------------------+--------------------+-----------------------+-----------------------+----------------------+----------------------+----------------------------
 100000001    | John Smith                   | Wholesale       |                    1 |                    1 |                  1 |            1200000.00 |            1250000.00 |           1250000.00 |             50000.00 |                  300000.00
 100000002    | Keza Ltd                     | Retail          |                    1 |                    1 |                  1 |             900000.00 |             950000.00 |            900000.00 |             75000.00 |                  250000.00
 100000003    | Alice Uwase                  | Construction    |                    1 |                    1 |                  1 |            6500000.00 |            6800000.00 |           6500000.00 |            200000.00 |                  900000.00
 100000004    | Vision Tech Ltd              | ICT             |                    1 |                    1 |                  1 |            1800000.00 |            1900000.00 |           1800000.00 |             60000.00 |                  350000.00
 100000005    | Eric Niyonzima               | Agriculture     |                    1 |                    1 |                  1 |            2500000.00 |            2600000.00 |           2500000.00 |             80000.00 |                  400000.00
 100000006    | Hope Traders                 | Import & Export |                    1 |                    1 |                  1 |            1450000.00 |            1500000.00 |           1450000.00 |            120000.00 |                  450000.00
 100000007    | Grace Mukamana               | Clothing        |                    1 |                    1 |                  1 |             980000.00 |            1000000.00 |            980000.00 |             45000.00 |                  200000.00
 100000008    | Future Builders              | Engineering     |                    1 |                    1 |                  1 |            4200000.00 |            4400000.00 |           4200000.00 |             95000.00 |                  800000.00
 100000009    | Samuel Mugisha               | Transport       |                    1 |                    1 |                  1 |             760000.00 |             800000.00 |            760000.00 |            110000.00 |                  150000.00
 100000010    | Smart Holdings               | Finance         |                    1 |                    1 |                  1 |            3600000.00 |            3750000.00 |           3600000.00 |             70000.00 |                  500000.00
 TIN100011    | Aline Nyirahabimana          | Clothing        |                    1 |                    1 |                  1 |             480077.44 |             532681.00 |            532681.00 |             39896.97 |                  455037.51
 TIN100012    | East Africa Supplies Ltd     | Wholesale       |                    1 |                    1 |                  1 |            2063221.35 |            2166768.02 |           2166768.02 |             79262.11 |                  169597.44
 TIN100013    | Jean Claude Mugenzi          | Manufacturing   |                    1 |                    1 |                  1 |            5602592.74 |            6074638.40 |           6074638.40 |            161447.08 |                  118354.19
 TIN100014    | Kigali Supermarket Ltd       | Agriculture     |                    1 |                    1 |                  1 |             925959.59 |             919605.45 |            919605.45 |             89383.27 |                  109380.91
 TIN100015    | Vestine Umutoni              | Agriculture     |                    1 |                    1 |                  1 |             528835.29 |             582745.19 |            582745.19 |            106549.80 |                  786511.39
 TIN100016    | Bright Future Academy        | Education       |                    1 |                    1 |                  1 |            1874193.42 |            1738312.77 |           1738312.77 |            111208.82 |                  827106.97
 TIN100017    | Didier Nsengimana            | Healthcare      |                    1 |                    1 |                  1 |            4634534.85 |            4651378.74 |           4651378.74 |             44163.38 |                  864258.73
 TIN100018    | Mountain Coffee Exporters    | Import & Export |                    1 |                    1 |                  1 |            1731631.08 |            1624516.89 |           1624516.89 |             50988.49 |                  214759.49
 TIN100019    | Beatha Mukeshimana           | Manufacturing   |                    1 |                    1 |                  1 |            3320542.71 |            3094155.09 |           3094155.09 |            152792.49 |                  279358.75
 TIN100020    | Royal Furniture Ltd          | Engineering     |                    1 |                    1 |                  1 |            4542712.92 |            5040094.29 |           5040094.29 |             77625.06 |                  163708.63
 TIN100021    | Patrick Nizeyimana           | Engineering     |                    1 |                    1 |                  1 |            5763413.04 |            5967556.53 |           5967556.53 |            114504.65 |                  221384.66
 TIN100022    | New Horizon Transport Ltd    | Engineering     |                    1 |                    1 |                  1 |            5326603.64 |            4953303.87 |           4953303.87 |             87197.02 |                  884514.51
 TIN100023    | Josiane Uwimana              | Education       |                    1 |                    1 |                  1 |            2300673.66 |            2138054.08 |           2138054.08 |             76242.09 |                  372566.87
 TIN100024    | Excellent Pharmacy Ltd       | Wholesale       |                    1 |                    1 |                  1 |            7191934.12 |            7033149.57 |           7033149.57 |             93112.31 |                  758829.05
 TIN100025    | Gilbert Habumuremyi          | Mining          |                    1 |                    1 |                  1 |            1035913.99 |            1065061.69 |           1065061.69 |            242650.18 |                  179691.42
 TIN100026    | Prime Engineering Ltd        | Mining          |                    1 |                    1 |                  1 |             996357.91 |            1028292.63 |           1028292.63 |             59853.14 |                  118048.22
 TIN100027    | Claudine Uwamahoro           | Agriculture     |                    1 |                    1 |                  1 |            4646827.43 |            4370857.66 |           4370857.66 |             95417.13 |                  369440.92
 TIN100028    | Modern Printing Services     | Agriculture     |                    1 |                    1 |                  1 |            5554068.86 |            5523407.67 |           5523407.67 |             83948.11 |                  694305.41
 TIN100029    | Emmanuel Nkundimana          | Finance         |                    1 |                    1 |                  1 |            1198748.37 |            1273576.82 |           1273576.82 |             79050.57 |                  661608.59
 TIN100030    | Green Valley Hotel           | Agriculture     |                    1 |                    1 |                  1 |             867361.43 |             905353.52 |            905353.52 |            106602.90 |                  604184.54
 TIN100031    | Ange Iradukunda              | Mining          |                    1 |                    1 |                  1 |            6271713.58 |            6623431.24 |           6623431.24 |            157031.69 |                  518778.21
 TIN100032    | Reliable Motors Ltd          | Finance         |                    1 |                    1 |                  1 |            4456935.45 |            4793192.31 |           4793192.31 |             73707.48 |                  874999.71
 TIN100033    | Claude Tuyisenge             | Healthcare      |                    1 |                    1 |                  1 |             629935.56 |             653313.96 |            653313.96 |             83929.25 |                  232560.88
 TIN100034    | Sunshine Agriculture Ltd     | Wholesale       |                    1 |                    1 |                  1 |            5866092.05 |            5821019.76 |           5821019.76 |            193068.38 |                  312220.41
 TIN100035    | Yvette Mukandayisenga        | Manufacturing   |                    1 |                    1 |                  1 |            6458287.59 |            6967690.81 |           6967690.81 |             81953.14 |                  349716.65
 TIN100036    | Unity Construction Ltd       | Real Estate     |                    1 |                    1 |                  1 |            3036908.82 |            2843673.36 |           2843673.36 |             55223.63 |                  427386.66
 TIN100037    | Francine Mukamugema          | Finance         |                    1 |                    1 |                  1 |            4876928.00 |            4999042.87 |           4999042.87 |            115455.58 |                  221918.37
 TIN100038    | Kivu Fisheries Ltd           | Mining          |                    1 |                    1 |                  1 |            1471109.50 |            1568039.52 |           1568039.52 |             75287.55 |                  571219.49
 TIN100039    | Innocent Niyonzima           | Manufacturing   |                    1 |                    1 |                  1 |            1808450.62 |            1884029.03 |           1884029.03 |            119217.34 |                  426755.16
 TIN100040    | Elite Security Ltd           | Retail          |                    1 |                    1 |                  1 |            5353106.26 |            5051261.49 |           5051261.49 |            100821.24 |                  620583.80
 TIN100041    | Christine Uwase              | Healthcare      |                    1 |                    1 |                  1 |            4685743.24 |            4465477.79 |           4465477.79 |             63536.56 |                  630614.99
 TIN100042    | Smart Choice Electronics Ltd | Healthcare      |                    1 |                    1 |                  1 |            4145807.11 |            3940162.25 |           3940162.25 |             64075.56 |                  659559.73
 TIN100043    | Theogene Habimana            | Retail          |                    1 |                    1 |                  1 |            1476497.96 |            1482905.48 |           1482905.48 |            230885.15 |                  755872.52
 TIN100044    | Excellent Builders Ltd       | Mining          |                    1 |                    1 |                  1 |            2243624.35 |            2407216.36 |           2407216.36 |             47519.24 |                  355718.56
 TIN100045    | Alice Uwera                  | Construction    |                    1 |                    1 |                  1 |            1881229.25 |            1858700.54 |           1858700.54 |             85100.74 |                  108532.31
 TIN100046    | Crystal Water Ltd            | Finance         |                    1 |                    1 |                  1 |            6368533.83 |            6616104.06 |           6616104.06 |            249123.26 |                  142297.50
 TIN100047    | Eric Tuyishime               | Hospitality     |                    1 |                    1 |                  1 |            1949146.12 |            1820020.24 |           1820020.24 |             45942.28 |                  102506.39
 TIN100048    | Rwanda Fresh Foods Ltd       | Engineering     |                    1 |                    1 |                  1 |            6096329.77 |            6760440.89 |           6760440.89 |             61126.06 |                  626394.30
 TIN100049    | Jeannette Mukarwego          | Healthcare      |                    1 |                    1 |                  1 |            2227734.31 |            2360080.47 |           2360080.47 |            248779.98 |                  473257.44
 TIN100050    | City Express Ltd             | Real Estate     |                    1 |                    1 |                  1 |            6874580.09 |            6408029.05 |           6408029.05 |             30169.92 |                  330102.41
 TIN100051    | Aimable Nshimiyimana         | Agriculture     |                    1 |                    1 |                  1 |            6609846.91 |            6936543.69 |           6936543.69 |             88530.16 |                  648224.07
 TIN100052    | Vision Agro Ltd              | Finance         |                    1 |                    1 |                  1 |            1830911.12 |            1788652.06 |           1788652.06 |            168769.38 |                  910308.46
 TIN100053    | Clarisse Nyiransabimana      | Finance         |                    1 |                    1 |                  1 |            3148549.69 |            3455243.80 |           3455243.80 |             66534.08 |                  519719.80
 TIN100054    | Lake View Hotel Ltd          | Mining          |                    1 |                    1 |                  1 |            1328675.45 |            1228377.18 |           1228377.18 |            118599.66 |                  943345.06
 TIN100055    | Jean de Dieu Ndayambaje      | Clothing        |                    1 |                    1 |                  1 |            2075718.06 |            2057229.27 |           2057229.27 |            110715.15 |                  817661.41
 TIN100056    | Modern Furniture Ltd         | Retail          |                    1 |                    1 |                  1 |            4180636.49 |            4258975.76 |           4258975.76 |             67589.82 |                  248625.10
 TIN100057    | Agnès Mukarurangwa           | Clothing        |                    1 |                    1 |                  1 |            3384723.56 |            3633996.93 |           3633996.93 |             74262.94 |                  767314.53
 TIN100058    | Skyline Logistics Ltd        | Import & Export |                    1 |                    1 |                  1 |            3175683.64 |            3390590.65 |           3390590.65 |            238049.62 |                  154967.98
 TIN100059    | Gilbert Mucyo                | Real Estate     |                    1 |                    1 |                  1 |            7480745.60 |            7467205.01 |           7467205.01 |             36196.39 |                  931318.87
 TIN100060    | Great Lakes Trading Ltd      | Engineering     |                    1 |                    1 |                  1 |            3968589.31 |            3715060.98 |           3715060.98 |            114619.08 |                  170300.57
 TIN100061    | Benitha Uwimana              | Finance         |                    1 |                    1 |                  1 |            5741631.53 |            5743519.67 |           5743519.67 |            212093.16 |                  827677.99
 TIN100062    | East Horizon Ltd             | Real Estate     |                    1 |                    1 |                  1 |            1400457.50 |            1535849.20 |           1535849.20 |             39593.10 |                  652221.13
 TIN100063    | Jean Paul Nkurunziza         | Education       |                    1 |                    1 |                  1 |            6002971.42 |            6560028.52 |           6560028.52 |             97313.12 |                  424846.18
 TIN100064    | Royal Paints Ltd             | Tourism         |                    1 |                    1 |                  1 |            4594145.02 |            4875671.20 |           4875671.20 |            242907.62 |                  851916.74
 TIN100065    | Aline Mukamana               | Real Estate     |                    1 |                    1 |                  1 |            3047658.86 |            3219987.55 |           3219987.55 |             85067.03 |                  703379.51
 TIN100066    | Topline Furniture Ltd        | Clothing        |                    1 |                    1 |                  1 |            4109623.28 |            4568036.31 |           4568036.31 |            117300.08 |                  161402.78
 TIN100067    | Patrick Nshimiyimana         | Finance         |                    1 |                    1 |                  1 |            6497613.86 |            6085645.25 |           6085645.25 |             82424.67 |                  298945.31
 TIN100068    | Green Hills Ltd              | Healthcare      |                    1 |                    1 |                  1 |            5198040.55 |            5023341.55 |           5023341.55 |             59454.71 |                  472221.59
 TIN100069    | Esperance Uwamahoro          | Healthcare      |                    1 |                    1 |                  1 |            5208314.66 |            4804215.13 |           4804215.13 |             96685.53 |                  790989.45
 TIN100070    | Silver Star Hotel Ltd        | Manufacturing   |                    1 |                    1 |                  1 |            5706320.16 |            5549677.81 |           5549677.81 |            107589.74 |                  884030.63
 TIN100071    | David Ndayambaje             | Import & Export |                    1 |                    1 |                  1 |            1103175.65 |            1047062.93 |           1047062.93 |             56354.00 |                  701891.72
 TIN100072    | Capital Investments Ltd      | Real Estate     |                    1 |                    1 |                  1 |            1438735.83 |            1429888.63 |           1429888.63 |            104174.16 |                  601895.65
 TIN100073    | Anitha Nyiransabimana        | Clothing        |                    1 |                    1 |                  1 |            7167474.68 |            7960337.76 |           7960337.76 |             89763.26 |                  653869.76
 TIN100074    | Rwanda Textile Ltd           | Agriculture     |                    1 |                    1 |                  1 |            7297594.31 |            8100656.54 |           8100656.54 |             33130.42 |                  298021.79
 TIN100075    | Claude Muryango              | Clothing        |                    1 |                    1 |                  1 |            3955308.06 |            4000116.73 |           4000116.73 |             96089.84 |                  861024.08
 TIN100076    | Blue Mountain Coffee Ltd     | Finance         |                    1 |                    1 |                  1 |            6567733.70 |            6557723.04 |           6557723.04 |            151323.73 |                  141845.47
 TIN100077    | Florence Mukarubayiza        | Mining          |                    1 |                    1 |                  1 |            6360019.31 |            6352539.95 |           6352539.95 |             53671.52 |                  584642.34
 TIN100078    | Excellent Hardware Ltd       | Finance         |                    1 |                    1 |                  1 |            4684585.52 |            4904095.42 |           4904095.42 |             95180.48 |                  791428.21
 TIN100079    | Isaac Mugiraneza             | Engineering     |                    1 |                    1 |                  1 |            2992179.74 |            2866872.96 |           2866872.96 |            247186.00 |                  782636.27
 TIN100080    | Golden Vision Ltd            | Tourism         |                    1 |                    1 |                  1 |            4183529.02 |            4217521.76 |           4217521.76 |             73708.29 |                  604638.02
 TIN100081    | Yvonne Ingabire              | Transport       |                    1 |                    1 |                  1 |            6913153.16 |            6830269.50 |           6830269.50 |             67655.04 |                  945850.21
 TIN100082    | Prime Logistics Ltd          | Real Estate     |                    1 |                    1 |                  1 |            2633923.61 |            2477141.73 |           2477141.73 |            169356.73 |                  732325.06
 TIN100083    | Thierry Habumuremyi          | Wholesale       |                    1 |                    1 |                  1 |            1105447.62 |            1135652.58 |           1135652.58 |             58744.00 |                  580871.86
 TIN100084    | Modern Supermarket Ltd       | Engineering     |                    1 |                    1 |                  1 |            6626797.52 |            6910076.23 |           6910076.23 |            112960.72 |                  309173.87
 TIN100085    | Vestine Nyirahabimana        | Construction    |                    1 |                    1 |                  1 |            2024056.63 |            2216071.75 |           2216071.75 |            215187.11 |                  153007.83
 TIN100086    | Victory Construction Ltd     | Construction    |                    1 |                    1 |                  1 |            6621669.11 |            6288666.01 |           6288666.01 |             66081.35 |                  910587.38
 TIN100087    | Eric Manzi                   | Manufacturing   |                    1 |                    1 |                  1 |             916704.85 |            1018544.90 |           1018544.90 |             83912.10 |                  169468.07
 TIN100088    | Bright Future Pharmacy Ltd   | Mining          |                    1 |                    1 |                  1 |            6175367.42 |            6266949.93 |           6266949.93 |            132356.14 |                  225618.54
 TIN100089    | Gloria Uwamwezi              | Healthcare      |                    1 |                    1 |                  1 |            5814007.89 |            6336032.46 |           6336032.46 |             65304.75 |                  287164.64
 TIN100090    | Kigali Printing Services Ltd | Healthcare      |                    1 |                    1 |                  1 |            5050205.92 |            5131408.29 |           5131408.29 |            103777.90 |                  378852.47
 TIN100091    | Samuel Rugwizangoga          | ICT             |                    1 |                    1 |                  1 |            1488914.10 |            1395375.95 |           1395375.95 |            145002.20 |                  669717.81
 TIN100092    | Sunrise Motors Ltd           | Engineering     |                    1 |                    1 |                  1 |            6581517.90 |            7041794.93 |           7041794.93 |             87238.47 |                  616739.71
 TIN100093    | Chantal Mukeshimana          | Finance         |                    1 |                    1 |                  1 |            7243412.92 |            7357311.16 |           7357311.16 |             68509.47 |                  818575.30
 TIN100094    | East African Traders Ltd     | ICT             |                    1 |                    1 |                  1 |            5737909.42 |            5871412.81 |           5871412.81 |            189456.01 |                  667144.43
 TIN100095    | Aimé Ndayisenga              | Mining          |                    1 |                    1 |                  1 |            5433232.60 |            6031959.16 |           6031959.16 |             55265.98 |                  937103.56
 TIN100096    | Unity Medical Centre Ltd     | Clothing        |                    1 |                    1 |                  1 |            7465075.37 |            7407971.21 |           7407971.21 |             78392.44 |                  928460.44
 TIN100097    | Sandrine Uwimbabazi          | Finance         |                    1 |                    1 |                  1 |            3454320.60 |            3809525.47 |           3809525.47 |            102701.42 |                  336103.68
 TIN100098    | Great Vision Academy Ltd     | Clothing        |                    1 |                    1 |                  1 |            3550700.22 |            3478329.63 |           3478329.63 |             53817.65 |                  632958.95
 TIN100099    | Fabrice Habimana             | Import & Export |                    1 |                    1 |                  1 |            1917820.83 |            2031431.30 |           2031431.30 |             51772.19 |                  630081.62
 TIN100100    | Rwanda Premier Holdings Ltd  | Real Estate     |                    1 |                    1 |                  1 |             451446.67 |             462136.64 |            462136.64 |            213644.67 |                  439510.09
(100 rows)

19.SELECT
    tp.taxpayer_tin,
    tp.taxpayer_name,
    tt.tax_type_name,
    tc.centre_name,
    tper.period_start_date,
    tper.period_end_date,
    tper.filing_due_date,
    COUNT(td.declaration_id) AS number_of_late_declarations,
    SUM(td.declared_amount) AS total_declared_amount,
    SUM(ta.assessed_amount) AS total_assessed_amount,
    COALESCE(SUM(pe.penalty_amount),0) AS total_penalty_amount,
    COALESCE(SUM(pay.payment_amount),0) AS total_payment_amount
FROM taxpayer tp
INNER JOIN tax_registration tr
    ON tp.taxpayer_id = tr.taxpayer_id
INNER JOIN tax_type tt
    ON tr.tax_type_id = tt.tax_type_id
INNER JOIN tax_centre tc
    ON tr.tax_centre_id = tc.tax_centre_id
INNER JOIN tax_declaration td
    ON tr.registration_id = td.registration_id
INNER JOIN tax_period tper
    ON td.tax_period_id = tper.tax_period_id
INNER JOIN tax_assessment ta
    ON td.declaration_id = ta.declaration_id
LEFT JOIN penalty pe
    ON ta.assessment_id = pe.assessment_id
LEFT JOIN tax_payment pay
    ON ta.assessment_id = pay.assessment_id
WHERE
    td.declaration_date > tper.filing_due_date
GROUP BY
    tp.taxpayer_tin,
    tp.taxpayer_name,
    tt.tax_type_name,
    tc.centre_name,
    tper.period_start_date,
    tper.period_end_date,
    tper.filing_due_date
HAVING
    COUNT(td.declaration_id) > 2;
ANSWER
 taxpayer_tin | taxpayer_name | tax_type_name | centre_name | period_start_date | period_end_date | filing_due_date | number_of_late_declarations | total_declared_amount | total_assessed_amount | total_penalty_amount | total_payment_amount
--------------+---------------+---------------+-------------+-------------------+-----------------+-----------------+-----------------------------+-----------------------+-----------------------+----------------------+----------------------
(0 rows)

20.SELECT tp.taxpayer_tin,tp.taxpayer_name,tp.taxpayer_type,b.business_name,p.property_location,v.plate_number,tt.tax_type_name,tt.filing_frequency,tc.centre_name,tc.district_name,o.officer_name,bk.bank_name,COUNT(DISTINCT td.declaration_id) AS number_of_declarations,COALESCE(SUM(td.declared_amount),0) AS total_declared_amount,COALESCE(SUM(ta.assessed_amount),0) AS total_assessed_amount,COALESCE(SUM(pay.payment_amount),0) AS total_payment_amount,COALESCE(SUM(pe.penalty_amount),0) AS total_penalty_amount,COALESCE(SUM(af.finding_amount),0) AS total_audit_finding_amount,COALESCE(SUM(r.refund_amount),0) AS total_refund_amount,COALESCE(SUM(ec.outstanding_amount),0) AS total_enforcement_outstanding_amount,rt.target_amount,(COALESCE(SUM(pay.payment_amount),0) / rt.target_amount) * 100 AS revenue_performance_percentage
FROM taxpayer tp
INNER JOIN tax_registration tr
    ON tp.taxpayer_id = tr.taxpayer_id
INNER JOIN tax_type tt
    ON tr.tax_type_id = tt.tax_type_id
INNER JOIN tax_centre tc
    ON tr.tax_centre_id = tc.tax_centre_id
LEFT JOIN business b
    ON tp.taxpayer_id = b.taxpayer_id
LEFT JOIN property p
    ON tp.taxpayer_id = p.taxpayer_id
LEFT JOIN vehicle v
    ON tp.taxpayer_id = v.taxpayer_id
INNER JOIN tax_declaration td
    ON tr.registration_id = td.registration_id
INNER JOIN tax_assessment ta
    ON td.declaration_id = ta.declaration_id
INNER JOIN tax_officer o
    ON ta.officer_id = o.officer_id
LEFT JOIN tax_payment pay
    ON ta.assessment_id = pay.assessment_id
LEFT JOIN bank bk
    ON pay.bank_id = bk.bank_id
LEFT JOIN penalty pe
    ON ta.assessment_id = pe.assessment_id
LEFT JOIN tax_refund r
    ON pay.payment_id = r.payment_id
LEFT JOIN tax_audit au
    ON tp.taxpayer_id = au.taxpayer_id
LEFT JOIN audit_finding af
    ON au.audit_id = af.audit_id
LEFT JOIN enforcement_case ec
    ON tp.taxpayer_id = ec.taxpayer_id
RIGHT JOIN revenue_target rt
    ON tt.tax_type_id = rt.tax_type_id
GROUP BY tp.taxpayer_tin,tp.taxpayer_name,tp.taxpayer_type,b.business_name,p.property_location,v.plate_number,tt.tax_type_name,tt.filing_frequency,tc.centre_name,tc.district_name,o.officer_name,bk.bank_name,rt.target_amount
HAVING COALESCE(SUM(ta.assessed_amount),0) > COALESCE(SUM(td.declared_amount),0) AND COALESCE(SUM(pay.payment_amount),0) > 0 AND COALESCE(SUM(ec.outstanding_amount),0) > 0 ORDER BY tp.taxpayer_name;

ANSWER
 taxpayer_tin |        taxpayer_name         | taxpayer_type |      business_name      | property_location | plate_number |          tax_type_name          | filing_frequency |          centre_name          | district_name |    officer_name    |         bank_name          | number_of_declarations | total_declared_amount | total_assessed_amount | total_payment_amount | total_penalty_amount | total_audit_finding_amount | total_refund_amount | total_enforcement_outstanding_amount | target_amount | revenue_performance_percentage
--------------+------------------------------+---------------+-------------------------+-------------------+--------------+---------------------------------+------------------+-------------------------------+---------------+--------------------+----------------------------+------------------------+-----------------------+-----------------------+----------------------+----------------------+----------------------------+---------------------+--------------------------------------+---------------+--------------------------------
 TIN100057    | Agnès Mukarurangwa           | Individual    | Twagirayezu Traders     | Gatsibo           | RAE057E      | Business Expansion Tax          | Quarterly        | Muganza Tax Centre            | Nyaruguru     | Claire Ingabire    | Access Bank                |                      1 |            3384723.56 |            3633996.93 |           3633996.93 |             74262.94 |                  767314.53 |           104123.01 |                            495366.29 |  484591474.00 |         0.74990938243374872100
 TIN100095    | Aimé Ndayisenga              | Individual    | Nyirahabimana Group     | Rutsiro           | RAQ095Q      | Cloud Computing Service Tax     | Quarterly        | Kiramuruzi Tax Centre         | Gatsibo       | Patrick Habimana   | Ecobank                    |                      1 |            5433232.60 |            6031959.16 |           6031959.16 |             55265.98 |                  937103.56 |           293349.64 |                            364406.35 |  818758310.97 |         0.73672035803261801700
 TIN100051    | Aimable Nshimiyimana         | Individual    | Uwizeye Services        | Rusizi            | RAY051Y      | Communication Service Tax       | Monthly          | Mimuri Tax Centre             | Nyagatare     | John Nkurunziza    | Bank of Kigali             |                      1 |            6609846.91 |            6936543.69 |           6936543.69 |             88530.16 |                  648224.07 |           549086.11 |                            453234.17 |  610427117.14 |         1.13634265176478395000
 100000003    | Alice Uwase                  | Individual    | Keza Holdings           | Nyarugenge        | RAC303C      | Corporate Income Tax            | Annually         | Kicukiro Tax Centre           | Kicukiro      | Eric Mugabo        | I&M Bank                   |                      1 |            6500000.00 |            6800000.00 |           6500000.00 |            200000.00 |                  900000.00 |           100000.00 |                            500000.00 |  800000000.00 |         0.81250000000000000000
 TIN100065    | Aline Mukamana               | Individual    | Nyirahabimana Pharmacy  | Ngororero         | RAM065M      | Sewerage Service Levy           | Quarterly        | Kabeza Tax Centre             | Kicukiro      | Patrick Habimana   | Ecobank                    |                      1 |            3047658.86 |            3219987.55 |           3219987.55 |             85067.03 |                  703379.51 |           175403.43 |                            310074.58 |  439273423.23 |         0.73302580573239930500
 TIN100011    | Aline Nyirahabimana          | Individual    | Uwimana Ventures        | Kigali            | RAK011K      | Stamp Duty                      | Monthly          | Nyamagabe Tax Centre          | Nyamagabe     | John Nkurunziza    | Bank of Kigali             |                      1 |             480077.44 |             532681.00 |            532681.00 |             39896.97 |                  455037.51 |            17228.74 |                            233175.89 |  906412799.89 |         0.05876803593954596000
 TIN100031    | Ange Iradukunda              | Individual    | Ntawukuriryayo Motors   | Burera            | RAE031E      | Vehicle Registration Tax        | Annually         | Rusizi South Tax Centre       | Rusizi        | John Nkurunziza    | Bank of Kigali             |                      1 |            6271713.58 |            6623431.24 |           6623431.24 |            157031.69 |                  518778.21 |           322653.07 |                            537425.52 |  696296847.75 |         0.95123671195738226000
 TIN100073    | Anitha Nyiransabimana        | Individual    | Keza Investments        | Musanze           | RAU073U      | Timber Harvest Levy             | Quarterly        | Cyanika Tax Centre            | Burera        | Eric Mugabo        | I&M Bank                   |                      1 |            7167474.68 |            7960337.76 |           7960337.76 |             89763.26 |                  653869.76 |           527221.58 |                            122272.19 |  451907456.20 |         1.76149732667323049100
 TIN100061    | Benitha Uwimana              | Individual    | Ntawukuriryayo Boutique | Ruhango           | RAI061I      | Road User Levy                  | Annually         | Nyamirambo Tax Centre         | Nyarugenge    | John Nkurunziza    | Bank of Kigali             |                      1 |            5741631.53 |            5743519.67 |           5743519.67 |            212093.16 |                  827677.99 |           432465.19 |                             91794.41 |  453378975.46 |         1.26682532293708668700
 TIN100088    | Bright Future Pharmacy Ltd   | Company       | Nsengiyumva Fashion     | Rulindo           | RAJ088J      | Aviation Fuel Levy              | Monthly          | Nyakabuye Tax Centre          | Rusizi        | Diane Mukeshimana  | BPR Bank                   |                      1 |            6175367.42 |            6266949.93 |           6266949.93 |            132356.14 |                  225618.54 |           334202.37 |                            268193.54 |  359315059.32 |         1.74413784433642646100
 TIN100093    | Chantal Mukeshimana          | Individual    | Musoni Ventures         | Gisagara          | RAO093O      | Online Marketplace Levy         | Quarterly        | Tabagwe Tax Centre            | Nyagatare     | Eric Mugabo        | I&M Bank                   |                      1 |            7243412.92 |            7357311.16 |           7357311.16 |             68509.47 |                  818575.30 |           471955.18 |                            144655.70 |  389015647.24 |         1.89126355512917645400
 TIN100053    | Clarisse Nyiransabimana      | Individual    | Bizimana Pharmacy       | Kayonza           | RAA053A      | Education Development Levy      | Annually         | Kinihira Tax Centre           | Rulindo       | Eric Mugabo        | I&M Bank                   |                      1 |            3148549.69 |            3455243.80 |           3455243.80 |             66534.08 |                  519719.80 |           206708.85 |                            409469.87 |  745716476.05 |         0.46334550877863763900
 TIN100075    | Claude Muryango              | Individual    | Habimana Construction   | Huye              | RAW075W      | Television Broadcasting Levy    | Monthly          | Busogo Tax Centre             | Musanze       | Patrick Habimana   | Ecobank                    |                      1 |            3955308.06 |            4000116.73 |           4000116.73 |             96089.84 |                  861024.08 |           212141.44 |                            446154.55 |  140132981.18 |         2.85451483035380037000
 TIN100033    | Claude Tuyisenge             | Individual    | Musoni Fashion          | Nyamagabe         | RAG033G      | Mining Royalty                  | Quarterly        | Rubavu West Tax Centre        | Rubavu        | Eric Mugabo        | I&M Bank                   |                      1 |             629935.56 |             653313.96 |            653313.96 |             83929.25 |                  232560.88 |            35960.72 |                            538336.38 |  855204105.07 |         0.07639275304303235000
 TIN100046    | Crystal Water Ltd            | Company       | Uwase Boutique          | Huye              | RAT046T      | Export Service Tax              | Monthly          | Gahanga Tax Centre            | Kicukiro      | Samuel Uwizeye     | NCBA Bank                  |                      1 |            6368533.83 |            6616104.06 |           6616104.06 |            249123.26 |                  142297.50 |           181580.37 |                            466620.34 |  867679570.25 |         0.76250545556739757800
 TIN100017    | Didier Nsengimana            | Individual    | Nkurunziza Enterprises  | Huye              | RAQ017Q      | Insurance Premium Tax           | Monthly          | Gakenke Tax Centre            | Gakenke       | Claire Ingabire    | Access Bank                |                      1 |            4634534.85 |            4651378.74 |           4651378.74 |             44163.38 |                  864258.73 |            96496.41 |                             93325.09 |  493551211.83 |         0.94243082146501392800
 TIN100012    | East Africa Supplies Ltd     | Company       | Mukamana Traders        | Gasabo            | RAL012L      | Customs Duty                    | Monthly          | Karongi Tax Centre            | Karongi       | Alice Uwase        | Equity Bank                |                      1 |            2063221.35 |            2166768.02 |           2166768.02 |             79262.11 |                  169597.44 |            48692.45 |                            170771.18 |  519831759.22 |         0.41682101594777585800
 TIN100094    | East African Traders Ltd     | Company       | Kagabo Enterprises      | Ngororero         | RAP094P      | Data Processing Tax             | Monthly          | Kiziguro Tax Centre           | Gatsibo       | Grace Mukamana     | Cogebanque                 |                      1 |            5737909.42 |            5871412.81 |           5871412.81 |            189456.01 |                  667144.43 |           301730.04 |                            179694.06 |  617075510.40 |         0.95149016790409318400
 TIN100062    | East Horizon Ltd             | Company       | Byiringiro Enterprises  | Nyamagabe         | RAJ062J      | Solid Waste Collection Tax      | Monthly          | Kimisagara Tax Centre         | Nyarugenge    | Alice Uwase        | Equity Bank                |                      1 |            1400457.50 |            1535849.20 |           1535849.20 |             39593.10 |                  652221.13 |            87271.60 |                            395096.67 |  710775408.27 |         0.21608080163299372800
 TIN100029    | Emmanuel Nkundimana          | Individual    | Munyaneza Logistics     | Gicumbi           | RAC029C      | Financial Transaction Tax       | Monthly          | Nyagatare East Tax Centre     | Nyagatare     | Emmanuel Ndayisaba | GT Bank                    |                      1 |            1198748.37 |            1273576.82 |           1273576.82 |             79050.57 |                  661608.59 |            27799.72 |                            124614.34 |  389638129.64 |         0.32686144479153033600
 TIN100087    | Eric Manzi                   | Individual    | Twagirayezu Farm        | Gicumbi           | RAI087I      | Maritime Service Tax            | Monthly          | Kanjongo Tax Centre           | Nyamasheke    | Claire Ingabire    | Access Bank                |                      1 |             916704.85 |            1018544.90 |           1018544.90 |             83912.10 |                  169468.07 |            47161.60 |                            265122.94 |  259934194.42 |         0.39184721435850863800
 100000005    | Eric Niyonzima               | Individual    | Ndayisaba Farm          | Musanze           | RAE505E      | Property Tax                    | Annually         | Huye Tax Centre               | Huye          | Patrick Habimana   | Ecobank                    |                      1 |            2500000.00 |            2600000.00 |           2500000.00 |             80000.00 |                  400000.00 |            60000.00 |                            250000.00 |  150000000.00 |         1.66666666666666666700
 TIN100044    | Excellent Builders Ltd       | Company       | Ndayisaba Construction  | Musanze           | RAR044R      | Agricultural Export Levy        | Quarterly        | Kacyiru Tax Centre            | Gasabo        | Grace Mukamana     | Cogebanque                 |                      1 |            2243624.35 |            2407216.36 |           2407216.36 |             47519.24 |                  355718.56 |            53075.52 |                            505405.65 |  411972377.74 |         0.58431499053541375400
 TIN100078    | Excellent Hardware Ltd       | Company       | Mugisha Technologies    | Nyagatare         | RAZ078Z      | Market Stall Tax                | Monthly          | Rambura Tax Centre            | Nyabihu       | Diane Mukeshimana  | BPR Bank                   |                      1 |            4684585.52 |            4904095.42 |           4904095.42 |             95180.48 |                  791428.21 |           222284.94 |                            330288.68 |  590707915.69 |         0.83020648441312577600
 TIN100099    | Fabrice Habimana             | Individual    | Nkubito Pharmacy        | Gasabo            | RAU099U      | Research and Innovation Levy    | Annually         | Kibungo Central Tax Centre    | Ngoma         | Emmanuel Ndayisaba | GT Bank                    |                      1 |            1917820.83 |            2031431.30 |           2031431.30 |             51772.19 |                  630081.62 |           106282.11 |                            207341.03 |  333180824.83 |         0.60970834712246846400
 TIN100037    | Francine Mukamugema          | Individual    | Gasana Group            | Rutsiro           | RAK037K      | Fire Safety Levy                | Annually         | Gasabo North Tax Centre       | Gasabo        | Claire Ingabire    | Access Bank                |                      1 |            4876928.00 |            4999042.87 |           4999042.87 |            115455.58 |                  221918.37 |           286932.97 |                            196468.47 |  191390559.79 |         2.61195895737235619700
 100000008    | Future Builders              | Company       | Smart Construction      | Muhanga           | RAH808H      | Capital Gains Tax               | Annually         | Muhanga Tax Centre            | Muhanga       | Diane Mukeshimana  | BPR Bank                   |                      1 |            4200000.00 |            4400000.00 |           4200000.00 |             95000.00 |                  800000.00 |            80000.00 |                            450000.00 |  750000000.00 |         0.56000000000000000000
 TIN100025    | Gilbert Habumuremyi          | Individual    | Kamikazi Ventures       | Kirehe            | RAY025Y      | Carbon Emission Tax             | Quarterly        | Kirehe Tax Centre             | Kirehe        | Patrick Habimana   | Ecobank                    |                      1 |            1035913.99 |            1065061.69 |           1065061.69 |            242650.18 |                  179691.42 |            69947.12 |                            477334.88 |  446327368.95 |         0.23862791396942407900
 TIN100089    | Gloria Uwamwezi              | Individual    | Munyaneza Enterprises   | Burera            | RAK089K      | Passenger Service Charge        | Monthly          | Kamembe Tax Centre            | Rusizi        | Emmanuel Ndayisaba | GT Bank                    |                      1 |            5814007.89 |            6336032.46 |           6336032.46 |             65304.75 |                  287164.64 |           160299.04 |                            257909.29 |  846320263.21 |         0.74865659436867591000
 TIN100080    | Golden Vision Ltd            | Company       | Niyonsenga Bakery       | Rusizi            | RAB080B      | Conference Services Tax         | Monthly          | Boneza Tax Centre             | Rutsiro       | Olivia Uwimana     | Development Bank of Rwanda |                      1 |            4183529.02 |            4217521.76 |           4217521.76 |             73708.29 |                  604638.02 |           286268.01 |                            477359.15 |  449298203.41 |         0.93869099141519756700
 100000007    | Grace Mukamana               | Individual    | Uwase Fashion           | Huye              | RAG707G      | Excise Duty                     | Monthly          | Rusizi Tax Centre             | Rusizi        | Claire Ingabire    | Access Bank                |                      1 |             980000.00 |            1000000.00 |            980000.00 |             45000.00 |                  200000.00 |            25000.00 |                            180000.00 |  220000000.00 |         0.44545454545454545500
 TIN100030    | Green Valley Hotel           | Company       | Uwamahoro Supplies      | Rulindo           | RAD030D      | Luxury Goods Tax                | Quarterly        | Rwamagana East Tax Centre     | Rwamagana     | Olivia Uwimana     | Development Bank of Rwanda |                      1 |             867361.43 |             905353.52 |            905353.52 |            106602.90 |                  604184.54 |            54627.18 |                            468860.03 |  899556483.20 |         0.10064443277417979900
 100000006    | Hope Traders                 | Company       | Hope Traders            | Rubavu            | RAF606F      | Rental Income Tax               | Quarterly        | Rubavu Tax Centre             | Rubavu        | Samuel Uwizeye     | NCBA Bank                  |                      1 |            1450000.00 |            1500000.00 |           1450000.00 |            120000.00 |                  450000.00 |            55000.00 |                            300000.00 |  300000000.00 |         0.48333333333333333300
 TIN100039    | Innocent Niyonzima           | Individual    | Nkubito Bakery          | Gakenke           | RAM039M      | Air Travel Tax                  | Monthly          | Muhanga East Tax Centre       | Muhanga       | Emmanuel Ndayisaba | GT Bank                    |                      1 |            1808450.62 |            1884029.03 |           1884029.03 |            119217.34 |                  426755.16 |            93360.63 |                            441200.07 |  232392584.33 |         0.81070961684588793300
 TIN100013    | Jean Claude Mugenzi          | Individual    | Keza Supplies           | Nyarugenge        | RAM013M      | Import Duty                     | Monthly          | Ngororero Tax Centre          | Ngororero     | Eric Mugabo        | I&M Bank                   |                      1 |            5602592.74 |            6074638.40 |           6074638.40 |            161447.08 |                  118354.19 |           269252.14 |                            217392.75 |  454425656.23 |         1.33677276287530355600
 TIN100063    | Jean Paul Nkurunziza         | Individual    | Musoni Group            | Nyaruguru         | RAK063K      | Water Supply Levy               | Quarterly        | Gikondo Tax Centre            | Kicukiro      | Eric Mugabo        | I&M Bank                   |                      1 |            6002971.42 |            6560028.52 |           6560028.52 |             97313.12 |                  424846.18 |           311113.75 |                            534456.09 |  606371840.44 |         1.08184913653639717200
 TIN100049    | Jeannette Mukarwego          | Individual    | Iradukunda Supplies     | Nyagatare         | RAW049W      | Natural Resources Levy          | Quarterly        | Kibungo Tax Centre            | Ngoma         | Emmanuel Ndayisaba | GT Bank                    |                      1 |            2227734.31 |            2360080.47 |           2360080.47 |            248779.98 |                  473257.44 |            91833.51 |                            510172.08 |  580333716.84 |         0.40667643487112472800
 100000001    | John Smith                   | Individual    | Uwimana Supplies        | Kigali            | RAA101A      | Value Added Tax                 | Monthly          | Kigali Tax Centre             | Nyarugenge    | John Nkurunziza    | Bank of Kigali             |                      1 |            1200000.00 |            1250000.00 |           1250000.00 |             50000.00 |                  300000.00 |            50000.00 |                            100000.00 |  500000000.00 |         0.25000000000000000000
 100000002    | Keza Ltd                     | Company       | Mukamana Boutique       | Gasabo            | RAB202B      | Pay As You Earn                 | Monthly          | Gasabo Tax Centre             | Gasabo        | Alice Uwase        | Equity Bank                |                      1 |             900000.00 |             950000.00 |            900000.00 |             75000.00 |                  250000.00 |            30000.00 |                            150000.00 |  350000000.00 |         0.25714285714285714300
 TIN100090    | Kigali Printing Services Ltd | Company       | Uwamahoro Distributors  | Ruhango           | RAL090L      | Port Handling Levy              | Quarterly        | Bugarama Tax Centre           | Rusizi        | Olivia Uwimana     | Development Bank of Rwanda |                      1 |            5050205.92 |            5131408.29 |           5131408.29 |            103777.90 |                  378852.47 |           306812.66 |                            476421.69 |  700406644.97 |         0.73263272512495791900
 TIN100038    | Kivu Fisheries Ltd           | Company       | Mahoro Logistics        | Nyabihu           | RAL038L      | Infrastructure Development Levy | Quarterly        | Nyarugenge Central Tax Centre | Nyarugenge    | Diane Mukeshimana  | BPR Bank                   |                      1 |            1471109.50 |            1568039.52 |           1568039.52 |             75287.55 |                  571219.49 |            48024.04 |                            301975.77 |  753408408.25 |         0.20812609772197880200
 TIN100056    | Modern Furniture Ltd         | Company       | Rugamba Supplies        | Bugesera          | RAD056D      | Foreign Investment Levy         | Annually         | Save Tax Centre               | Gisagara      | Samuel Uwizeye     | NCBA Bank                  |                      1 |            4180636.49 |            4258975.76 |           4258975.76 |             67589.82 |                  248625.10 |           278936.04 |                            537995.92 |  330921280.85 |         1.28700570391255936100
 TIN100084    | Modern Supermarket Ltd       | Company       | Nzeyimana Services      | Ngoma             | RAF084F      | Cold Storage Facility Tax       | Quarterly        | Kagano Tax Centre             | Nyamasheke    | Grace Mukamana     | Cogebanque                 |                      1 |            6626797.52 |            6910076.23 |           6910076.23 |            112960.72 |                  309173.87 |           501417.55 |                            444658.73 |  374815249.07 |         1.84359527717867298000
 TIN100021    | Patrick Nizeyimana           | Individual    | Uwizeye Fashion         | Karongi           | RAU021U      | Telecommunication Levy          | Monthly          | Nyanza Tax Centre             | Nyanza        | John Nkurunziza    | Bank of Kigali             |                      1 |            5763413.04 |            5967556.53 |           5967556.53 |            114504.65 |                  221384.66 |           155567.27 |                            135134.89 |  397703964.82 |         1.50050214679174844600
 TIN100026    | Prime Engineering Ltd        | Company       | Rugamba Consultants     | Ngoma             | RAZ026Z      | Agricultural Produce Tax        | Annually         | Ngoma Tax Centre              | Ngoma         | Samuel Uwizeye     | NCBA Bank                  |                      1 |             996357.91 |            1028292.63 |           1028292.63 |             59853.14 |                  118048.22 |            30359.22 |                            503541.29 |  461341982.69 |         0.22289162239348245700
 TIN100032    | Reliable Motors Ltd          | Company       | Byiringiro Ventures     | Ruhango           | RAF032F      | Motor Vehicle Tax               | Annually         | Nyamasheke Tax Centre         | Nyamasheke    | Alice Uwase        | Equity Bank                |                      1 |            4456935.45 |            4793192.31 |           4793192.31 |             73707.48 |                  874999.71 |           264676.51 |                            289036.39 |  632919158.62 |         0.75731509225458560500
 TIN100020    | Royal Furniture Ltd          | Company       | Niyonsenga Farm         | Nyagatare         | RAT020T      | Airport Service Charge          | Monthly          | Ruhango Tax Centre            | Ruhango       | Olivia Uwimana     | Development Bank of Rwanda |                      1 |            4542712.92 |            5040094.29 |           5040094.29 |             77625.06 |                  163708.63 |           300368.51 |                            165950.79 |  708762653.29 |         0.71111171936111820100
 TIN100064    | Royal Paints Ltd             | Company       | Kagabo Ventures         | Gisagara          | RAL064L      | Electricity Consumption Tax     | Monthly          | Kagarama Tax Centre           | Kicukiro      | Grace Mukamana     | Cogebanque                 |                      1 |            4594145.02 |            4875671.20 |           4875671.20 |            242907.62 |                  851916.74 |           121748.64 |                            414664.24 |  509333251.32 |         0.95726544209789880500
 TIN100048    | Rwanda Fresh Foods Ltd       | Company       | Mugisha Fashion         | Rwamagana         | RAV048V      | Industrial Development Levy     | Annually         | Kabuga Tax Centre             | Gasabo        | Diane Mukeshimana  | BPR Bank                   |                      1 |            6096329.77 |            6760440.89 |           6760440.89 |             61126.06 |                  626394.30 |           405066.38 |                            123157.73 |  430490575.74 |         1.57040392310075800600
 TIN100100    | Rwanda Premier Holdings Ltd  | Company       | Ruzindana Supplies      | Nyarugenge        | RAV100V      | Public Infrastructure Tax       | Quarterly        | Kirehe Central Tax Centre     | Kirehe        | Olivia Uwimana     | Development Bank of Rwanda |                      1 |             451446.67 |             462136.64 |            462136.64 |            213644.67 |                  439510.09 |            13960.42 |                            386765.41 |  737491970.47 |         0.06266327750056486700
 TIN100074    | Rwanda Textile Ltd           | Company       | Ndayisaba Distributors  | Rubavu            | RAV074V      | Quarry Operations Tax           | Quarterly        | Kinigi Tax Centre             | Musanze       | Grace Mukamana     | Cogebanque                 |                      1 |            7297594.31 |            8100656.54 |           8100656.54 |             33130.42 |                  298021.79 |           599647.00 |                            319885.58 |  616059498.91 |         1.31491463963019311800
 100000009    | Samuel Mugisha               | Individual    | Habimana Transport      | Rwamagana         | RAI909I      | Tourism Levy                    | Quarterly        | Rwamagana Tax Centre          | Rwamagana     | Emmanuel Ndayisaba | GT Bank                    |                      1 |             760000.00 |             800000.00 |            760000.00 |            110000.00 |                  150000.00 |            20000.00 |                            220000.00 |  180000000.00 |         0.42222222222222222200
 TIN100097    | Sandrine Uwimbabazi          | Individual    | Gasana Enterprises      | Gakenke           | RAS097S      | Financial Services Levy         | Quarterly        | Ngarama Tax Centre            | Gatsibo       | Claire Ingabire    | Access Bank                |                      1 |            3454320.60 |            3809525.47 |           3809525.47 |            102701.42 |                  336103.68 |            81963.59 |                            482330.77 |  805422419.36 |         0.47298478145506585200
 TIN100058    | Skyline Logistics Ltd        | Company       | Nsengiyumva Ventures    | Gicumbi           | RAF058F      | Import Inspection Fee           | Monthly          | Kibeho Tax Centre             | Nyaruguru     | Diane Mukeshimana  | BPR Bank                   |                      1 |            3175683.64 |            3390590.65 |           3390590.65 |            238049.62 |                  154967.98 |           140930.32 |                            192507.50 |  408522916.88 |         0.82996339003325878700
 100000010    | Smart Holdings               | Company       | Future Investments      | Nyagatare         | RAJ010J      | Environmental Tax               | Annually         | Nyagatare Tax Centre          | Nyagatare     | Olivia Uwimana     | Development Bank of Rwanda |                      1 |            3600000.00 |            3750000.00 |           3600000.00 |             70000.00 |                  500000.00 |            70000.00 |                            350000.00 |  900000000.00 |         0.40000000000000000000
 TIN100092    | Sunrise Motors Ltd           | Company       | Byiringiro Investments  | Nyaruguru         | RAN092N      | E-Commerce Tax                  | Monthly          | Karama Tax Centre             | Nyagatare     | Alice Uwase        | Equity Bank                |                      1 |            6581517.90 |            7041794.93 |           7041794.93 |             87238.47 |                  616739.71 |           209638.36 |                            397315.03 |  694389900.36 |         1.01409812071708513700
 TIN100043    | Theogene Habimana            | Individual    | Keza Boutique           | Kicukiro          | RAQ043Q      | Large Enterprise Tax            | Annually         | Kimironko Tax Centre          | Gasabo        | Eric Mugabo        | I&M Bank                   |                      1 |            1476497.96 |            1482905.48 |           1482905.48 |            230885.15 |                  755872.52 |            41067.08 |                            135411.91 |  596371645.84 |         0.24865459153600460500
 TIN100083    | Thierry Habumuremyi          | Individual    | Bizimana Logistics      | Kirehe            | RAE083E      | Postal Service Levy             | Annually         | Rwankuba Tax Centre           | Karongi       | Eric Mugabo        | I&M Bank                   |                      1 |            1105447.62 |            1135652.58 |           1135652.58 |             58744.00 |                  580871.86 |            89307.92 |                            228056.14 |  582404931.77 |         0.19499364068717834500
 TIN100066    | Topline Furniture Ltd        | Company       | Ishimwe Investments     | Rutsiro           | RAN066N      | Building Inspection Fee         | Annually         | Niboye Tax Centre             | Kicukiro      | Samuel Uwizeye     | NCBA Bank                  |                      1 |            4109623.28 |            4568036.31 |           4568036.31 |            117300.08 |                  161402.78 |           307637.01 |                            361184.32 |  647155712.94 |         0.70586355318530860800
 TIN100085    | Vestine Nyirahabimana        | Individual    | Kamikazi Farm           | Bugesera          | RAG085G      | Warehouse Operations Levy       | Quarterly        | Macuba Tax Centre             | Nyamasheke    | Patrick Habimana   | Ecobank                    |                      1 |            2024056.63 |            2216071.75 |           2216071.75 |            215187.11 |                  153007.83 |            87967.33 |                            434781.87 |  460649915.27 |         0.48107503692931266500
 TIN100015    | Vestine Umutoni              | Individual    | Habimana Technologies   | Musanze           | RAO015O      | Road Maintenance Levy           | Annually         | Burera Tax Centre             | Burera        | Patrick Habimana   | Ecobank                    |                      1 |             528835.29 |             582745.19 |            582745.19 |            106549.80 |                  786511.39 |            45456.37 |                            148371.59 |  693225506.76 |         0.08406286039930017500
 100000004    | Vision Tech Ltd              | Company       | Vision Technologies     | Kicukiro          | RAD404D      | Withholding Tax                 | Monthly          | Musanze Tax Centre            | Musanze       | Grace Mukamana     | Cogebanque                 |                      1 |            1800000.00 |            1900000.00 |           1800000.00 |             60000.00 |                  350000.00 |            45000.00 |                            200000.00 |  250000000.00 |         0.72000000000000000000
 TIN100035    | Yvette Mukandayisenga        | Individual    | Nyirahabimana Group     | Gisagara          | RAI035I      | Waste Management Levy           | Quarterly        | Huye Central Tax Centre       | Huye          | Patrick Habimana   | Ecobank                    |                      1 |            6458287.59 |            6967690.81 |           6967690.81 |             81953.14 |                  349716.65 |           332757.62 |                            469248.10 |  510410764.30 |         1.36511439361115370600
(63 rows)
