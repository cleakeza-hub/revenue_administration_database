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
6.SELECT
    tp.taxpayer_tin,
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

LEFT JOIN penalty p
    ON ta.assessment_id = p.assessment_id

RIGHT JOIN vehicle v
    ON tp.taxpayer_id = v.taxpayer_id

GROUP BY
    tp.taxpayer_tin,
    tp.taxpayer_name,
    v.plate_number,
    v.vehicle_value,
    tt.tax_type_name

HAVING
    v.vehicle_value > 10000000

ORDER BY
    v.vehicle_value DESC;
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
