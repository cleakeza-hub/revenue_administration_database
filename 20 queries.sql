1.
SELECT
    tp.taxpayer_tin,tp.taxpayer_name,tp.taxpayer_type,tt.tax_type_name,tt.filing_frequency,tc.centre_name,tc.district_name,SUM(td.declared_amount) AS total_declared_amount,SUM(ta.assessed_amount) AS total_assessed_amount,SUM(tpay.payment_amount) AS total_payment_amount
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
GROUP BY tp.taxpayer_tin,tp.taxpayer_name,tp.taxpayer_type,tt.tax_type_name,tt.filing_frequency,tc.centre_name,tc.district_name
HAVING SUM(ta.assessed_amount) > 1000000 ORDER BY total_assessed_amount DESC;
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

