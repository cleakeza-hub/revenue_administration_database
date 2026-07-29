--
-- PostgreSQL database dump
--

\restrict hQnFXWywuQMylckhU7ULsBNgsvyzYzIHecDVaJwpyCMwf3QcrhwDS2JtQIXd3Os

-- Dumped from database version 17.10
-- Dumped by pg_dump version 17.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_finding; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_finding (
    finding_id integer NOT NULL,
    audit_id integer NOT NULL,
    tax_type_id integer NOT NULL,
    finding_amount numeric(15,2) NOT NULL,
    finding_date date NOT NULL,
    CONSTRAINT audit_finding_finding_amount_check CHECK ((finding_amount >= (0)::numeric))
);


ALTER TABLE public.audit_finding OWNER TO postgres;

--
-- Name: bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank (
    bank_id integer NOT NULL,
    bank_name character varying(100) NOT NULL,
    bank_code character varying(20) NOT NULL,
    branch_name character varying(100) NOT NULL,
    registration_date date NOT NULL
);


ALTER TABLE public.bank OWNER TO postgres;

--
-- Name: bank_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_bank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bank_bank_id_seq OWNER TO postgres;

--
-- Name: bank_bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_bank_id_seq OWNED BY public.bank.bank_id;


--
-- Name: business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business (
    business_id integer NOT NULL,
    taxpayer_id integer NOT NULL,
    business_name character varying(100) NOT NULL,
    business_sector character varying(100) NOT NULL,
    opening_date date NOT NULL
);


ALTER TABLE public.business OWNER TO postgres;

--
-- Name: enforcement_case; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enforcement_case (
    enforcement_id integer NOT NULL,
    taxpayer_id integer NOT NULL,
    officer_id integer NOT NULL,
    case_open_date date NOT NULL,
    outstanding_amount numeric(15,2) NOT NULL,
    CONSTRAINT enforcement_case_outstanding_amount_check CHECK ((outstanding_amount >= (0)::numeric))
);


ALTER TABLE public.enforcement_case OWNER TO postgres;

--
-- Name: penalty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.penalty (
    penalty_id integer NOT NULL,
    assessment_id integer NOT NULL,
    penalty_type character varying(50) NOT NULL,
    penalty_amount numeric(15,2) NOT NULL,
    penalty_date date NOT NULL,
    CONSTRAINT penalty_penalty_amount_check CHECK ((penalty_amount >= (0)::numeric))
);


ALTER TABLE public.penalty OWNER TO postgres;

--
-- Name: property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property (
    property_id integer NOT NULL,
    taxpayer_id integer NOT NULL,
    property_location character varying(150) NOT NULL,
    property_value numeric(15,2) NOT NULL,
    registration_date date NOT NULL,
    CONSTRAINT property_property_value_check CHECK ((property_value >= (0)::numeric))
);


ALTER TABLE public.property OWNER TO postgres;

--
-- Name: revenue_target; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revenue_target (
    target_id integer NOT NULL,
    tax_centre_id integer NOT NULL,
    tax_type_id integer NOT NULL,
    target_year integer NOT NULL,
    target_amount numeric(15,2) NOT NULL,
    CONSTRAINT revenue_target_target_amount_check CHECK ((target_amount >= (0)::numeric)),
    CONSTRAINT revenue_target_target_year_check CHECK ((target_year >= 2020))
);


ALTER TABLE public.revenue_target OWNER TO postgres;

--
-- Name: tax_assessment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_assessment (
    assessment_id integer NOT NULL,
    declaration_id integer NOT NULL,
    officer_id integer NOT NULL,
    assessment_date date NOT NULL,
    assessed_amount numeric(15,2) NOT NULL,
    CONSTRAINT tax_assessment_assessed_amount_check CHECK ((assessed_amount >= (0)::numeric))
);


ALTER TABLE public.tax_assessment OWNER TO postgres;

--
-- Name: tax_assessment_assessment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_assessment_assessment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_assessment_assessment_id_seq OWNER TO postgres;

--
-- Name: tax_assessment_assessment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_assessment_assessment_id_seq OWNED BY public.tax_assessment.assessment_id;


--
-- Name: tax_audit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_audit (
    audit_id integer NOT NULL,
    taxpayer_id integer NOT NULL,
    officer_id integer NOT NULL,
    audit_start_date date NOT NULL,
    audit_status character varying(30) NOT NULL
);


ALTER TABLE public.tax_audit OWNER TO postgres;

--
-- Name: tax_centre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_centre (
    tax_centre_id integer NOT NULL,
    centre_name character varying(100) NOT NULL,
    district_name character varying(50) NOT NULL,
    centre_manager character varying(100) NOT NULL,
    opening_date date NOT NULL
);


ALTER TABLE public.tax_centre OWNER TO postgres;

--
-- Name: tax_centre_tax_centre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_centre_tax_centre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_centre_tax_centre_id_seq OWNER TO postgres;

--
-- Name: tax_centre_tax_centre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_centre_tax_centre_id_seq OWNED BY public.tax_centre.tax_centre_id;


--
-- Name: tax_declaration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_declaration (
    declaration_id integer NOT NULL,
    registration_id integer NOT NULL,
    tax_period_id integer NOT NULL,
    declaration_date date NOT NULL,
    declared_amount numeric(15,2) NOT NULL,
    CONSTRAINT tax_declaration_declared_amount_check CHECK ((declared_amount >= (0)::numeric))
);


ALTER TABLE public.tax_declaration OWNER TO postgres;

--
-- Name: tax_declaration_declaration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_declaration_declaration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_declaration_declaration_id_seq OWNER TO postgres;

--
-- Name: tax_declaration_declaration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_declaration_declaration_id_seq OWNED BY public.tax_declaration.declaration_id;


--
-- Name: tax_objection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_objection (
    objection_id integer NOT NULL,
    assessment_id integer NOT NULL,
    taxpayer_id integer NOT NULL,
    objection_date date NOT NULL,
    objection_status character varying(30) NOT NULL
);


ALTER TABLE public.tax_objection OWNER TO postgres;

--
-- Name: tax_officer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_officer (
    officer_id integer NOT NULL,
    tax_centre_id integer NOT NULL,
    officer_name character varying(100) NOT NULL,
    officer_position character varying(50) NOT NULL,
    employment_date date NOT NULL
);


ALTER TABLE public.tax_officer OWNER TO postgres;

--
-- Name: tax_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_payment (
    payment_id integer NOT NULL,
    assessment_id integer NOT NULL,
    bank_id integer NOT NULL,
    payment_date date NOT NULL,
    payment_amount numeric(15,2) NOT NULL,
    CONSTRAINT tax_payment_payment_amount_check CHECK ((payment_amount >= (0)::numeric))
);


ALTER TABLE public.tax_payment OWNER TO postgres;

--
-- Name: tax_payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_payment_payment_id_seq OWNER TO postgres;

--
-- Name: tax_payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_payment_payment_id_seq OWNED BY public.tax_payment.payment_id;


--
-- Name: tax_period; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_period (
    tax_period_id integer NOT NULL,
    tax_type_id integer NOT NULL,
    period_start_date date NOT NULL,
    period_end_date date NOT NULL,
    filing_due_date date NOT NULL
);


ALTER TABLE public.tax_period OWNER TO postgres;

--
-- Name: tax_period_tax_period_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_period_tax_period_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_period_tax_period_id_seq OWNER TO postgres;

--
-- Name: tax_period_tax_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_period_tax_period_id_seq OWNED BY public.tax_period.tax_period_id;


--
-- Name: tax_refund; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_refund (
    refund_id integer NOT NULL,
    taxpayer_id integer NOT NULL,
    payment_id integer NOT NULL,
    refund_amount numeric(15,2) NOT NULL,
    refund_date date NOT NULL,
    CONSTRAINT tax_refund_refund_amount_check CHECK ((refund_amount >= (0)::numeric))
);


ALTER TABLE public.tax_refund OWNER TO postgres;

--
-- Name: tax_registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_registration (
    registration_id integer NOT NULL,
    taxpayer_id integer NOT NULL,
    tax_type_id integer NOT NULL,
    tax_centre_id integer NOT NULL,
    registration_date date NOT NULL
);


ALTER TABLE public.tax_registration OWNER TO postgres;

--
-- Name: tax_registration_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_registration_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_registration_registration_id_seq OWNER TO postgres;

--
-- Name: tax_registration_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_registration_registration_id_seq OWNED BY public.tax_registration.registration_id;


--
-- Name: tax_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_type (
    tax_type_id integer NOT NULL,
    tax_type_name character varying(100) NOT NULL,
    tax_rate numeric(5,2) NOT NULL,
    filing_frequency character varying(20) NOT NULL,
    effective_date date NOT NULL,
    CONSTRAINT tax_type_filing_frequency_check CHECK (((filing_frequency)::text = ANY ((ARRAY['Monthly'::character varying, 'Quarterly'::character varying, 'Annually'::character varying])::text[]))),
    CONSTRAINT tax_type_tax_rate_check CHECK ((tax_rate >= (0)::numeric))
);


ALTER TABLE public.tax_type OWNER TO postgres;

--
-- Name: tax_type_tax_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_type_tax_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_type_tax_type_id_seq OWNER TO postgres;

--
-- Name: tax_type_tax_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_type_tax_type_id_seq OWNED BY public.tax_type.tax_type_id;


--
-- Name: taxpayer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxpayer (
    taxpayer_id integer NOT NULL,
    taxpayer_tin character varying(20) NOT NULL,
    taxpayer_name character varying(100) NOT NULL,
    taxpayer_type character varying(20) NOT NULL,
    registration_date date DEFAULT CURRENT_DATE NOT NULL,
    CONSTRAINT taxpayer_taxpayer_type_check CHECK (((taxpayer_type)::text = ANY ((ARRAY['Individual'::character varying, 'Company'::character varying])::text[])))
);


ALTER TABLE public.taxpayer OWNER TO postgres;

--
-- Name: taxpayer_taxpayer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taxpayer_taxpayer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.taxpayer_taxpayer_id_seq OWNER TO postgres;

--
-- Name: taxpayer_taxpayer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taxpayer_taxpayer_id_seq OWNED BY public.taxpayer.taxpayer_id;


--
-- Name: vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle (
    vehicle_id integer NOT NULL,
    taxpayer_id integer NOT NULL,
    plate_number character varying(20) NOT NULL,
    vehicle_value numeric(15,2) NOT NULL,
    registration_date date NOT NULL,
    CONSTRAINT vehicle_vehicle_value_check CHECK ((vehicle_value >= (0)::numeric))
);


ALTER TABLE public.vehicle OWNER TO postgres;

--
-- Name: bank bank_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank ALTER COLUMN bank_id SET DEFAULT nextval('public.bank_bank_id_seq'::regclass);


--
-- Name: tax_assessment assessment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_assessment ALTER COLUMN assessment_id SET DEFAULT nextval('public.tax_assessment_assessment_id_seq'::regclass);


--
-- Name: tax_centre tax_centre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_centre ALTER COLUMN tax_centre_id SET DEFAULT nextval('public.tax_centre_tax_centre_id_seq'::regclass);


--
-- Name: tax_declaration declaration_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_declaration ALTER COLUMN declaration_id SET DEFAULT nextval('public.tax_declaration_declaration_id_seq'::regclass);


--
-- Name: tax_payment payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_payment ALTER COLUMN payment_id SET DEFAULT nextval('public.tax_payment_payment_id_seq'::regclass);


--
-- Name: tax_period tax_period_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_period ALTER COLUMN tax_period_id SET DEFAULT nextval('public.tax_period_tax_period_id_seq'::regclass);


--
-- Name: tax_registration registration_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_registration ALTER COLUMN registration_id SET DEFAULT nextval('public.tax_registration_registration_id_seq'::regclass);


--
-- Name: tax_type tax_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_type ALTER COLUMN tax_type_id SET DEFAULT nextval('public.tax_type_tax_type_id_seq'::regclass);


--
-- Name: taxpayer taxpayer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxpayer ALTER COLUMN taxpayer_id SET DEFAULT nextval('public.taxpayer_taxpayer_id_seq'::regclass);


--
-- Data for Name: audit_finding; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_finding (finding_id, audit_id, tax_type_id, finding_amount, finding_date) FROM stdin;
1	1	1	300000.00	2024-03-20
2	2	2	250000.00	2024-03-25
3	3	3	900000.00	2025-04-15
4	4	4	350000.00	2024-03-28
5	5	5	400000.00	2025-02-20
6	6	6	450000.00	2024-05-15
7	7	7	200000.00	2024-03-30
8	8	8	800000.00	2025-04-20
9	9	9	150000.00	2024-05-20
10	10	10	500000.00	2025-02-28
11	11	11	455037.51	2024-04-09
12	12	12	169597.44	2024-07-20
13	13	13	118354.19	2024-08-23
14	14	14	109380.91	2024-05-24
15	15	15	786511.39	2024-07-22
16	16	16	827106.97	2024-11-22
17	17	17	864258.73	2024-08-02
18	18	18	214759.49	2024-04-17
19	19	19	279358.75	2024-05-21
20	20	20	163708.63	2024-11-29
21	21	21	221384.66	2025-07-08
22	22	22	884514.51	2025-05-10
23	23	23	372566.87	2024-06-25
24	24	24	758829.05	2024-04-22
25	25	25	179691.42	2025-03-15
26	26	26	118048.22	2024-10-12
27	27	27	369440.92	2025-05-07
28	28	28	694305.41	2024-12-12
29	29	29	661608.59	2024-11-21
30	30	30	604184.54	2025-11-15
31	31	31	518778.21	2025-09-25
32	32	32	874999.71	2024-05-25
33	33	33	232560.88	2025-04-01
34	34	34	312220.41	2024-10-06
35	35	35	349716.65	2025-04-27
36	36	36	427386.66	2024-07-03
37	37	37	221918.37	2025-09-29
38	38	38	571219.49	2024-11-18
39	39	39	426755.16	2025-07-01
40	40	40	620583.80	2025-04-23
41	41	41	630614.99	2025-02-13
42	42	42	659559.73	2024-11-24
43	43	43	755872.52	2024-05-25
44	44	44	355718.56	2025-03-10
45	45	45	108532.31	2025-02-27
46	46	46	142297.50	2025-05-07
47	47	47	102506.39	2025-02-03
48	48	48	626394.30	2024-07-09
49	49	49	473257.44	2024-10-06
50	50	50	330102.41	2025-10-11
51	51	51	648224.07	2025-01-22
52	52	52	910308.46	2024-10-07
53	53	53	519719.80	2024-04-23
54	54	54	943345.06	2025-04-07
55	55	55	817661.41	2024-07-02
56	56	56	248625.10	2025-04-29
57	57	57	767314.53	2025-01-30
58	58	58	154967.98	2024-10-03
59	59	59	931318.87	2025-06-27
60	60	60	170300.57	2025-02-25
61	61	61	827677.99	2025-05-25
62	62	62	652221.13	2025-10-31
63	63	63	424846.18	2024-07-26
64	64	64	851916.74	2024-07-15
65	65	65	703379.51	2024-07-21
66	66	66	161402.78	2024-10-03
67	67	67	298945.31	2024-09-19
68	68	68	472221.59	2024-09-05
69	69	69	790989.45	2024-05-22
70	70	70	884030.63	2025-09-11
71	71	71	701891.72	2025-04-30
72	72	72	601895.65	2025-08-21
73	73	73	653869.76	2024-05-17
74	74	74	298021.79	2025-07-24
75	75	75	861024.08	2025-08-16
76	76	76	141845.47	2024-11-29
77	77	77	584642.34	2025-07-28
78	78	78	791428.21	2024-11-27
79	79	79	782636.27	2024-07-16
80	80	80	604638.02	2025-11-21
81	81	81	945850.21	2025-07-05
82	82	82	732325.06	2024-05-25
83	83	83	580871.86	2024-08-09
84	84	84	309173.87	2024-05-25
85	85	85	153007.83	2024-11-01
86	86	86	910587.38	2025-02-02
87	87	87	169468.07	2024-10-02
88	88	88	225618.54	2025-07-24
89	89	89	287164.64	2025-09-07
90	90	90	378852.47	2025-09-03
91	91	91	669717.81	2024-11-06
92	92	92	616739.71	2024-10-22
93	93	93	818575.30	2025-07-02
94	94	94	667144.43	2025-08-05
95	95	95	937103.56	2024-08-09
96	96	96	928460.44	2024-07-15
97	97	97	336103.68	2025-03-20
98	98	98	632958.95	2024-10-28
99	99	99	630081.62	2025-04-12
100	100	100	439510.09	2024-09-18
\.


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank (bank_id, bank_name, bank_code, branch_name, registration_date) FROM stdin;
1	Bank of Kigali	BK001	Kigali Main	2018-01-01
2	Equity Bank	EQ002	Kigali	2018-01-02
3	I&M Bank	IM003	Kicukiro	2018-01-03
4	Cogebanque	CG004	Gasabo	2018-01-04
5	Ecobank	EC005	Huye	2018-01-05
6	NCBA Bank	NC006	Rubavu	2018-01-06
7	Access Bank	AC007	Muhanga	2018-01-07
8	BPR Bank	BP008	Musanze	2018-01-08
9	GT Bank	GT009	Rwamagana	2018-01-09
10	Development Bank of Rwanda	BR010	Head Office	2018-01-10
11	Bank of Kigali	BK011	Nyarugenge	2018-01-11
12	Equity Bank	EQ011	Kicukiro	2018-01-12
13	I&M Bank	IM011	Gasabo	2018-01-13
14	Cogebanque	CG011	Huye	2018-01-14
15	Ecobank	EC011	Rubavu	2018-01-15
16	NCBA Bank	NC011	Musanze	2018-01-16
17	Access Bank	AC011	Muhanga	2018-01-17
18	BPR Bank	BP011	Rwamagana	2018-01-18
19	GT Bank	GT011	Nyagatare	2018-01-19
20	Development Bank of Rwanda	BR011	Karongi	2018-01-20
21	Bank of Kigali	BK012	Rusizi	2018-01-21
22	Equity Bank	EQ012	Nyanza	2018-01-22
23	I&M Bank	IM012	Kayonza	2018-01-23
24	Cogebanque	CG012	Kirehe	2018-01-24
25	Ecobank	EC012	Ngoma	2018-01-25
26	NCBA Bank	NC012	Bugesera	2018-01-26
27	Access Bank	AC012	Gatsibo	2018-01-27
28	BPR Bank	BP012	Gicumbi	2018-01-28
29	GT Bank	GT012	Rulindo	2018-01-29
30	Development Bank of Rwanda	BR012	Burera	2018-01-30
31	Bank of Kigali	BK013	Ruhango	2018-01-31
32	Equity Bank	EQ013	Nyamagabe	2018-02-01
33	I&M Bank	IM013	Nyaruguru	2018-02-02
34	Cogebanque	CG013	Gisagara	2018-02-03
35	Ecobank	EC013	Ngororero	2018-02-04
36	NCBA Bank	NC013	Rutsiro	2018-02-05
37	Access Bank	AC013	Nyabihu	2018-02-06
38	BPR Bank	BP013	Gakenke	2018-02-07
39	GT Bank	GT013	Nyarugenge	2018-02-08
40	Development Bank of Rwanda	BR013	Kicukiro	2018-02-09
41	Bank of Kigali	BK014	Gasabo	2018-02-10
42	Equity Bank	EQ014	Huye	2018-02-11
43	I&M Bank	IM014	Rubavu	2018-02-12
44	Cogebanque	CG014	Musanze	2018-02-13
45	Ecobank	EC014	Muhanga	2018-02-14
46	NCBA Bank	NC014	Rwamagana	2018-02-15
47	Access Bank	AC014	Nyagatare	2018-02-16
48	BPR Bank	BP014	Karongi	2018-02-17
49	GT Bank	GT014	Rusizi	2018-02-18
50	Development Bank of Rwanda	BR014	Nyanza	2018-02-19
51	Bank of Kigali	BK015	Kayonza	2018-02-20
52	Equity Bank	EQ015	Kirehe	2018-02-21
53	I&M Bank	IM015	Ngoma	2018-02-22
54	Cogebanque	CG015	Bugesera	2018-02-23
55	Ecobank	EC015	Gatsibo	2018-02-24
56	NCBA Bank	NC015	Gicumbi	2018-02-25
57	Access Bank	AC015	Rulindo	2018-02-26
58	BPR Bank	BP015	Burera	2018-02-27
59	GT Bank	GT015	Ruhango	2018-02-28
60	Development Bank of Rwanda	BR015	Nyamagabe	2018-03-01
61	Bank of Kigali	BK016	Nyaruguru	2018-03-02
62	Equity Bank	EQ016	Gisagara	2018-03-03
63	I&M Bank	IM016	Ngororero	2018-03-04
64	Cogebanque	CG016	Rutsiro	2018-03-05
65	Ecobank	EC016	Nyabihu	2018-03-06
66	NCBA Bank	NC016	Gakenke	2018-03-07
67	Access Bank	AC016	Nyarugenge	2018-03-08
68	BPR Bank	BP016	Kicukiro	2018-03-09
69	GT Bank	GT016	Gasabo	2018-03-10
70	Development Bank of Rwanda	BR016	Huye	2018-03-11
71	Bank of Kigali	BK017	Rubavu	2018-03-12
72	Equity Bank	EQ017	Musanze	2018-03-13
73	I&M Bank	IM017	Muhanga	2018-03-14
74	Cogebanque	CG017	Rwamagana	2018-03-15
75	Ecobank	EC017	Nyagatare	2018-03-16
76	NCBA Bank	NC017	Karongi	2018-03-17
77	Access Bank	AC017	Rusizi	2018-03-18
78	BPR Bank	BP017	Nyanza	2018-03-19
79	GT Bank	GT017	Kayonza	2018-03-20
80	Development Bank of Rwanda	BR017	Kirehe	2018-03-21
81	Bank of Kigali	BK018	Ngoma	2018-03-22
82	Equity Bank	EQ018	Bugesera	2018-03-23
83	I&M Bank	IM018	Gatsibo	2018-03-24
84	Cogebanque	CG018	Gicumbi	2018-03-25
85	Ecobank	EC018	Rulindo	2018-03-26
86	NCBA Bank	NC018	Burera	2018-03-27
87	Access Bank	AC018	Ruhango	2018-03-28
88	BPR Bank	BP018	Nyamagabe	2018-03-29
89	GT Bank	GT018	Nyaruguru	2018-03-30
90	Development Bank of Rwanda	BR018	Gisagara	2018-03-31
91	Bank of Kigali	BK019	Ngororero	2018-04-01
92	Equity Bank	EQ019	Rutsiro	2018-04-02
93	I&M Bank	IM019	Nyabihu	2018-04-03
94	Cogebanque	CG019	Gakenke	2018-04-04
95	Ecobank	EC019	Nyarugenge	2018-04-05
96	NCBA Bank	NC019	Kicukiro	2018-04-06
97	Access Bank	AC019	Gasabo	2018-04-07
98	BPR Bank	BP019	Huye	2018-04-08
99	GT Bank	GT019	Rubavu	2018-04-09
100	Development Bank of Rwanda	BR019	Musanze	2018-04-10
\.


--
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business (business_id, taxpayer_id, business_name, business_sector, opening_date) FROM stdin;
1	1	Uwimana Supplies	Wholesale	2020-01-01
2	2	Mukamana Boutique	Retail	2020-02-01
3	3	Keza Holdings	Construction	2019-05-10
4	4	Vision Technologies	ICT	2021-03-15
5	5	Ndayisaba Farm	Agriculture	2018-08-20
6	6	Hope Traders	Import & Export	2022-01-12
7	7	Uwase Fashion	Clothing	2021-11-05
8	8	Smart Construction	Engineering	2019-09-18
9	9	Habimana Transport	Transport	2020-06-30
10	10	Future Investments	Finance	2018-12-01
11	11	Uwimana Ventures	Clothing	2018-09-25
12	12	Mukamana Traders	Wholesale	2020-11-27
13	13	Keza Supplies	Manufacturing	2022-09-10
14	14	Ndayisaba Distributors	Agriculture	2017-07-06
15	15	Habimana Technologies	Agriculture	2021-09-30
16	16	Uwase Traders	Education	2019-08-08
17	17	Nkurunziza Enterprises	Healthcare	2016-07-25
18	18	Mugisha Investments	Import & Export	2016-05-05
19	19	Iradukunda Distributors	Manufacturing	2015-09-05
20	20	Niyonsenga Farm	Engineering	2019-12-21
21	21	Uwizeye Fashion	Engineering	2016-12-24
22	22	Mutesi Supplies	Engineering	2022-04-06
23	23	Bizimana Services	Education	2023-10-16
24	24	Nzeyimana Services	Wholesale	2020-07-31
25	25	Kamikazi Ventures	Mining	2019-04-27
26	26	Rugamba Consultants	Mining	2015-10-05
27	27	Twagirayezu Consultants	Agriculture	2019-04-16
28	28	Nsengiyumva Supplies	Agriculture	2016-06-01
29	29	Munyaneza Logistics	Finance	2023-01-19
30	30	Uwamahoro Supplies	Agriculture	2016-03-01
31	31	Ntawukuriryayo Motors	Mining	2015-12-16
32	32	Byiringiro Ventures	Finance	2018-10-14
33	33	Musoni Fashion	Healthcare	2019-02-05
34	34	Kagabo Services	Wholesale	2020-03-18
35	35	Nyirahabimana Group	Manufacturing	2021-10-07
36	36	Ishimwe Pharmacy	Real Estate	2016-10-10
37	37	Gasana Group	Finance	2022-09-15
38	38	Mahoro Logistics	Mining	2023-06-21
39	39	Nkubito Bakery	Manufacturing	2019-08-17
40	40	Ruzindana Consultants	Retail	2022-01-23
41	41	Uwimana Investments	Healthcare	2023-12-19
42	42	Mukamana Construction	Healthcare	2018-12-08
43	43	Keza Boutique	Retail	2018-08-12
44	44	Ndayisaba Construction	Mining	2020-01-17
45	45	Habimana Investments	Construction	2021-03-23
46	46	Uwase Boutique	Finance	2016-08-01
47	47	Nkurunziza Boutique	Hospitality	2021-04-09
48	48	Mugisha Fashion	Engineering	2023-05-21
49	49	Iradukunda Supplies	Healthcare	2020-04-18
50	50	Niyonsenga Farm	Real Estate	2015-07-07
51	51	Uwizeye Services	Agriculture	2023-04-29
52	52	Mutesi Consultants	Finance	2022-08-10
53	53	Bizimana Pharmacy	Finance	2016-01-04
54	54	Nzeyimana Investments	Mining	2021-04-24
55	55	Kamikazi Distributors	Clothing	2018-01-03
56	56	Rugamba Supplies	Retail	2018-08-28
57	57	Twagirayezu Traders	Clothing	2022-09-25
58	58	Nsengiyumva Ventures	Import & Export	2020-04-30
59	59	Munyaneza Services	Real Estate	2021-06-18
60	60	Uwamahoro Ventures	Engineering	2022-09-08
61	61	Ntawukuriryayo Boutique	Finance	2019-02-07
62	62	Byiringiro Enterprises	Real Estate	2019-01-15
63	63	Musoni Group	Education	2019-05-27
64	64	Kagabo Ventures	Tourism	2018-09-27
65	65	Nyirahabimana Pharmacy	Real Estate	2016-10-13
66	66	Ishimwe Investments	Clothing	2019-03-08
67	67	Gasana Traders	Finance	2020-07-24
68	68	Mahoro Enterprises	Healthcare	2020-10-28
69	69	Nkubito Bakery	Healthcare	2017-04-21
70	70	Ruzindana Supplies	Manufacturing	2016-06-07
71	71	Uwimana Supplies	Import & Export	2016-01-24
72	72	Mukamana Distributors	Real Estate	2022-08-03
73	73	Keza Investments	Clothing	2018-08-10
74	74	Ndayisaba Distributors	Agriculture	2020-05-12
75	75	Habimana Construction	Clothing	2023-08-14
76	76	Uwase Traders	Finance	2016-11-02
77	77	Nkurunziza Enterprises	Mining	2015-07-14
78	78	Mugisha Technologies	Finance	2016-11-30
79	79	Iradukunda Holdings	Engineering	2018-10-13
80	80	Niyonsenga Bakery	Tourism	2021-12-11
81	81	Uwizeye Logistics	Transport	2018-05-20
82	82	Mutesi Fashion	Real Estate	2019-05-02
83	83	Bizimana Logistics	Wholesale	2018-06-23
84	84	Nzeyimana Services	Engineering	2023-09-04
85	85	Kamikazi Farm	Construction	2019-06-06
86	86	Rugamba Boutique	Construction	2023-08-12
87	87	Twagirayezu Farm	Manufacturing	2015-08-02
88	88	Nsengiyumva Fashion	Mining	2023-11-09
89	89	Munyaneza Enterprises	Healthcare	2020-01-19
90	90	Uwamahoro Distributors	Healthcare	2016-05-10
91	91	Ntawukuriryayo Construction	ICT	2019-08-27
92	92	Byiringiro Investments	Engineering	2018-04-21
93	93	Musoni Ventures	Finance	2018-03-01
94	94	Kagabo Enterprises	ICT	2016-12-31
95	95	Nyirahabimana Group	Mining	2020-02-29
96	96	Ishimwe Pharmacy	Clothing	2021-09-29
97	97	Gasana Enterprises	Finance	2015-12-16
98	98	Mahoro Group	Clothing	2020-12-15
99	99	Nkubito Pharmacy	Import & Export	2019-07-08
100	100	Ruzindana Supplies	Real Estate	2017-09-11
\.


--
-- Data for Name: enforcement_case; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enforcement_case (enforcement_id, taxpayer_id, officer_id, case_open_date, outstanding_amount) FROM stdin;
1	1	1	2024-04-01	100000.00
2	2	2	2024-04-05	150000.00
3	3	3	2025-05-01	500000.00
4	4	4	2024-04-10	200000.00
5	5	5	2025-03-01	250000.00
6	6	6	2024-06-01	300000.00
7	7	7	2024-04-15	180000.00
8	8	8	2025-05-10	450000.00
9	9	9	2024-06-10	220000.00
10	10	10	2025-03-10	350000.00
11	11	1	2024-12-15	233175.89
12	12	2	2024-12-03	170771.18
13	13	3	2024-07-27	217392.75
14	14	4	2025-10-24	549858.36
15	15	5	2024-11-30	148371.59
16	16	6	2025-08-26	81140.29
17	17	7	2025-01-12	93325.09
18	18	8	2025-08-23	161159.53
19	19	9	2024-10-13	318438.00
20	20	10	2025-05-03	165950.79
21	21	1	2025-02-24	135134.89
22	22	2	2025-10-17	445998.01
23	23	3	2025-09-29	300742.19
24	24	4	2024-11-18	170093.33
25	25	5	2024-06-22	477334.88
26	26	6	2025-10-26	503541.29
27	27	7	2025-10-04	115860.44
28	28	8	2024-11-04	429272.79
29	29	9	2024-06-29	124614.34
30	30	10	2025-07-17	468860.03
31	31	1	2025-10-03	537425.52
32	32	2	2025-01-04	289036.39
33	33	3	2025-10-18	538336.38
34	34	4	2025-03-26	520320.83
35	35	5	2024-05-28	469248.10
36	36	6	2025-05-19	432997.35
37	37	7	2025-09-26	196468.47
38	38	8	2025-11-08	301975.77
39	39	9	2024-08-20	441200.07
40	40	10	2025-04-29	86012.46
41	41	1	2024-05-06	104549.29
42	42	2	2024-05-11	430543.29
43	43	3	2025-06-18	135411.91
44	44	4	2025-08-30	505405.65
45	45	5	2025-08-14	106299.37
46	46	6	2025-07-27	466620.34
47	47	7	2024-07-07	149282.60
48	48	8	2025-09-26	123157.73
49	49	9	2025-08-11	510172.08
50	50	10	2025-05-31	350524.19
51	51	1	2024-06-03	453234.17
52	52	2	2024-08-28	437495.42
53	53	3	2024-04-28	409469.87
54	54	4	2024-12-02	121438.32
55	55	5	2025-07-22	133324.14
56	56	6	2025-05-05	537995.92
57	57	7	2024-07-15	495366.29
58	58	8	2024-08-17	192507.50
59	59	9	2024-11-01	442806.33
60	60	10	2024-06-28	155916.24
61	61	1	2024-08-31	91794.41
62	62	2	2024-11-25	395096.67
63	63	3	2025-04-24	534456.09
64	64	4	2025-11-12	414664.24
65	65	5	2025-06-02	310074.58
66	66	6	2024-12-31	361184.32
67	67	7	2024-07-15	301585.49
68	68	8	2025-05-30	218670.10
69	69	9	2025-01-08	215188.00
70	70	10	2024-10-11	88601.72
71	71	1	2025-08-12	113252.57
72	72	2	2024-04-20	425506.50
73	73	3	2024-04-10	122272.19
74	74	4	2024-07-21	319885.58
75	75	5	2024-06-25	446154.55
76	76	6	2024-09-17	130988.80
77	77	7	2025-04-29	213385.66
78	78	8	2025-08-14	330288.68
79	79	9	2025-05-17	171177.31
80	80	10	2025-06-13	477359.15
81	81	1	2025-01-16	486222.24
82	82	2	2024-06-28	483263.33
83	83	3	2025-02-26	228056.14
84	84	4	2024-10-16	444658.73
85	85	5	2025-04-13	434781.87
86	86	6	2025-08-03	542960.21
87	87	7	2025-09-20	265122.94
88	88	8	2025-09-30	268193.54
89	89	9	2024-12-18	257909.29
90	90	10	2025-10-28	476421.69
91	91	1	2025-02-11	514703.73
92	92	2	2025-01-06	397315.03
93	93	3	2024-08-27	144655.70
94	94	4	2024-05-21	179694.06
95	95	5	2025-10-27	364406.35
96	96	6	2025-11-15	106771.87
97	97	7	2024-04-23	482330.77
98	98	8	2025-11-22	136350.82
99	99	9	2024-08-09	207341.03
100	100	10	2024-09-12	386765.41
\.


--
-- Data for Name: penalty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penalty (penalty_id, assessment_id, penalty_type, penalty_amount, penalty_date) FROM stdin;
1	1	Late Filing	50000.00	2024-02-25
2	2	Late Payment	75000.00	2024-02-26
3	3	Under Declaration	200000.00	2025-03-31
4	4	Late Filing	60000.00	2024-02-27
5	5	Late Payment	80000.00	2025-02-01
6	6	Under Declaration	120000.00	2024-04-25
7	7	Late Filing	45000.00	2024-03-01
8	8	Late Payment	95000.00	2025-04-05
9	9	Under Declaration	110000.00	2024-04-28
10	10	Late Filing	70000.00	2025-02-02
11	11	Late Filing	39896.97	2024-06-29
12	12	Late Payment	79262.11	2024-12-07
13	13	Under Declaration	161447.08	2024-07-15
14	14	Late Filing	89383.27	2025-09-08
15	15	Late Payment	106549.80	2025-05-05
16	16	Under Declaration	111208.82	2024-06-05
17	17	Late Filing	44163.38	2025-07-27
18	18	Late Payment	50988.49	2025-09-28
19	19	Under Declaration	152792.49	2025-09-08
20	20	Late Filing	77625.06	2025-05-28
21	21	Late Payment	114504.65	2024-03-08
22	22	Under Declaration	87197.02	2024-08-18
23	23	Late Filing	76242.09	2025-02-11
24	24	Late Payment	93112.31	2024-09-29
25	25	Under Declaration	242650.18	2025-02-08
26	26	Late Filing	59853.14	2025-03-20
27	27	Late Payment	95417.13	2025-02-13
28	28	Under Declaration	83948.11	2024-04-18
29	29	Late Filing	79050.57	2025-08-31
30	30	Late Payment	106602.90	2025-03-13
31	31	Under Declaration	157031.69	2024-12-31
32	32	Late Filing	73707.48	2025-03-08
33	33	Late Payment	83929.25	2024-05-10
34	34	Under Declaration	193068.38	2024-10-24
35	35	Late Filing	81953.14	2024-05-17
36	36	Late Payment	55223.63	2024-06-08
37	37	Under Declaration	115455.58	2025-06-12
38	38	Late Filing	75287.55	2025-03-13
39	39	Late Payment	119217.34	2025-02-22
40	40	Under Declaration	100821.24	2024-11-27
41	41	Late Filing	63536.56	2024-05-15
42	42	Late Payment	64075.56	2024-08-20
43	43	Under Declaration	230885.15	2024-11-09
44	44	Late Filing	47519.24	2025-03-22
45	45	Late Payment	85100.74	2025-09-22
46	46	Under Declaration	249123.26	2025-01-28
47	47	Late Filing	45942.28	2024-04-25
48	48	Late Payment	61126.06	2024-04-04
49	49	Under Declaration	248779.98	2025-04-19
50	50	Late Filing	30169.92	2024-09-25
51	51	Late Payment	88530.16	2025-10-07
52	52	Under Declaration	168769.38	2025-01-23
53	53	Late Filing	66534.08	2025-07-29
54	54	Late Payment	118599.66	2025-06-09
55	55	Under Declaration	110715.15	2024-07-20
56	56	Late Filing	67589.82	2025-09-22
57	57	Late Payment	74262.94	2025-10-22
58	58	Under Declaration	238049.62	2025-10-14
59	59	Late Filing	36196.39	2024-10-08
60	60	Late Payment	114619.08	2024-07-19
61	61	Under Declaration	212093.16	2024-06-04
62	62	Late Filing	39593.10	2024-06-15
63	63	Late Payment	97313.12	2024-08-17
64	64	Under Declaration	242907.62	2025-05-07
65	65	Late Filing	85067.03	2025-03-27
66	66	Late Payment	117300.08	2025-06-28
67	67	Under Declaration	82424.67	2025-09-15
68	68	Late Filing	59454.71	2024-03-10
69	69	Late Payment	96685.53	2024-06-22
70	70	Under Declaration	107589.74	2025-08-25
71	71	Late Filing	56354.00	2025-02-08
72	72	Late Payment	104174.16	2025-05-25
73	73	Under Declaration	89763.26	2024-03-03
74	74	Late Filing	33130.42	2024-11-27
75	75	Late Payment	96089.84	2024-08-20
76	76	Under Declaration	151323.73	2024-06-17
77	77	Late Filing	53671.52	2025-01-01
78	78	Late Payment	95180.48	2025-08-01
79	79	Under Declaration	247186.00	2024-08-05
80	80	Late Filing	73708.29	2024-08-06
81	81	Late Payment	67655.04	2025-08-27
82	82	Under Declaration	169356.73	2025-11-05
83	83	Late Filing	58744.00	2024-03-15
84	84	Late Payment	112960.72	2025-03-07
85	85	Under Declaration	215187.11	2025-01-05
86	86	Late Filing	66081.35	2024-11-04
87	87	Late Payment	83912.10	2024-05-21
88	88	Under Declaration	132356.14	2025-07-14
89	89	Late Filing	65304.75	2025-08-21
90	90	Late Payment	103777.90	2024-07-07
91	91	Under Declaration	145002.20	2025-09-10
92	92	Late Filing	87238.47	2025-08-14
93	93	Late Payment	68509.47	2025-05-07
94	94	Under Declaration	189456.01	2025-09-05
95	95	Late Filing	55265.98	2024-09-25
96	96	Late Payment	78392.44	2025-04-13
97	97	Under Declaration	102701.42	2025-03-17
98	98	Late Filing	53817.65	2025-08-12
99	99	Late Payment	51772.19	2024-11-07
100	100	Under Declaration	213644.67	2025-02-05
\.


--
-- Data for Name: property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property (property_id, taxpayer_id, property_location, property_value, registration_date) FROM stdin;
1	1	Kigali	85000000.00	2021-01-10
2	2	Gasabo	65000000.00	2021-02-15
3	3	Nyarugenge	120000000.00	2020-05-20
4	4	Kicukiro	95000000.00	2022-01-18
5	5	Musanze	40000000.00	2020-09-25
6	6	Rubavu	70000000.00	2021-06-12
7	7	Huye	55000000.00	2022-02-22
8	8	Muhanga	110000000.00	2019-11-11
9	9	Rwamagana	60000000.00	2021-08-30
10	10	Nyagatare	130000000.00	2020-10-05
11	11	Kigali	74437588.24	2020-03-30
12	12	Gasabo	95938301.08	2020-08-01
13	13	Nyarugenge	57327445.04	2018-12-21
14	14	Kicukiro	57626610.92	2022-04-19
15	15	Musanze	88389386.42	2019-01-03
16	16	Rubavu	133221454.16	2023-06-28
17	17	Huye	51941493.65	2020-06-06
18	18	Muhanga	117187541.34	2022-03-12
19	19	Rwamagana	120455796.07	2020-05-20
20	20	Nyagatare	46750418.77	2020-01-04
21	21	Karongi	123496391.27	2021-10-19
22	22	Rusizi	39126205.85	2023-12-06
23	23	Nyanza	104511527.23	2018-12-26
24	24	Kayonza	81594295.24	2022-07-08
25	25	Kirehe	34691661.59	2018-02-01
26	26	Ngoma	76772659.14	2022-01-24
27	27	Bugesera	138852696.59	2023-12-29
28	28	Gatsibo	38889807.17	2023-10-26
29	29	Gicumbi	129026648.94	2023-03-11
30	30	Rulindo	137438307.30	2022-01-04
31	31	Burera	44205369.53	2019-10-21
32	32	Ruhango	112225913.91	2022-12-15
33	33	Nyamagabe	95495927.35	2019-12-29
34	34	Nyaruguru	133830165.46	2019-12-22
35	35	Gisagara	34076838.58	2018-04-06
36	36	Ngororero	48830594.81	2022-09-13
37	37	Rutsiro	38927616.50	2022-10-09
38	38	Nyabihu	99521616.99	2019-08-09
39	39	Gakenke	64078761.77	2018-01-24
40	40	Kigali	71916766.29	2019-07-11
41	41	Gasabo	87574229.13	2020-04-02
42	42	Nyarugenge	128996716.49	2018-08-15
43	43	Kicukiro	100447703.77	2022-12-20
44	44	Musanze	58333423.14	2022-07-14
45	45	Rubavu	120764719.50	2019-06-02
46	46	Huye	68918937.40	2023-05-05
47	47	Muhanga	131441933.04	2019-06-21
48	48	Rwamagana	111240949.00	2019-09-09
49	49	Nyagatare	96883802.22	2022-07-31
50	50	Karongi	43680364.20	2019-05-02
51	51	Rusizi	45802865.12	2019-12-15
52	52	Nyanza	139023373.42	2022-08-06
53	53	Kayonza	46006259.26	2020-04-30
54	54	Kirehe	126847375.64	2021-07-31
55	55	Ngoma	114762386.79	2020-08-16
56	56	Bugesera	123073796.02	2019-04-26
57	57	Gatsibo	124365270.96	2022-01-21
58	58	Gicumbi	50454713.22	2018-10-24
59	59	Rulindo	85135612.65	2018-02-15
60	60	Burera	94426179.24	2018-07-15
61	61	Ruhango	67117844.40	2022-03-25
62	62	Nyamagabe	73901091.87	2022-06-24
63	63	Nyaruguru	72453397.93	2022-02-28
64	64	Gisagara	88780467.88	2020-01-13
65	65	Ngororero	126752519.71	2022-03-08
66	66	Rutsiro	109382601.86	2022-06-21
67	67	Nyabihu	114790378.13	2020-07-31
68	68	Gakenke	64256063.95	2020-07-14
69	69	Kigali	101870001.55	2021-06-26
70	70	Gasabo	41632359.15	2021-07-09
71	71	Nyarugenge	54046435.54	2020-10-19
72	72	Kicukiro	72191002.98	2022-11-30
73	73	Musanze	112665687.91	2018-11-25
74	74	Rubavu	127077464.00	2022-09-21
75	75	Huye	136018731.59	2020-11-15
76	76	Muhanga	37664430.55	2021-04-15
77	77	Rwamagana	129792621.92	2021-08-06
78	78	Nyagatare	116702457.54	2023-12-25
79	79	Karongi	44000846.31	2020-11-17
80	80	Rusizi	77401412.70	2021-04-06
81	81	Nyanza	75026570.76	2019-10-15
82	82	Kayonza	61051994.20	2022-12-08
83	83	Kirehe	51391909.66	2021-10-11
84	84	Ngoma	127622893.39	2021-11-15
85	85	Bugesera	30474245.28	2021-12-26
86	86	Gatsibo	106377123.84	2020-03-02
87	87	Gicumbi	128046185.40	2019-12-05
88	88	Rulindo	116844178.29	2020-12-04
89	89	Burera	102288324.73	2020-08-05
90	90	Ruhango	74907043.01	2021-11-16
91	91	Nyamagabe	102221195.88	2018-01-15
92	92	Nyaruguru	42356536.95	2023-12-19
93	93	Gisagara	52274768.95	2023-11-09
94	94	Ngororero	64158826.88	2019-11-17
95	95	Rutsiro	86222755.51	2022-12-25
96	96	Nyabihu	132640075.70	2020-12-16
97	97	Gakenke	112343462.36	2022-09-04
98	98	Kigali	81482692.97	2023-12-16
99	99	Gasabo	98857437.14	2021-03-23
100	100	Nyarugenge	52031306.63	2018-03-26
\.


--
-- Data for Name: revenue_target; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.revenue_target (target_id, tax_centre_id, tax_type_id, target_year, target_amount) FROM stdin;
1	1	1	2025	500000000.00
2	2	2	2025	350000000.00
3	3	3	2025	800000000.00
4	4	4	2025	250000000.00
5	5	5	2025	150000000.00
6	6	6	2025	300000000.00
7	7	7	2025	220000000.00
8	8	8	2025	750000000.00
9	9	9	2025	180000000.00
10	10	10	2025	900000000.00
11	11	11	2026	906412799.89
12	12	12	2022	519831759.22
13	13	13	2023	454425656.23
14	14	14	2026	244185002.41
15	15	15	2021	693225506.76
16	16	16	2024	295248812.85
17	17	17	2025	493551211.83
18	18	18	2026	426004714.57
19	19	19	2022	421420561.43
20	20	20	2026	708762653.29
21	21	21	2026	397703964.82
22	22	22	2026	128153178.96
23	23	23	2025	746348437.51
24	24	24	2021	856163880.48
25	25	25	2023	446327368.95
26	26	26	2026	461341982.69
27	27	27	2024	191623047.73
28	28	28	2020	388006042.62
29	29	29	2021	389638129.64
30	30	30	2024	899556483.20
31	31	31	2020	696296847.75
32	32	32	2023	632919158.62
33	33	33	2025	855204105.07
34	34	34	2025	355743742.57
35	35	35	2023	510410764.30
36	36	36	2023	897421637.76
37	37	37	2024	191390559.79
38	38	38	2025	753408408.25
39	39	39	2024	232392584.33
40	40	40	2026	110399663.03
41	41	41	2023	922837833.00
42	42	42	2026	844921492.69
43	43	43	2024	596371645.84
44	44	44	2020	411972377.74
45	45	45	2021	476946560.56
46	46	46	2021	867679570.25
47	47	47	2021	593745820.97
48	48	48	2024	430490575.74
49	49	49	2025	580333716.84
50	50	50	2020	907918751.73
51	51	51	2024	610427117.14
52	52	52	2025	918379269.78
53	53	53	2021	745716476.05
54	54	54	2026	744645008.86
55	55	55	2021	554717265.38
56	56	56	2025	330921280.85
57	57	57	2020	484591474.00
58	58	58	2026	408522916.88
59	59	59	2026	638180011.60
60	60	60	2026	597878931.10
61	61	61	2026	453378975.46
62	62	62	2021	710775408.27
63	63	63	2024	606371840.44
64	64	64	2026	509333251.32
65	65	65	2024	439273423.23
66	66	66	2021	647155712.94
67	67	67	2022	318463108.65
68	68	68	2020	463796702.77
69	69	69	2021	260917690.88
70	70	70	2020	754694346.39
71	71	71	2023	333784463.21
72	72	72	2020	272048224.89
73	73	73	2021	451907456.20
74	74	74	2026	616059498.91
75	75	75	2020	140132981.18
76	76	76	2022	329931155.20
77	77	77	2021	862700910.82
78	78	78	2026	590707915.69
79	79	79	2024	328862493.99
80	80	80	2021	449298203.41
81	81	81	2022	626193937.81
82	82	82	2021	430222638.97
83	83	83	2025	582404931.77
84	84	84	2025	374815249.07
85	85	85	2024	460649915.27
86	86	86	2023	805034319.20
87	87	87	2024	259934194.42
88	88	88	2024	359315059.32
89	89	89	2025	846320263.21
90	90	90	2020	700406644.97
91	91	91	2024	511415036.64
92	92	92	2020	694389900.36
93	93	93	2024	389015647.24
94	94	94	2024	617075510.40
95	95	95	2021	818758310.97
96	96	96	2026	389142140.07
97	97	97	2020	805422419.36
98	98	98	2022	250579977.20
99	99	99	2026	333180824.83
100	100	100	2024	737491970.47
\.


--
-- Data for Name: tax_assessment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_assessment (assessment_id, declaration_id, officer_id, assessment_date, assessed_amount) FROM stdin;
1	1	1	2024-02-15	1250000.00
2	2	2	2024-02-16	950000.00
3	3	3	2025-03-25	6800000.00
4	4	4	2024-02-17	1900000.00
5	5	5	2025-01-25	2600000.00
6	6	6	2024-04-15	1500000.00
7	7	7	2024-02-18	1000000.00
8	8	8	2025-03-28	4400000.00
9	9	9	2024-04-16	800000.00
10	10	10	2025-01-22	3750000.00
11	11	1	2024-06-15	532681.00
12	12	2	2024-11-30	2166768.02
13	13	3	2024-07-09	6074638.40
14	14	4	2025-08-29	919605.45
15	15	5	2025-04-24	582745.19
16	16	6	2024-05-25	1738312.77
17	17	7	2025-07-24	4651378.74
18	18	8	2025-09-16	1624516.89
19	19	9	2025-09-03	3094155.09
20	20	10	2025-05-22	5040094.29
21	21	1	2024-02-23	5967556.53
22	22	2	2024-08-04	4953303.87
23	23	3	2025-02-02	2138054.08
24	24	4	2024-09-26	7033149.57
25	25	5	2025-01-28	1065061.69
26	26	6	2025-03-16	1028292.63
27	27	7	2025-02-05	4370857.66
28	28	8	2024-04-04	5523407.67
29	29	9	2025-08-27	1273576.82
30	30	10	2025-03-10	905353.52
31	31	1	2024-12-20	6623431.24
32	32	2	2025-02-27	4793192.31
33	33	3	2024-05-05	653313.96
34	34	4	2024-10-14	5821019.76
35	35	5	2024-05-11	6967690.81
36	36	6	2024-06-02	2843673.36
37	37	7	2025-05-30	4999042.87
38	38	8	2025-03-01	1568039.52
39	39	9	2025-02-18	1884029.03
40	40	10	2024-11-17	5051261.49
41	41	1	2024-05-06	4465477.79
42	42	2	2024-08-15	3940162.25
43	43	3	2024-10-31	1482905.48
44	44	4	2025-03-12	2407216.36
45	45	5	2025-09-14	1858700.54
46	46	6	2025-01-19	6616104.06
47	47	7	2024-04-21	1820020.24
48	48	8	2024-03-21	6760440.89
49	49	9	2025-04-09	2360080.47
50	50	10	2024-09-21	6408029.05
51	51	1	2025-09-23	6936543.69
52	52	2	2025-01-11	1788652.06
53	53	3	2025-07-18	3455243.80
54	54	4	2025-06-05	1228377.18
55	55	5	2024-07-15	2057229.27
56	56	6	2025-09-14	4258975.76
57	57	7	2025-10-10	3633996.93
58	58	8	2025-10-08	3390590.65
59	59	9	2024-10-04	7467205.01
60	60	10	2024-07-14	3715060.98
61	61	1	2024-05-27	5743519.67
62	62	2	2024-06-12	1535849.20
63	63	3	2024-08-04	6560028.52
64	64	4	2025-04-28	4875671.20
65	65	5	2025-03-22	3219987.55
66	66	6	2025-06-16	4568036.31
67	67	7	2025-09-07	6085645.25
68	68	8	2024-03-01	5023341.55
69	69	9	2024-06-16	4804215.13
70	70	10	2025-08-21	5549677.81
71	71	1	2025-01-30	1047062.93
72	72	2	2025-05-15	1429888.63
73	73	3	2024-02-25	7960337.76
74	74	4	2024-11-20	8100656.54
75	75	5	2024-08-17	4000116.73
76	76	6	2024-06-12	6557723.04
77	77	7	2024-12-24	6352539.95
78	78	8	2025-07-27	4904095.42
79	79	9	2024-07-22	2866872.96
80	80	10	2024-08-03	4217521.76
81	81	1	2025-08-14	6830269.50
82	82	2	2025-10-22	2477141.73
83	83	3	2024-03-09	1135652.58
84	84	4	2025-02-27	6910076.23
85	85	5	2024-12-28	2216071.75
86	86	6	2024-10-26	6288666.01
87	87	7	2024-05-11	1018544.90
88	88	8	2025-07-03	6266949.93
89	89	9	2025-08-16	6336032.46
90	90	10	2024-07-04	5131408.29
91	91	1	2025-09-05	1395375.95
92	92	2	2025-08-11	7041794.93
93	93	3	2025-04-29	7357311.16
94	94	4	2025-08-24	5871412.81
95	95	5	2024-09-12	6031959.16
96	96	6	2025-04-08	7407971.21
97	97	7	2025-03-13	3809525.47
98	98	8	2025-08-07	3478329.63
99	99	9	2024-10-28	2031431.30
100	100	10	2025-02-01	462136.64
\.


--
-- Data for Name: tax_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_audit (audit_id, taxpayer_id, officer_id, audit_start_date, audit_status) FROM stdin;
1	1	1	2024-03-01	Completed
2	2	2	2024-03-05	Completed
3	3	3	2025-04-01	Ongoing
4	4	4	2024-03-10	Completed
5	5	5	2025-02-10	Pending
6	6	6	2024-05-01	Completed
7	7	7	2024-03-15	Completed
8	8	8	2025-04-10	Ongoing
9	9	9	2024-05-05	Pending
10	10	10	2025-02-15	Completed
11	11	1	2024-03-13	Ongoing
12	12	2	2024-06-24	Ongoing
13	13	3	2024-07-23	Pending
14	14	4	2024-04-14	Completed
15	15	5	2024-06-24	Pending
16	16	6	2024-10-24	Pending
17	17	7	2024-07-21	Completed
18	18	8	2024-04-03	Pending
19	19	9	2024-05-02	Completed
20	20	10	2024-10-23	Pending
21	21	1	2025-06-02	Pending
22	22	2	2025-04-27	Completed
23	23	3	2024-06-04	Completed
24	24	4	2024-03-21	Ongoing
25	25	5	2025-02-13	Completed
26	26	6	2024-09-27	Ongoing
27	27	7	2025-04-06	Ongoing
28	28	8	2024-11-08	Completed
29	29	9	2024-10-09	Ongoing
30	30	10	2025-10-20	Pending
31	31	1	2025-09-12	Completed
32	32	2	2024-04-22	Completed
33	33	3	2025-02-28	Completed
34	34	4	2024-09-25	Completed
35	35	5	2025-03-21	Completed
36	36	6	2024-05-28	Pending
37	37	7	2025-08-26	Ongoing
38	38	8	2024-10-10	Completed
39	39	9	2025-05-17	Pending
40	40	10	2025-03-12	Completed
41	41	1	2025-02-02	Pending
42	42	2	2024-10-11	Ongoing
43	43	3	2024-04-12	Ongoing
44	44	4	2025-02-08	Ongoing
45	45	5	2025-02-06	Pending
46	46	6	2025-04-10	Ongoing
47	47	7	2025-01-18	Completed
48	48	8	2024-06-06	Ongoing
49	49	9	2024-08-28	Pending
50	50	10	2025-09-10	Pending
51	51	1	2024-12-28	Completed
52	52	2	2024-08-25	Completed
53	53	3	2024-03-30	Pending
54	54	4	2025-03-19	Pending
55	55	5	2024-06-06	Pending
56	56	6	2025-04-13	Ongoing
57	57	7	2025-01-07	Pending
58	58	8	2024-09-18	Completed
59	59	9	2025-06-09	Completed
60	60	10	2025-02-05	Ongoing
61	61	1	2025-04-17	Completed
62	62	2	2025-09-27	Pending
63	63	3	2024-06-29	Ongoing
64	64	4	2024-06-10	Pending
65	65	5	2024-07-01	Completed
66	66	6	2024-09-22	Ongoing
67	67	7	2024-08-14	Pending
68	68	8	2024-08-03	Ongoing
69	69	9	2024-04-29	Ongoing
70	70	10	2025-08-07	Ongoing
71	71	1	2025-03-17	Pending
72	72	2	2025-07-16	Pending
73	73	3	2024-04-08	Completed
74	74	4	2025-07-11	Completed
75	75	5	2025-07-23	Completed
76	76	6	2024-11-16	Ongoing
77	77	7	2025-06-25	Ongoing
78	78	8	2024-10-30	Completed
79	79	9	2024-06-08	Ongoing
80	80	10	2025-10-18	Ongoing
81	81	1	2025-05-31	Completed
82	82	2	2024-04-16	Completed
83	83	3	2024-07-06	Pending
84	84	4	2024-04-21	Pending
85	85	5	2024-09-28	Completed
86	86	6	2024-12-31	Pending
87	87	7	2024-09-05	Pending
88	88	8	2025-06-09	Pending
89	89	9	2025-08-08	Pending
90	90	10	2025-07-29	Ongoing
91	91	1	2024-10-19	Pending
92	92	2	2024-09-16	Pending
93	93	3	2025-06-16	Ongoing
94	94	4	2025-06-22	Ongoing
95	95	5	2024-07-15	Ongoing
96	96	6	2024-07-05	Pending
97	97	7	2025-02-19	Pending
98	98	8	2024-09-13	Ongoing
99	99	9	2025-03-24	Pending
100	100	10	2024-08-18	Completed
\.


--
-- Data for Name: tax_centre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_centre (tax_centre_id, centre_name, district_name, centre_manager, opening_date) FROM stdin;
1	Kigali Tax Centre	Nyarugenge	Jean Bosco	2019-01-01
2	Gasabo Tax Centre	Gasabo	Alice Uwimana	2019-02-01
3	Kicukiro Tax Centre	Kicukiro	Eric Mugisha	2019-03-01
4	Musanze Tax Centre	Musanze	Grace Mukamana	2019-04-01
5	Huye Tax Centre	Huye	Patrick Niyonsaba	2019-05-01
6	Rubavu Tax Centre	Rubavu	Samuel Uwizeye	2019-06-01
7	Rusizi Tax Centre	Rusizi	Claire Ingabire	2019-07-01
8	Muhanga Tax Centre	Muhanga	Diane Uwera	2019-08-01
9	Rwamagana Tax Centre	Rwamagana	Emmanuel Habimana	2019-09-01
10	Nyagatare Tax Centre	Nyagatare	Olivia Mukeshimana	2019-10-01
11	Nyamagabe Tax Centre	Nyamagabe	Aline Uwimana	2020-01-11
12	Karongi Tax Centre	Karongi	Jean Claude Mugenzi	2020-01-12
13	Ngororero Tax Centre	Ngororero	Vestine Mukamana	2020-01-13
14	Nyabihu Tax Centre	Nyabihu	Patrick Ndayisaba	2020-01-14
15	Burera Tax Centre	Burera	Alice Uwera	2020-01-15
16	Gicumbi Tax Centre	Gicumbi	Samuel Habimana	2020-01-16
17	Gakenke Tax Centre	Gakenke	Claire Mukeshimana	2020-01-17
18	Rulindo Tax Centre	Rulindo	David Nshimiyimana	2020-01-18
19	Kamonyi Tax Centre	Kamonyi	Olivia Ingabire	2020-01-19
20	Ruhango Tax Centre	Ruhango	Eric Tuyisenge	2020-01-20
21	Nyanza Tax Centre	Nyanza	Jeannette Uwase	2020-01-21
22	Gisagara Tax Centre	Gisagara	Emmanuel Mucyo	2020-01-22
23	Nyaruguru Tax Centre	Nyaruguru	Yvonne Mukandayisenga	2020-01-23
24	Kayonza Tax Centre	Kayonza	Claude Niyonzima	2020-01-24
25	Kirehe Tax Centre	Kirehe	Ange Uwamahoro	2020-01-25
26	Ngoma Tax Centre	Ngoma	Gilbert Habineza	2020-01-26
27	Bugesera Tax Centre	Bugesera	Clarisse Mukarurangwa	2020-01-27
28	Gatsibo Tax Centre	Gatsibo	Aimable Rugwizangoga	2020-01-28
29	Nyagatare East Tax Centre	Nyagatare	Christine Nyiransabimana	2020-01-29
30	Rwamagana East Tax Centre	Rwamagana	Didier Manzi	2020-01-30
31	Rusizi South Tax Centre	Rusizi	Beatha Umutoni	2020-01-31
32	Nyamasheke Tax Centre	Nyamasheke	Fabrice Nkundimana	2020-02-01
33	Rubavu West Tax Centre	Rubavu	Sandrine Mukamana	2020-02-02
34	Musanze North Tax Centre	Musanze	Thierry Ndayambaje	2020-02-03
35	Huye Central Tax Centre	Huye	Gloria Uwimbabazi	2020-02-04
36	Kicukiro South Tax Centre	Kicukiro	Jean Baptiste Nkurunziza	2020-02-05
37	Gasabo North Tax Centre	Gasabo	Aline Nyirahabimana	2020-02-06
38	Nyarugenge Central Tax Centre	Nyarugenge	Patrick Mugisha	2020-02-07
39	Muhanga East Tax Centre	Muhanga	Vestine Uwamahoro	2020-02-08
40	Rutsiro Tax Centre	Rutsiro	Claude Habimana	2020-02-09
41	Nyabugogo Tax Centre	Nyarugenge	Eric Manzi	2020-02-10
42	Remera Tax Centre	Gasabo	Grace Mukarwego	2020-02-11
43	Kimironko Tax Centre	Gasabo	Didier Ndayisaba	2020-02-12
44	Kacyiru Tax Centre	Gasabo	Jeannette Uwase	2020-02-13
45	Kanombe Tax Centre	Kicukiro	Samuel Muryango	2020-02-14
46	Gahanga Tax Centre	Kicukiro	Alice Mukandayisenga	2020-02-15
47	Masaka Tax Centre	Kicukiro	Gilbert Nshimiyimana	2020-02-16
48	Kabuga Tax Centre	Gasabo	Yvonne Mukamana	2020-02-17
49	Kibungo Tax Centre	Ngoma	David Rugwizangoga	2020-02-18
50	Kabarondo Tax Centre	Kayonza	Emmanuel Tuyishime	2020-02-19
51	Mimuri Tax Centre	Nyagatare	Beatha Ingabire	2020-02-20
52	Byumba Tax Centre	Gicumbi	Clarisse Uwera	2020-02-21
53	Kinihira Tax Centre	Rulindo	Aimable Ndayambaje	2020-02-22
54	Base Tax Centre	Rulindo	Florence Nyiransabimana	2020-02-23
55	Kibirizi Tax Centre	Nyanza	Fabrice Habineza	2020-02-24
56	Save Tax Centre	Gisagara	Sandrine Umutoni	2020-02-25
57	Muganza Tax Centre	Nyaruguru	Theogene Mucyo	2020-02-26
58	Kibeho Tax Centre	Nyaruguru	Gloria Mukeshimana	2020-02-27
59	Bwishyura Tax Centre	Karongi	Innocent Nkurunziza	2020-02-28
60	Gisenyi Tax Centre	Rubavu	Chantal Uwimbabazi	2020-02-29
61	Nyamirambo Tax Centre	Nyarugenge	Jean Pierre Uwimana	2020-03-01
62	Kimisagara Tax Centre	Nyarugenge	Alice Nyirahabimana	2020-03-02
63	Gikondo Tax Centre	Kicukiro	Patrick Nshimiyimana	2020-03-03
64	Kagarama Tax Centre	Kicukiro	Vestine Mukarurangwa	2020-03-04
65	Kabeza Tax Centre	Kicukiro	Eric Habimana	2020-03-05
66	Niboye Tax Centre	Kicukiro	Grace Uwamahoro	2020-03-06
67	Kinyinya Tax Centre	Gasabo	Didier Muryango	2020-03-07
68	Gisozi Tax Centre	Gasabo	Olivia Mukeshimana	2020-03-08
69	Bumbogo Tax Centre	Gasabo	Samuel Rugwizangoga	2020-03-09
70	Jabana Tax Centre	Gasabo	Jeannette Niyonsaba	2020-03-10
71	Rutunga Tax Centre	Gasabo	Claude Nkurunziza	2020-03-11
72	Rushashi Tax Centre	Gakenke	David Manzi	2020-03-12
73	Cyanika Tax Centre	Burera	Clarisse Ingabire	2020-03-13
74	Kinigi Tax Centre	Musanze	Fabrice Mucyo	2020-03-14
75	Busogo Tax Centre	Musanze	Yvonne Uwase	2020-03-15
76	Shyira Tax Centre	Nyabihu	Aimable Habineza	2020-03-16
77	Mukamira Tax Centre	Nyabihu	Christine Mukamana	2020-03-17
78	Rambura Tax Centre	Nyabihu	Gilbert Ndayambaje	2020-03-18
79	Murunda Tax Centre	Rutsiro	Ange Umutoni	2020-03-19
80	Boneza Tax Centre	Rutsiro	Emmanuel Tuyisenge	2020-03-20
81	Gashari Tax Centre	Karongi	Beatha Nyiransabimana	2020-03-21
82	Murambi Tax Centre	Karongi	Innocent Rugwizangoga	2020-03-22
83	Rwankuba Tax Centre	Karongi	Sandrine Uwimbabazi	2020-03-23
84	Kagano Tax Centre	Nyamasheke	Thierry Mukeshimana	2020-03-24
85	Macuba Tax Centre	Nyamasheke	Gloria Habimana	2020-03-25
86	Mahembe Tax Centre	Nyamasheke	Jean Claude Habineza	2020-03-26
87	Kanjongo Tax Centre	Nyamasheke	Vestine Mukarwego	2020-03-27
88	Nyakabuye Tax Centre	Rusizi	Patrick Muryango	2020-03-28
89	Kamembe Tax Centre	Rusizi	Alice Nyirahabimana	2020-03-29
90	Bugarama Tax Centre	Rusizi	Eric Nkundimana	2020-03-30
91	Rwimiyaga Tax Centre	Nyagatare	Grace Uwase	2020-03-31
92	Karama Tax Centre	Nyagatare	Samuel Nshimiyimana	2020-04-01
93	Tabagwe Tax Centre	Nyagatare	Claire Mukamana	2020-04-02
94	Kiziguro Tax Centre	Gatsibo	David Habimana	2020-04-03
95	Kiramuruzi Tax Centre	Gatsibo	Yvette Mukandayisenga	2020-04-04
96	Muhura Tax Centre	Gatsibo	Claude Rugwizangoga	2020-04-05
97	Ngarama Tax Centre	Gatsibo	Olivia Uwamahoro	2020-04-06
98	Rukomo Tax Centre	Nyagatare	Emmanuel Mugiraneza	2020-04-07
99	Kibungo Central Tax Centre	Ngoma	Sandrine Uwimbabazi	2020-04-08
100	Kirehe Central Tax Centre	Kirehe	Fabrice Ndayisaba	2020-04-09
\.


--
-- Data for Name: tax_declaration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_declaration (declaration_id, registration_id, tax_period_id, declaration_date, declared_amount) FROM stdin;
1	1	1	2024-02-10	1200000.00
2	2	2	2024-02-11	900000.00
3	3	3	2025-03-20	6500000.00
4	4	4	2024-02-12	1800000.00
5	5	5	2025-01-20	2500000.00
6	6	6	2024-04-10	1450000.00
7	7	7	2024-02-14	980000.00
8	8	8	2025-03-25	4200000.00
9	9	9	2024-04-12	760000.00
10	10	10	2025-01-18	3600000.00
11	11	11	2024-06-08	480077.44
12	12	12	2024-11-22	2063221.35
13	13	13	2024-07-06	5602592.74
14	14	14	2025-08-26	925959.59
15	15	15	2025-04-22	528835.29
16	16	16	2024-05-20	1874193.42
17	17	17	2025-07-16	4634534.85
18	18	18	2025-09-11	1731631.08
19	19	19	2025-08-26	3320542.71
20	20	20	2025-05-19	4542712.92
21	21	21	2024-02-21	5763413.04
22	22	22	2024-07-27	5326603.64
23	23	23	2025-01-28	2300673.66
24	24	24	2024-09-22	7191934.12
25	25	25	2025-01-24	1035913.99
26	26	26	2025-03-10	996357.91
27	27	27	2025-02-01	4646827.43
28	28	28	2024-03-30	5554068.86
29	29	29	2025-08-17	1198748.37
30	30	30	2025-03-08	867361.43
31	31	31	2024-12-11	6271713.58
32	32	32	2025-02-19	4456935.45
33	33	33	2024-04-26	629935.56
34	34	34	2024-10-05	5866092.05
35	35	35	2024-05-06	6458287.59
36	36	36	2024-05-28	3036908.82
37	37	37	2025-05-24	4876928.00
38	38	38	2025-02-22	1471109.50
39	39	39	2025-02-12	1808450.62
40	40	40	2024-11-14	5353106.26
41	41	41	2024-04-28	4685743.24
42	42	42	2024-08-08	4145807.11
43	43	43	2024-10-22	1476497.96
44	44	44	2025-03-09	2243624.35
45	45	45	2025-09-07	1881229.25
46	46	46	2025-01-12	6368533.83
47	47	47	2024-04-12	1949146.12
48	48	48	2024-03-18	6096329.77
49	49	49	2025-03-31	2227734.31
50	50	50	2024-09-18	6874580.09
51	51	51	2025-09-17	6609846.91
52	52	52	2025-01-02	1830911.12
53	53	53	2025-07-10	3148549.69
54	54	54	2025-05-29	1328675.45
55	55	55	2024-07-06	2075718.06
56	56	56	2025-09-11	4180636.49
57	57	57	2025-10-05	3384723.56
58	58	58	2025-10-04	3175683.64
59	59	59	2024-09-26	7480745.60
60	60	60	2024-07-05	3968589.31
61	61	61	2024-05-18	5741631.53
62	62	62	2024-06-06	1400457.50
63	63	63	2024-07-27	6002971.42
64	64	64	2025-04-22	4594145.02
65	65	65	2025-03-15	3047658.86
66	66	66	2025-06-08	4109623.28
67	67	67	2025-09-03	6497613.86
68	68	68	2024-02-26	5198040.55
69	69	69	2024-06-11	5208314.66
70	70	70	2025-08-17	5706320.16
71	71	71	2025-01-28	1103175.65
72	72	72	2025-05-05	1438735.83
73	73	73	2024-02-18	7167474.68
74	74	74	2024-11-10	7297594.31
75	75	75	2024-08-15	3955308.06
76	76	76	2024-06-02	6567733.70
77	77	77	2024-12-16	6360019.31
78	78	78	2025-07-18	4684585.52
79	79	79	2024-07-20	2992179.74
80	80	80	2024-07-29	4183529.02
81	81	81	2025-08-11	6913153.16
82	82	82	2025-10-20	2633923.61
83	83	83	2024-03-05	1105447.62
84	84	84	2025-02-20	6626797.52
85	85	85	2024-12-25	2024056.63
86	86	86	2024-10-18	6621669.11
87	87	87	2024-05-05	916704.85
88	88	88	2025-06-26	6175367.42
89	89	89	2025-08-13	5814007.89
90	90	90	2024-06-25	5050205.92
91	91	91	2025-08-30	1488914.10
92	92	92	2025-08-08	6581517.90
93	93	93	2025-04-23	7243412.92
94	94	94	2025-08-20	5737909.42
95	95	95	2024-09-07	5433232.60
96	96	96	2025-03-29	7465075.37
97	97	97	2025-03-03	3454320.60
98	98	98	2025-07-28	3550700.22
99	99	99	2024-10-25	1917820.83
100	100	1	2025-01-26	451446.67
\.


--
-- Data for Name: tax_objection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_objection (objection_id, assessment_id, taxpayer_id, objection_date, objection_status) FROM stdin;
1	1	1	2024-03-12	Approved
2	2	2	2024-03-18	Rejected
3	3	3	2025-04-18	Pending
4	4	4	2024-03-22	Approved
5	5	5	2025-02-18	Pending
6	6	6	2024-05-12	Rejected
7	7	7	2024-03-25	Approved
8	8	8	2025-04-28	Pending
9	9	9	2024-05-28	Rejected
10	10	10	2025-02-25	Approved
11	11	11	2024-07-05	Approved
12	12	12	2024-12-17	Pending
13	13	13	2024-07-14	Approved
14	14	14	2025-09-11	Pending
15	15	15	2025-05-05	Pending
16	16	16	2024-06-03	Approved
17	17	17	2025-08-11	Rejected
18	18	18	2025-09-27	Pending
19	19	19	2025-09-08	Approved
20	20	20	2025-06-08	Pending
21	21	21	2024-02-28	Approved
22	22	22	2024-08-14	Approved
23	23	23	2025-02-08	Pending
24	24	24	2024-10-09	Approved
25	25	25	2025-02-08	Approved
26	26	26	2025-03-21	Rejected
27	27	27	2025-02-22	Approved
28	28	28	2024-04-18	Pending
29	29	29	2025-09-05	Pending
30	30	30	2025-03-28	Rejected
31	31	31	2025-01-03	Pending
32	32	32	2025-03-15	Pending
33	33	33	2024-05-25	Pending
34	34	34	2024-10-24	Approved
35	35	35	2024-05-16	Approved
36	36	36	2024-06-21	Approved
37	37	37	2025-06-10	Approved
38	38	38	2025-03-07	Pending
39	39	39	2025-03-03	Approved
40	40	40	2024-11-29	Approved
41	41	41	2024-05-20	Approved
42	42	42	2024-08-25	Rejected
43	43	43	2024-11-12	Pending
44	44	44	2025-03-24	Pending
45	45	45	2025-09-26	Approved
46	46	46	2025-02-01	Rejected
47	47	47	2024-05-10	Rejected
48	48	48	2024-04-06	Approved
49	49	49	2025-04-22	Approved
50	50	50	2024-10-01	Rejected
51	51	51	2025-09-29	Approved
52	52	52	2025-01-17	Approved
53	53	53	2025-07-26	Pending
54	54	54	2025-06-11	Approved
55	55	55	2024-07-30	Pending
56	56	56	2025-09-27	Rejected
57	57	57	2025-10-30	Approved
58	58	58	2025-10-28	Rejected
59	59	59	2024-10-10	Approved
60	60	60	2024-07-29	Pending
61	61	61	2024-06-05	Pending
62	62	62	2024-06-20	Pending
63	63	63	2024-08-19	Rejected
64	64	64	2025-05-07	Rejected
65	65	65	2025-04-08	Rejected
66	66	66	2025-06-25	Rejected
67	67	67	2025-09-25	Approved
68	68	68	2024-03-06	Rejected
69	69	69	2024-06-26	Rejected
70	70	70	2025-08-31	Pending
71	71	71	2025-02-11	Rejected
72	72	72	2025-05-28	Pending
73	73	73	2024-03-15	Approved
74	74	74	2024-12-05	Rejected
75	75	75	2024-08-30	Approved
76	76	76	2024-06-30	Rejected
77	77	77	2025-01-01	Approved
78	78	78	2025-08-16	Pending
79	79	79	2024-08-07	Pending
80	80	80	2024-08-23	Approved
81	81	81	2025-08-20	Pending
82	82	82	2025-10-29	Approved
83	83	83	2024-03-17	Rejected
84	84	84	2025-03-16	Approved
85	85	85	2025-01-14	Approved
86	86	86	2024-11-04	Rejected
87	87	87	2024-05-27	Pending
88	88	88	2025-07-11	Approved
89	89	89	2025-08-21	Rejected
90	90	90	2024-07-16	Approved
91	91	91	2025-09-22	Approved
92	92	92	2025-08-22	Pending
93	93	93	2025-05-17	Approved
94	94	94	2025-08-29	Rejected
95	95	95	2024-09-26	Rejected
96	96	96	2025-04-17	Rejected
97	97	97	2025-03-18	Rejected
98	98	98	2025-08-20	Rejected
99	99	99	2024-11-16	Rejected
100	100	100	2025-02-10	Approved
\.


--
-- Data for Name: tax_officer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_officer (officer_id, tax_centre_id, officer_name, officer_position, employment_date) FROM stdin;
1	1	John Nkurunziza	Tax Officer	2020-01-10
2	2	Alice Uwase	Senior Tax Officer	2020-02-15
3	3	Eric Mugabo	Tax Auditor	2020-03-20
4	4	Grace Mukamana	Revenue Officer	2020-04-12
5	5	Patrick Habimana	Tax Officer	2020-05-17
6	6	Samuel Uwizeye	Revenue Officer	2020-06-15
7	7	Claire Ingabire	Tax Auditor	2020-07-18
8	8	Diane Mukeshimana	Senior Tax Officer	2020-08-20
9	9	Emmanuel Ndayisaba	Revenue Officer	2020-09-25
10	10	Olivia Uwimana	Tax Officer	2020-10-30
11	11	Jean Claude Niyomugabo	Tax Officer	2020-11-01
12	12	Aline Mukarurangwa	Senior Tax Officer	2020-11-05
13	13	Patrick Rugwizangoga	Tax Auditor	2020-11-08
14	14	Vestine Uwase	Revenue Officer	2020-11-10
15	15	Claude Habimana	Tax Officer	2020-11-15
16	16	Grace Mukeshimana	Revenue Officer	2020-11-18
17	17	Samuel Nkundimana	Tax Auditor	2020-11-22
18	18	Olivia Ingabire	Senior Tax Officer	2020-11-25
19	19	David Muryango	Tax Officer	2020-11-28
20	20	Alice Nyirahabimana	Revenue Officer	2020-12-01
21	21	Emmanuel Tuyisenge	Tax Auditor	2020-12-05
22	22	Jeannette Uwimbabazi	Tax Officer	2020-12-08
23	23	Didier Nshimiyimana	Senior Tax Officer	2020-12-12
24	24	Clarisse Mukamana	Revenue Officer	2020-12-15
25	25	Gilbert Habineza	Tax Officer	2020-12-18
26	26	Yvette Mukandayisenga	Tax Auditor	2020-12-22
27	27	Aimable Mugiraneza	Revenue Officer	2020-12-26
28	28	Christine Uwamahoro	Senior Tax Officer	2021-01-02
29	29	Fabrice Ndayambaje	Tax Officer	2021-01-06
30	30	Sandrine Mucyo	Tax Auditor	2021-01-10
31	31	Theogene Nkurunziza	Revenue Officer	2021-01-15
32	32	Beatha Mukarwego	Senior Tax Officer	2021-01-20
33	33	Innocent Habimana	Tax Officer	2021-01-25
34	34	Gloria Nyiransabimana	Tax Auditor	2021-01-28
35	35	Thierry Rugwizangoga	Revenue Officer	2021-02-01
36	36	Kevin Niyonzima	Tax Officer	2021-02-05
37	37	Florence Mukarubayiza	Senior Tax Officer	2021-02-08
38	38	Jean Baptiste Mugabo	Tax Auditor	2021-02-12
39	39	AgnŠs Uwimana	Revenue Officer	2021-02-15
40	40	Richard Nkurunziza	Tax Officer	2021-02-18
41	41	Benitha Mukamana	Tax Auditor	2021-02-22
42	42	Claude Nizeyimana	Revenue Officer	2021-02-25
43	43	Anitha Habineza	Senior Tax Officer	2021-03-01
44	44	Gilbert Ndayisenga	Tax Officer	2021-03-04
45	45	Josiane Nyirahabimana	Revenue Officer	2021-03-08
46	46	Aim‚ Muryango	Tax Auditor	2021-03-12
47	47	Doreen Mukeshimana	Tax Officer	2021-03-16
48	48	Pacifique Rugema	Senior Tax Officer	2021-03-20
49	49	Esther Umutoni	Revenue Officer	2021-03-24
50	50	Thierry Mugiraneza	Tax Officer	2021-03-28
51	51	Yvette Nyirabagenzi	Tax Auditor	2021-04-01
52	52	Patrick Muvunyi	Revenue Officer	2021-04-05
53	53	Aline Iradukunda	Senior Tax Officer	2021-04-09
54	54	Eric Rukundo	Tax Officer	2021-04-13
55	55	Grace Nyirahabimana	Tax Auditor	2021-04-17
56	56	Didier Musabyimana	Revenue Officer	2021-04-21
57	57	Claudine Mukantwari	Tax Officer	2021-04-25
58	58	Emmanuel Ntaganda	Senior Tax Officer	2021-04-29
59	59	Sandrine Uwase	Tax Auditor	2021-05-03
60	60	Jean Marie Habimana	Revenue Officer	2021-05-07
61	61	Olivier Niyigena	Tax Officer	2021-05-10
62	62	Belise Mukarukundo	Senior Tax Officer	2021-05-14
63	63	Jean Bosco Nshimiyimana	Revenue Officer	2021-05-18
64	64	Aline Uwera	Tax Auditor	2021-05-22
65	65	Patrick Habineza	Tax Officer	2021-05-26
66	66	Claire Nyirahabimana	Revenue Officer	2021-05-30
67	67	Samuel Nsengimana	Senior Tax Officer	2021-06-03
68	68	Joseline Mukantabana	Tax Auditor	2021-06-07
69	69	Eric Ndayambaje	Tax Officer	2021-06-11
70	70	Florence Umuhoza	Revenue Officer	2021-06-15
71	71	Claude Mugisha	Tax Auditor	2021-06-19
72	72	Alice Nyiramugisha	Senior Tax Officer	2021-06-23
73	73	Didier Niyonkuru	Tax Officer	2021-06-27
74	74	Sandrine Mukamurenzi	Revenue Officer	2021-07-01
75	75	Gilbert Uwitonze	Tax Auditor	2021-07-05
76	76	Yvonne Mukamugema	Tax Officer	2021-07-09
77	77	Emmanuel Habyarimana	Senior Tax Officer	2021-07-13
78	78	Beatha Niyonsaba	Revenue Officer	2021-07-17
79	79	Theophile Habimana	Tax Auditor	2021-07-21
80	80	Ange Mukeshimana	Tax Officer	2021-07-25
81	81	Fabrice Niyomugabo	Revenue Officer	2021-07-29
82	82	Vestine Uwamahoro	Senior Tax Officer	2021-08-02
83	83	Aimable Mbarushimana	Tax Auditor	2021-08-06
84	84	Christine Uwamwezi	Tax Officer	2021-08-10
85	85	Jean Claude Rugema	Revenue Officer	2021-08-14
86	86	Kevin Ndayambaje	Tax Officer	2021-08-18
87	87	AgnŠs Mukarurangwa	Senior Tax Officer	2021-08-22
88	88	Patrick Uwihoreye	Tax Auditor	2021-08-26
89	89	Chantal Mukantwari	Revenue Officer	2021-08-30
90	90	Eric Mugabo	Tax Officer	2021-09-03
91	91	Grace Nyirabukeye	Senior Tax Officer	2021-09-07
92	92	Jean Pierre Habineza	Tax Auditor	2021-09-11
93	93	Olivia Niyonkuru	Revenue Officer	2021-09-15
94	94	Didier Murekezi	Tax Officer	2021-09-19
95	95	Vestine Umutesi	Senior Tax Officer	2021-09-23
96	96	Claude Nkundabera	Tax Auditor	2021-09-27
97	97	Sandrine Uwase	Revenue Officer	2021-10-01
98	98	Emmanuel Nshimye	Tax Officer	2021-10-05
99	99	Beatha Mukarubibi	Senior Tax Officer	2021-10-09
100	100	Fabrice Mugiraneza	Tax Auditor	2021-10-13
\.


--
-- Data for Name: tax_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_payment (payment_id, assessment_id, bank_id, payment_date, payment_amount) FROM stdin;
1	1	1	2024-02-20	1250000.00
2	2	2	2024-02-21	900000.00
3	3	3	2025-03-30	6500000.00
4	4	4	2024-02-22	1800000.00
5	5	5	2025-01-30	2500000.00
6	6	6	2024-04-20	1450000.00
7	7	7	2024-02-25	980000.00
8	8	8	2025-04-01	4200000.00
9	9	9	2024-04-21	760000.00
10	10	10	2025-01-28	3600000.00
11	11	1	2024-06-19	532681.00
12	12	2	2024-12-04	2166768.02
13	13	3	2024-07-16	6074638.40
14	14	4	2025-09-05	919605.45
15	15	5	2025-05-02	582745.19
16	16	6	2024-06-02	1738312.77
17	17	7	2025-07-27	4651378.74
18	18	8	2025-09-23	1624516.89
19	19	9	2025-09-06	3094155.09
20	20	10	2025-05-29	5040094.29
21	21	11	2024-02-26	5967556.53
22	22	12	2024-08-12	4953303.87
23	23	13	2025-02-05	2138054.08
24	24	14	2024-10-03	7033149.57
25	25	15	2025-02-04	1065061.69
26	26	16	2025-03-19	1028292.63
27	27	17	2025-02-08	4370857.66
28	28	18	2024-04-06	5523407.67
29	29	19	2025-09-02	1273576.82
30	30	20	2025-03-18	905353.52
31	31	21	2024-12-23	6623431.24
32	32	22	2025-03-06	4793192.31
33	33	23	2024-05-09	653313.96
34	34	24	2024-10-16	5821019.76
35	35	25	2024-05-16	6967690.81
36	36	26	2024-06-05	2843673.36
37	37	27	2025-06-07	4999042.87
38	38	28	2025-03-08	1568039.52
39	39	29	2025-02-24	1884029.03
40	40	30	2024-11-19	5051261.49
41	41	31	2024-05-10	4465477.79
42	42	32	2024-08-23	3940162.25
43	43	33	2024-11-03	1482905.48
44	44	34	2025-03-14	2407216.36
45	45	35	2025-09-22	1858700.54
46	46	36	2025-01-27	6616104.06
47	47	37	2024-04-29	1820020.24
48	48	38	2024-03-29	6760440.89
49	49	39	2025-04-13	2360080.47
50	50	40	2024-09-29	6408029.05
51	51	41	2025-09-28	6936543.69
52	52	42	2025-01-18	1788652.06
53	53	43	2025-07-23	3455243.80
54	54	44	2025-06-08	1228377.18
55	55	45	2024-07-23	2057229.27
56	56	46	2025-09-18	4258975.76
57	57	47	2025-10-14	3633996.93
58	58	48	2025-10-16	3390590.65
59	59	49	2024-10-07	7467205.01
60	60	50	2024-07-19	3715060.98
61	61	51	2024-06-04	5743519.67
62	62	52	2024-06-18	1535849.20
63	63	53	2024-08-10	6560028.52
64	64	54	2025-05-03	4875671.20
65	65	55	2025-03-29	3219987.55
66	66	56	2025-06-20	4568036.31
67	67	57	2025-09-12	6085645.25
68	68	58	2024-03-08	5023341.55
69	69	59	2024-06-20	4804215.13
70	70	60	2025-08-28	5549677.81
71	71	61	2025-02-01	1047062.93
72	72	62	2025-05-19	1429888.63
73	73	63	2024-03-04	7960337.76
74	74	64	2024-11-26	8100656.54
75	75	65	2024-08-25	4000116.73
76	76	66	2024-06-19	6557723.04
77	77	67	2024-12-28	6352539.95
78	78	68	2025-08-03	4904095.42
79	79	69	2024-07-27	2866872.96
80	80	70	2024-08-09	4217521.76
81	81	71	2025-08-20	6830269.50
82	82	72	2025-10-29	2477141.73
83	83	73	2024-03-12	1135652.58
84	84	74	2025-03-04	6910076.23
85	85	75	2025-01-04	2216071.75
86	86	76	2024-11-02	6288666.01
87	87	77	2024-05-16	1018544.90
88	88	78	2025-07-09	6266949.93
89	89	79	2025-08-19	6336032.46
90	90	80	2024-07-08	5131408.29
91	91	81	2025-09-08	1395375.95
92	92	82	2025-08-14	7041794.93
93	93	83	2025-05-05	7357311.16
94	94	84	2025-08-28	5871412.81
95	95	85	2024-09-16	6031959.16
96	96	86	2025-04-12	7407971.21
97	97	87	2025-03-18	3809525.47
98	98	88	2025-08-11	3478329.63
99	99	89	2024-11-03	2031431.30
100	100	90	2025-02-05	462136.64
\.


--
-- Data for Name: tax_period; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_period (tax_period_id, tax_type_id, period_start_date, period_end_date, filing_due_date) FROM stdin;
1	1	2024-01-01	2024-01-31	2024-02-15
2	2	2024-01-01	2024-01-31	2024-02-15
3	3	2024-01-01	2024-12-31	2025-03-31
4	4	2024-01-01	2024-01-31	2024-02-15
5	5	2024-01-01	2024-12-31	2025-01-31
6	6	2024-01-01	2024-03-31	2024-04-15
7	7	2024-01-01	2024-01-31	2024-02-15
8	8	2024-01-01	2024-12-31	2025-03-31
9	9	2024-01-01	2024-03-31	2024-04-15
10	10	2024-01-01	2024-12-31	2025-01-31
11	11	2020-11-01	2020-11-30	2020-12-15
12	12	2020-12-01	2020-12-31	2021-01-15
13	13	2021-01-01	2021-01-31	2021-02-15
14	14	2021-02-01	2021-02-28	2021-03-15
15	15	2021-03-01	2021-03-31	2021-04-15
16	16	2021-04-01	2021-04-30	2021-05-15
17	17	2021-05-01	2021-05-31	2021-06-15
18	18	2021-06-01	2021-06-30	2021-07-15
19	19	2021-07-01	2021-07-31	2021-08-15
20	20	2021-08-01	2021-08-31	2021-09-15
21	21	2021-09-01	2021-09-30	2021-10-15
22	22	2021-10-01	2021-10-31	2021-11-15
23	23	2021-11-01	2021-11-30	2021-12-15
24	24	2021-12-01	2021-12-31	2022-01-15
25	25	2022-01-01	2022-01-31	2022-02-15
26	26	2022-02-01	2022-02-28	2022-03-15
27	27	2022-03-01	2022-03-31	2022-04-15
28	28	2022-04-01	2022-04-30	2022-05-15
29	29	2022-05-01	2022-05-31	2022-06-15
30	30	2022-06-01	2022-06-30	2022-07-15
31	31	2022-07-01	2022-07-31	2022-08-15
32	32	2022-08-01	2022-08-31	2022-09-15
33	33	2022-09-01	2022-09-30	2022-10-15
34	34	2022-10-01	2022-10-31	2022-11-15
35	35	2022-11-01	2022-11-30	2022-12-15
36	36	2022-12-01	2022-12-31	2023-01-15
37	37	2023-01-01	2023-01-31	2023-02-15
38	38	2023-02-01	2023-02-28	2023-03-15
39	39	2023-03-01	2023-03-31	2023-04-15
40	40	2023-04-01	2023-04-30	2023-05-15
41	41	2023-05-01	2023-05-31	2023-06-15
42	42	2023-06-01	2023-06-30	2023-07-15
43	43	2023-07-01	2023-07-31	2023-08-15
44	44	2023-08-01	2023-08-31	2023-09-15
45	45	2023-09-01	2023-09-30	2023-10-15
46	46	2023-10-01	2023-10-31	2023-11-15
47	47	2023-11-01	2023-11-30	2023-12-15
48	48	2023-12-01	2023-12-31	2024-01-15
49	49	2024-01-01	2024-01-31	2024-02-15
50	50	2024-02-01	2024-02-29	2024-03-15
51	51	2024-03-01	2024-03-31	2024-04-15
52	52	2024-04-01	2024-04-30	2024-05-15
53	53	2024-05-01	2024-05-31	2024-06-15
54	54	2024-06-01	2024-06-30	2024-07-15
55	55	2024-07-01	2024-07-31	2024-08-15
56	56	2024-08-01	2024-08-31	2024-09-15
57	57	2024-09-01	2024-09-30	2024-10-15
58	58	2024-10-01	2024-10-31	2024-11-15
59	59	2024-11-01	2024-11-30	2024-12-15
60	60	2024-12-01	2024-12-31	2025-01-15
61	61	2025-01-01	2025-01-31	2025-02-15
62	62	2025-02-01	2025-02-28	2025-03-15
63	63	2025-03-01	2025-03-31	2025-04-15
64	64	2025-04-01	2025-04-30	2025-05-15
65	65	2025-05-01	2025-05-31	2025-06-15
66	66	2025-06-01	2025-06-30	2025-07-15
67	67	2025-07-01	2025-07-31	2025-08-15
68	68	2025-08-01	2025-08-31	2025-09-15
69	69	2025-09-01	2025-09-30	2025-10-15
70	70	2025-10-01	2025-10-31	2025-11-15
71	71	2025-11-01	2025-11-30	2025-12-15
72	72	2025-12-01	2025-12-31	2026-01-15
73	73	2026-01-01	2026-01-31	2026-02-15
74	74	2026-02-01	2026-02-28	2026-03-15
75	75	2026-03-01	2026-03-31	2026-04-15
76	76	2026-04-01	2026-04-30	2026-05-15
77	77	2026-05-01	2026-05-31	2026-06-15
78	78	2026-06-01	2026-06-30	2026-07-15
79	79	2026-07-01	2026-07-31	2026-08-15
80	80	2026-08-01	2026-08-31	2026-09-15
81	81	2026-09-01	2026-09-30	2026-10-15
82	82	2026-10-01	2026-10-31	2026-11-15
83	83	2026-11-01	2026-11-30	2026-12-15
84	84	2026-12-01	2026-12-31	2027-01-15
85	85	2027-01-01	2027-01-31	2027-02-15
86	86	2027-02-01	2027-02-28	2027-03-15
87	87	2027-03-01	2027-03-31	2027-04-15
88	88	2027-04-01	2027-04-30	2027-05-15
89	89	2027-05-01	2027-05-31	2027-06-15
90	90	2027-06-01	2027-06-30	2027-07-15
91	91	2027-07-01	2027-07-31	2027-08-15
92	92	2027-08-01	2027-08-31	2027-09-15
93	93	2027-09-01	2027-09-30	2027-10-15
94	94	2027-10-01	2027-10-31	2027-11-15
95	95	2027-11-01	2027-11-30	2027-12-15
96	96	2027-12-01	2027-12-31	2028-01-15
97	97	2028-01-01	2028-01-31	2028-02-15
98	98	2028-02-01	2028-02-29	2028-03-15
99	99	2028-03-01	2028-03-31	2028-04-15
100	100	2028-04-01	2028-04-30	2028-05-15
\.


--
-- Data for Name: tax_refund; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_refund (refund_id, taxpayer_id, payment_id, refund_amount, refund_date) FROM stdin;
1	1	1	50000.00	2024-03-10
2	2	2	30000.00	2024-03-15
3	3	3	100000.00	2025-04-10
4	4	4	45000.00	2024-03-18
5	5	5	60000.00	2025-02-15
6	6	6	55000.00	2024-05-10
7	7	7	25000.00	2024-03-20
8	8	8	80000.00	2025-04-25
9	9	9	20000.00	2024-05-25
10	10	10	70000.00	2025-02-20
11	11	11	17228.74	2024-06-30
12	12	12	48692.45	2024-12-15
13	13	13	269252.14	2024-08-04
14	14	14	62831.70	2025-09-19
15	15	15	45456.37	2025-05-15
16	16	16	64379.35	2024-06-20
17	17	17	96496.41	2025-08-04
18	18	18	78297.86	2025-10-04
19	19	19	145853.09	2025-09-13
20	20	20	300368.51	2025-06-15
21	21	21	155567.27	2024-03-03
22	22	22	188783.99	2024-08-21
23	23	23	154125.60	2025-02-15
24	24	24	213332.62	2024-10-17
25	25	25	69947.12	2025-02-16
26	26	26	30359.22	2025-03-26
27	27	27	120260.15	2025-02-27
28	28	28	348742.15	2024-04-15
29	29	29	27799.72	2025-09-14
30	30	30	54627.18	2025-03-31
31	31	31	322653.07	2024-12-31
32	32	32	264676.51	2025-03-19
33	33	33	35960.72	2024-05-24
34	34	34	216116.25	2024-10-25
35	35	35	332757.62	2024-05-27
36	36	36	160926.03	2024-06-16
37	37	37	286932.97	2025-06-26
38	38	38	48024.04	2025-03-15
39	39	39	93360.63	2025-03-03
40	40	40	198221.75	2024-12-03
41	41	41	219569.70	2024-05-29
42	42	42	108745.48	2024-09-12
43	43	43	41067.08	2024-11-10
44	44	44	53075.52	2025-03-26
45	45	45	41378.10	2025-09-28
46	46	46	181580.37	2025-02-03
47	47	47	89953.29	2024-05-05
48	48	48	405066.38	2024-04-11
49	49	49	91833.51	2025-04-28
50	50	50	446289.43	2024-10-05
51	51	51	549086.11	2025-10-14
52	52	52	51543.44	2025-01-27
53	53	53	206708.85	2025-08-03
54	54	54	54995.23	2025-06-24
55	55	55	59782.31	2024-08-12
56	56	56	278936.04	2025-09-29
57	57	57	104123.01	2025-10-20
58	58	58	140930.32	2025-10-22
59	59	59	316051.19	2024-10-25
60	60	60	93860.09	2024-08-08
61	61	61	432465.19	2024-06-20
62	62	62	87271.60	2024-07-05
63	63	63	311113.75	2024-08-27
64	64	64	121748.64	2025-05-21
65	65	65	175403.43	2025-04-06
66	66	66	307637.01	2025-07-01
67	67	67	334112.57	2025-09-21
68	68	68	328932.34	2024-03-16
69	69	69	301988.93	2024-07-07
70	70	70	440931.32	2025-09-03
71	71	71	27807.74	2025-02-12
72	72	72	82219.23	2025-06-05
73	73	73	527221.58	2024-03-18
74	74	74	599647.00	2024-12-15
75	75	75	212141.44	2024-09-11
76	76	76	195166.88	2024-06-25
77	77	77	331761.99	2025-01-05
78	78	78	222284.94	2025-08-11
79	79	79	133753.98	2024-08-01
80	80	80	286268.01	2024-08-15
81	81	81	337898.51	2025-08-31
82	82	82	103830.16	2025-11-06
83	83	83	89307.92	2024-03-21
84	84	84	501417.55	2025-03-12
85	85	85	87967.33	2025-01-13
86	86	86	248839.28	2024-11-20
87	87	87	47161.60	2024-05-27
88	88	88	334202.37	2025-07-23
89	89	89	160299.04	2025-09-04
90	90	90	306812.66	2024-07-25
91	91	91	28479.80	2025-09-23
92	92	92	209638.36	2025-08-30
93	93	93	471955.18	2025-05-12
94	94	94	301730.04	2025-09-12
95	95	95	293349.64	2024-09-27
96	96	96	304309.42	2025-04-24
97	97	97	81963.59	2025-03-27
98	98	98	177721.15	2025-08-30
99	99	99	106282.11	2024-11-23
100	100	100	13960.42	2025-02-24
\.


--
-- Data for Name: tax_registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_registration (registration_id, taxpayer_id, tax_type_id, tax_centre_id, registration_date) FROM stdin;
1	1	1	1	2024-02-01
2	2	2	2	2024-02-02
3	3	3	3	2024-02-03
4	4	4	4	2024-02-04
5	5	5	5	2024-02-05
6	6	6	6	2024-02-06
7	7	7	7	2024-02-07
8	8	8	8	2024-02-08
9	9	9	9	2024-02-09
10	10	10	10	2024-02-10
11	11	11	11	2024-02-11
12	12	12	12	2024-02-12
13	13	13	13	2024-02-13
14	14	14	14	2024-02-14
15	15	15	15	2024-02-15
16	16	16	16	2024-02-16
17	17	17	17	2024-02-17
18	18	18	18	2024-02-18
19	19	19	19	2024-02-19
20	20	20	20	2024-02-20
21	21	21	21	2024-02-21
22	22	22	22	2024-02-22
23	23	23	23	2024-02-23
24	24	24	24	2024-02-24
25	25	25	25	2024-02-25
26	26	26	26	2024-02-26
27	27	27	27	2024-02-27
28	28	28	28	2024-02-28
29	29	29	29	2024-02-29
30	30	30	30	2024-03-01
31	31	31	31	2024-03-02
32	32	32	32	2024-03-03
33	33	33	33	2024-03-04
34	34	34	34	2024-03-05
35	35	35	35	2024-03-06
36	36	36	36	2024-03-07
37	37	37	37	2024-03-08
38	38	38	38	2024-03-09
39	39	39	39	2024-03-10
40	40	40	40	2024-03-11
41	41	41	41	2024-03-12
42	42	42	42	2024-03-13
43	43	43	43	2024-03-14
44	44	44	44	2024-03-15
45	45	45	45	2024-03-16
46	46	46	46	2024-03-17
47	47	47	47	2024-03-18
48	48	48	48	2024-03-19
49	49	49	49	2024-03-20
50	50	50	50	2024-03-21
51	51	51	51	2024-03-22
52	52	52	52	2024-03-23
53	53	53	53	2024-03-24
54	54	54	54	2024-03-25
55	55	55	55	2024-03-26
56	56	56	56	2024-03-27
57	57	57	57	2024-03-28
58	58	58	58	2024-03-29
59	59	59	59	2024-03-30
60	60	60	60	2024-03-31
61	61	61	61	2024-04-01
62	62	62	62	2024-04-02
63	63	63	63	2024-04-03
64	64	64	64	2024-04-04
65	65	65	65	2024-04-05
66	66	66	66	2024-04-06
67	67	67	67	2024-04-07
68	68	68	68	2024-04-08
69	69	69	69	2024-04-09
70	70	70	70	2024-04-10
71	71	71	71	2024-04-11
72	72	72	72	2024-04-12
73	73	73	73	2024-04-13
74	74	74	74	2024-04-14
75	75	75	75	2024-04-15
76	76	76	76	2024-04-16
77	77	77	77	2024-04-17
78	78	78	78	2024-04-18
79	79	79	79	2024-04-19
80	80	80	80	2024-04-20
81	81	81	81	2024-04-21
82	82	82	82	2024-04-22
83	83	83	83	2024-04-23
84	84	84	84	2024-04-24
85	85	85	85	2024-04-25
86	86	86	86	2024-04-26
87	87	87	87	2024-04-27
88	88	88	88	2024-04-28
89	89	89	89	2024-04-29
90	90	90	90	2024-04-30
91	91	91	91	2024-05-01
92	92	92	92	2024-05-02
93	93	93	93	2024-05-03
94	94	94	94	2024-05-04
95	95	95	95	2024-05-05
96	96	96	96	2024-05-06
97	97	97	97	2024-05-07
98	98	98	98	2024-05-08
99	99	99	99	2024-05-09
100	100	100	100	2024-05-10
\.


--
-- Data for Name: tax_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_type (tax_type_id, tax_type_name, tax_rate, filing_frequency, effective_date) FROM stdin;
1	Value Added Tax	18.00	Monthly	2020-01-01
2	Pay As You Earn	30.00	Monthly	2020-01-01
3	Corporate Income Tax	28.00	Annually	2020-01-01
4	Withholding Tax	15.00	Monthly	2020-01-01
5	Property Tax	1.50	Annually	2020-01-01
6	Rental Income Tax	15.00	Quarterly	2020-01-01
7	Excise Duty	10.00	Monthly	2020-01-01
8	Capital Gains Tax	5.00	Annually	2020-01-01
9	Tourism Levy	3.00	Quarterly	2020-01-01
10	Environmental Tax	2.50	Annually	2020-01-01
11	Stamp Duty	12.00	Monthly	2020-01-01
12	Customs Duty	25.00	Monthly	2020-01-01
13	Import Duty	18.00	Monthly	2020-01-01
14	Export Duty	8.00	Quarterly	2020-01-01
15	Road Maintenance Levy	3.50	Annually	2020-01-01
16	Digital Services Tax	3.00	Monthly	2020-01-01
17	Insurance Premium Tax	5.00	Monthly	2020-01-01
18	Gaming Tax	15.00	Quarterly	2020-01-01
19	Hotel Occupancy Tax	8.00	Monthly	2020-01-01
20	Airport Service Charge	6.50	Monthly	2020-01-01
21	Telecommunication Levy	4.50	Monthly	2020-01-01
22	Business Licence Tax	4.00	Annually	2020-01-01
23	Construction Permit Fee	3.50	Annually	2020-01-01
24	Plastic Packaging Levy	2.00	Quarterly	2020-01-01
25	Carbon Emission Tax	4.50	Quarterly	2020-01-01
26	Agricultural Produce Tax	3.00	Annually	2020-01-01
27	Export Documentation Fee	1.50	Monthly	2020-01-01
28	Import Processing Fee	2.50	Monthly	2020-01-01
29	Financial Transaction Tax	1.00	Monthly	2020-01-01
30	Luxury Goods Tax	12.00	Quarterly	2020-01-01
31	Vehicle Registration Tax	7.00	Annually	2020-01-01
32	Motor Vehicle Tax	5.50	Annually	2020-01-01
33	Mining Royalty	8.50	Quarterly	2020-01-01
34	Forestry Levy	2.50	Annually	2020-01-01
35	Waste Management Levy	3.00	Quarterly	2020-01-01
36	Advertising Tax	4.00	Monthly	2020-01-01
37	Fire Safety Levy	2.00	Annually	2020-01-01
38	Infrastructure Development Levy	3.50	Quarterly	2020-01-01
39	Air Travel Tax	6.00	Monthly	2020-01-01
40	Luxury Vehicle Tax	15.00	Annually	2020-01-01
41	Commercial Vehicle Tax	8.00	Annually	2020-01-01
42	Small Business Tax	2.50	Quarterly	2020-01-01
43	Large Enterprise Tax	18.00	Annually	2020-01-01
44	Agricultural Export Levy	4.50	Quarterly	2020-01-01
45	Import Service Tax	5.00	Monthly	2020-01-01
46	Export Service Tax	5.50	Monthly	2020-01-01
47	Manufacturing Tax	7.50	Quarterly	2020-01-01
48	Industrial Development Levy	4.00	Annually	2020-01-01
49	Natural Resources Levy	6.50	Quarterly	2020-01-01
50	Petroleum Levy	9.00	Monthly	2020-01-01
51	Communication Service Tax	5.00	Monthly	2020-01-01
52	Public Health Levy	2.50	Quarterly	2020-01-01
53	Education Development Levy	3.00	Annually	2020-01-01
54	Urban Development Tax	4.50	Quarterly	2020-01-01
55	Municipal Service Tax	2.00	Monthly	2020-01-01
56	Foreign Investment Levy	7.00	Annually	2020-01-01
57	Business Expansion Tax	5.50	Quarterly	2020-01-01
58	Import Inspection Fee	2.50	Monthly	2020-01-01
59	Export Inspection Fee	2.50	Monthly	2020-01-01
60	Business Renewal Fee	3.00	Annually	2020-01-01
61	Road User Levy	3.50	Annually	2020-01-01
62	Solid Waste Collection Tax	2.50	Monthly	2020-01-01
63	Water Supply Levy	2.00	Quarterly	2020-01-01
64	Electricity Consumption Tax	6.00	Monthly	2020-01-01
65	Sewerage Service Levy	2.50	Quarterly	2020-01-01
66	Building Inspection Fee	3.50	Annually	2020-01-01
67	Land Registration Fee	2.50	Annually	2020-01-01
68	Business Permit Renewal Tax	4.00	Annually	2020-01-01
69	Public Market Levy	2.00	Monthly	2020-01-01
70	Cross Border Trade Levy	5.50	Quarterly	2020-01-01
71	Livestock Trading Tax	3.00	Quarterly	2020-01-01
72	Fishing Licence Levy	2.50	Annually	2020-01-01
73	Timber Harvest Levy	5.00	Quarterly	2020-01-01
74	Quarry Operations Tax	6.50	Quarterly	2020-01-01
75	Television Broadcasting Levy	2.00	Monthly	2020-01-01
76	Radio Broadcasting Levy	1.50	Monthly	2020-01-01
77	Parking Services Tax	3.00	Monthly	2020-01-01
78	Market Stall Tax	2.50	Monthly	2020-01-01
79	Advertising Billboard Levy	4.00	Quarterly	2020-01-01
80	Conference Services Tax	5.00	Monthly	2020-01-01
81	Freight Transport Levy	4.50	Quarterly	2020-01-01
82	Courier Service Tax	3.50	Monthly	2020-01-01
83	Postal Service Levy	2.00	Annually	2020-01-01
84	Cold Storage Facility Tax	4.00	Quarterly	2020-01-01
85	Warehouse Operations Levy	3.50	Quarterly	2020-01-01
86	Border Security Levy	3.00	Quarterly	2020-01-01
87	Maritime Service Tax	5.50	Monthly	2020-01-01
88	Aviation Fuel Levy	6.00	Monthly	2020-01-01
89	Passenger Service Charge	4.50	Monthly	2020-01-01
90	Port Handling Levy	3.50	Quarterly	2020-01-01
91	Telecom Infrastructure Levy	4.00	Annually	2020-01-01
92	E-Commerce Tax	5.00	Monthly	2020-01-01
93	Online Marketplace Levy	3.50	Quarterly	2020-01-01
94	Data Processing Tax	2.50	Monthly	2020-01-01
95	Cloud Computing Service Tax	4.00	Quarterly	2020-01-01
96	Electronic Payment Levy	2.00	Monthly	2020-01-01
97	Financial Services Levy	6.50	Quarterly	2020-01-01
98	Investment Income Tax	7.00	Annually	2020-01-01
99	Research and Innovation Levy	2.50	Annually	2020-01-01
100	Public Infrastructure Tax	5.50	Quarterly	2020-01-01
\.


--
-- Data for Name: taxpayer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taxpayer (taxpayer_id, taxpayer_tin, taxpayer_name, taxpayer_type, registration_date) FROM stdin;
1	100000001	John Smith	Individual	2024-01-10
2	100000002	Keza Ltd	Company	2024-01-11
3	100000003	Alice Uwase	Individual	2024-01-12
4	100000004	Vision Tech Ltd	Company	2024-01-15
5	100000005	Eric Niyonzima	Individual	2024-01-18
6	100000006	Hope Traders	Company	2024-01-20
7	100000007	Grace Mukamana	Individual	2024-01-25
8	100000008	Future Builders	Company	2024-02-01
9	100000009	Samuel Mugisha	Individual	2024-02-05
10	100000010	Smart Holdings	Company	2024-02-10
11	TIN100011	Aline Nyirahabimana	Individual	2024-02-01
12	TIN100012	East Africa Supplies Ltd	Company	2024-02-02
13	TIN100013	Jean Claude Mugenzi	Individual	2024-02-03
14	TIN100014	Kigali Supermarket Ltd	Company	2024-02-04
15	TIN100015	Vestine Umutoni	Individual	2024-02-05
16	TIN100016	Bright Future Academy	Company	2024-02-06
17	TIN100017	Didier Nsengimana	Individual	2024-02-07
18	TIN100018	Mountain Coffee Exporters	Company	2024-02-08
19	TIN100019	Beatha Mukeshimana	Individual	2024-02-09
20	TIN100020	Royal Furniture Ltd	Company	2024-02-10
21	TIN100021	Patrick Nizeyimana	Individual	2024-02-11
22	TIN100022	New Horizon Transport Ltd	Company	2024-02-12
23	TIN100023	Josiane Uwimana	Individual	2024-02-13
24	TIN100024	Excellent Pharmacy Ltd	Company	2024-02-14
25	TIN100025	Gilbert Habumuremyi	Individual	2024-02-15
26	TIN100026	Prime Engineering Ltd	Company	2024-02-16
27	TIN100027	Claudine Uwamahoro	Individual	2024-02-17
28	TIN100028	Modern Printing Services	Company	2024-02-18
29	TIN100029	Emmanuel Nkundimana	Individual	2024-02-19
30	TIN100030	Green Valley Hotel	Company	2024-02-20
31	TIN100031	Ange Iradukunda	Individual	2024-02-21
32	TIN100032	Reliable Motors Ltd	Company	2024-02-22
33	TIN100033	Claude Tuyisenge	Individual	2024-02-23
34	TIN100034	Sunshine Agriculture Ltd	Company	2024-02-24
35	TIN100035	Yvette Mukandayisenga	Individual	2024-02-25
36	TIN100036	Unity Construction Ltd	Company	2024-02-26
37	TIN100037	Francine Mukamugema	Individual	2024-02-27
38	TIN100038	Kivu Fisheries Ltd	Company	2024-02-28
39	TIN100039	Innocent Niyonzima	Individual	2024-02-29
40	TIN100040	Elite Security Ltd	Company	2024-03-01
41	TIN100041	Christine Uwase	Individual	2024-03-02
42	TIN100042	Smart Choice Electronics Ltd	Company	2024-03-03
43	TIN100043	Theogene Habimana	Individual	2024-03-04
44	TIN100044	Excellent Builders Ltd	Company	2024-03-05
45	TIN100045	Alice Uwera	Individual	2024-03-06
46	TIN100046	Crystal Water Ltd	Company	2024-03-07
47	TIN100047	Eric Tuyishime	Individual	2024-03-08
48	TIN100048	Rwanda Fresh Foods Ltd	Company	2024-03-09
49	TIN100049	Jeannette Mukarwego	Individual	2024-03-10
50	TIN100050	City Express Ltd	Company	2024-03-11
51	TIN100051	Aimable Nshimiyimana	Individual	2024-03-12
52	TIN100052	Vision Agro Ltd	Company	2024-03-13
53	TIN100053	Clarisse Nyiransabimana	Individual	2024-03-14
54	TIN100054	Lake View Hotel Ltd	Company	2024-03-15
55	TIN100055	Jean de Dieu Ndayambaje	Individual	2024-03-16
56	TIN100056	Modern Furniture Ltd	Company	2024-03-17
57	TIN100057	AgnŠs Mukarurangwa	Individual	2024-03-18
58	TIN100058	Skyline Logistics Ltd	Company	2024-03-19
59	TIN100059	Gilbert Mucyo	Individual	2024-03-20
60	TIN100060	Great Lakes Trading Ltd	Company	2024-03-21
61	TIN100061	Benitha Uwimana	Individual	2024-03-22
62	TIN100062	East Horizon Ltd	Company	2024-03-23
63	TIN100063	Jean Paul Nkurunziza	Individual	2024-03-24
64	TIN100064	Royal Paints Ltd	Company	2024-03-25
65	TIN100065	Aline Mukamana	Individual	2024-03-26
66	TIN100066	Topline Furniture Ltd	Company	2024-03-27
67	TIN100067	Patrick Nshimiyimana	Individual	2024-03-28
68	TIN100068	Green Hills Ltd	Company	2024-03-29
69	TIN100069	Esperance Uwamahoro	Individual	2024-03-30
70	TIN100070	Silver Star Hotel Ltd	Company	2024-03-31
71	TIN100071	David Ndayambaje	Individual	2024-04-01
72	TIN100072	Capital Investments Ltd	Company	2024-04-02
73	TIN100073	Anitha Nyiransabimana	Individual	2024-04-03
74	TIN100074	Rwanda Textile Ltd	Company	2024-04-04
75	TIN100075	Claude Muryango	Individual	2024-04-05
76	TIN100076	Blue Mountain Coffee Ltd	Company	2024-04-06
77	TIN100077	Florence Mukarubayiza	Individual	2024-04-07
78	TIN100078	Excellent Hardware Ltd	Company	2024-04-08
79	TIN100079	Isaac Mugiraneza	Individual	2024-04-09
80	TIN100080	Golden Vision Ltd	Company	2024-04-10
81	TIN100081	Yvonne Ingabire	Individual	2024-04-11
82	TIN100082	Prime Logistics Ltd	Company	2024-04-12
83	TIN100083	Thierry Habumuremyi	Individual	2024-04-13
84	TIN100084	Modern Supermarket Ltd	Company	2024-04-14
85	TIN100085	Vestine Nyirahabimana	Individual	2024-04-15
86	TIN100086	Victory Construction Ltd	Company	2024-04-16
87	TIN100087	Eric Manzi	Individual	2024-04-17
88	TIN100088	Bright Future Pharmacy Ltd	Company	2024-04-18
89	TIN100089	Gloria Uwamwezi	Individual	2024-04-19
90	TIN100090	Kigali Printing Services Ltd	Company	2024-04-20
91	TIN100091	Samuel Rugwizangoga	Individual	2024-04-21
92	TIN100092	Sunrise Motors Ltd	Company	2024-04-22
93	TIN100093	Chantal Mukeshimana	Individual	2024-04-23
94	TIN100094	East African Traders Ltd	Company	2024-04-24
95	TIN100095	Aim‚ Ndayisenga	Individual	2024-04-25
96	TIN100096	Unity Medical Centre Ltd	Company	2024-04-26
97	TIN100097	Sandrine Uwimbabazi	Individual	2024-04-27
98	TIN100098	Great Vision Academy Ltd	Company	2024-04-28
99	TIN100099	Fabrice Habimana	Individual	2024-04-29
100	TIN100100	Rwanda Premier Holdings Ltd	Company	2024-04-30
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle (vehicle_id, taxpayer_id, plate_number, vehicle_value, registration_date) FROM stdin;
1	1	RAA101A	18000000.00	2022-01-05
2	2	RAB202B	15000000.00	2022-02-10
3	3	RAC303C	45000000.00	2021-03-15
4	4	RAD404D	25000000.00	2023-01-20
5	5	RAE505E	12000000.00	2020-07-12
6	6	RAF606F	30000000.00	2022-04-25
7	7	RAG707G	14000000.00	2021-09-18
8	8	RAH808H	50000000.00	2020-10-10
9	9	RAI909I	17000000.00	2022-05-05
10	10	RAJ010J	55000000.00	2021-12-01
11	11	RAK011K	39057606.63	2021-02-02
12	12	RAL012L	55418899.12	2023-01-09
13	13	RAM013M	56198820.08	2022-08-14
14	14	RAN014N	12426049.36	2022-10-28
15	15	RAO015O	20726148.49	2021-03-30
16	16	RAP016P	55876655.46	2022-09-21
17	17	RAQ017Q	44621137.30	2021-03-10
18	18	RAR018R	26451874.74	2022-06-15
19	19	RAS019S	13517774.22	2021-01-30
20	20	RAT020T	18053328.50	2022-06-30
21	21	RAU021U	48494596.83	2022-01-20
22	22	RAV022V	19580566.91	2021-10-29
23	23	RAW023W	21941016.33	2022-04-07
24	24	RAX024X	31115102.70	2020-05-08
25	25	RAY025Y	31507701.82	2021-09-15
26	26	RAZ026Z	20587387.57	2023-08-28
27	27	RAA027A	51169574.72	2023-10-24
28	28	RAB028B	26426576.18	2021-07-01
29	29	RAC029C	29732146.63	2022-02-15
30	30	RAD030D	21455874.30	2020-06-06
31	31	RAE031E	30227721.61	2023-10-01
32	32	RAF032F	30921778.31	2022-08-08
33	33	RAG033G	20835002.19	2020-07-12
34	34	RAH034H	27275709.21	2020-02-14
35	35	RAI035I	28545221.80	2022-01-06
36	36	RAJ036J	10472192.94	2023-03-01
37	37	RAK037K	50969020.93	2020-03-11
38	38	RAL038L	31589404.41	2021-07-22
39	39	RAM039M	13286952.06	2020-11-04
40	40	RAN040N	30233733.83	2022-01-12
41	41	RAO041O	54820794.71	2023-03-11
42	42	RAP042P	33756706.40	2022-10-17
43	43	RAQ043Q	52192751.87	2022-11-11
44	44	RAR044R	25564706.13	2021-01-06
45	45	RAS045S	44554014.18	2023-10-31
46	46	RAT046T	53651661.65	2020-06-21
47	47	RAU047U	13297425.45	2023-03-24
48	48	RAV048V	27288270.42	2023-12-08
49	49	RAW049W	53785353.91	2020-08-31
50	50	RAX050X	43791308.00	2023-06-03
51	51	RAY051Y	48723940.63	2022-08-01
52	52	RAZ052Z	49611708.61	2020-10-14
53	53	RAA053A	44288408.30	2021-02-15
54	54	RAB054B	46910831.90	2023-01-25
55	55	RAC055C	32323812.91	2020-10-12
56	56	RAD056D	14061041.01	2020-11-03
57	57	RAE057E	54223749.75	2021-11-22
58	58	RAF058F	28750905.64	2020-05-02
59	59	RAG059G	37426839.08	2023-11-12
60	60	RAH060H	59927988.03	2022-08-06
61	61	RAI061I	12874666.52	2021-07-24
62	62	RAJ062J	43953220.33	2021-11-01
63	63	RAK063K	14531451.05	2020-11-11
64	64	RAL064L	22500911.01	2021-02-22
65	65	RAM065M	31249054.04	2022-12-09
66	66	RAN066N	59051568.58	2021-10-15
67	67	RAO067O	22217377.53	2021-07-28
68	68	RAP068P	42665483.65	2020-12-26
69	69	RAQ069Q	10605559.73	2023-07-20
70	70	RAR070R	29774197.36	2023-06-09
71	71	RAS071S	32940990.57	2023-03-12
72	72	RAT072T	12222904.12	2021-11-20
73	73	RAU073U	21926152.85	2021-07-13
74	74	RAV074V	33562801.13	2021-02-04
75	75	RAW075W	37616854.23	2023-01-01
76	76	RAX076X	25768130.25	2020-02-07
77	77	RAY077Y	56848714.03	2021-08-13
78	78	RAZ078Z	27277216.42	2022-01-16
79	79	RAA079A	54708005.86	2022-03-31
80	80	RAB080B	41918105.13	2021-03-27
81	81	RAC081C	35817674.80	2021-03-18
82	82	RAD082D	17406307.26	2020-09-03
83	83	RAE083E	17292693.61	2020-09-05
84	84	RAF084F	28496666.86	2022-07-05
85	85	RAG085G	53009186.41	2021-02-18
86	86	RAH086H	43835095.79	2023-11-08
87	87	RAI087I	51162021.59	2022-11-16
88	88	RAJ088J	43143057.53	2023-01-31
89	89	RAK089K	20446205.41	2022-07-27
90	90	RAL090L	37292084.16	2021-10-13
91	91	RAM091M	25010345.23	2021-09-08
92	92	RAN092N	46738734.42	2021-05-07
93	93	RAO093O	54105802.27	2021-02-20
94	94	RAP094P	32745082.89	2021-08-31
95	95	RAQ095Q	47567648.68	2021-05-18
96	96	RAR096R	12480708.28	2021-12-02
97	97	RAS097S	46996590.30	2022-06-17
98	98	RAT098T	31925888.09	2020-04-15
99	99	RAU099U	23449302.89	2023-12-25
100	100	RAV100V	20223153.59	2020-03-09
\.


--
-- Name: bank_bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_bank_id_seq', 1, false);


--
-- Name: tax_assessment_assessment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_assessment_assessment_id_seq', 1, false);


--
-- Name: tax_centre_tax_centre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_centre_tax_centre_id_seq', 1, false);


--
-- Name: tax_declaration_declaration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_declaration_declaration_id_seq', 1, false);


--
-- Name: tax_payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_payment_payment_id_seq', 1, false);


--
-- Name: tax_period_tax_period_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_period_tax_period_id_seq', 1, false);


--
-- Name: tax_registration_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_registration_registration_id_seq', 1, false);


--
-- Name: tax_type_tax_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_type_tax_type_id_seq', 1, false);


--
-- Name: taxpayer_taxpayer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taxpayer_taxpayer_id_seq', 10, true);


--
-- Name: audit_finding audit_finding_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_finding
    ADD CONSTRAINT audit_finding_pkey PRIMARY KEY (finding_id);


--
-- Name: bank bank_bank_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_bank_code_key UNIQUE (bank_code);


--
-- Name: bank bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (bank_id);


--
-- Name: business business_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (business_id);


--
-- Name: enforcement_case enforcement_case_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enforcement_case
    ADD CONSTRAINT enforcement_case_pkey PRIMARY KEY (enforcement_id);


--
-- Name: penalty penalty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penalty
    ADD CONSTRAINT penalty_pkey PRIMARY KEY (penalty_id);


--
-- Name: property property_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_pkey PRIMARY KEY (property_id);


--
-- Name: revenue_target revenue_target_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenue_target
    ADD CONSTRAINT revenue_target_pkey PRIMARY KEY (target_id);


--
-- Name: tax_assessment tax_assessment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_assessment
    ADD CONSTRAINT tax_assessment_pkey PRIMARY KEY (assessment_id);


--
-- Name: tax_audit tax_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_audit
    ADD CONSTRAINT tax_audit_pkey PRIMARY KEY (audit_id);


--
-- Name: tax_centre tax_centre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_centre
    ADD CONSTRAINT tax_centre_pkey PRIMARY KEY (tax_centre_id);


--
-- Name: tax_declaration tax_declaration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_declaration
    ADD CONSTRAINT tax_declaration_pkey PRIMARY KEY (declaration_id);


--
-- Name: tax_objection tax_objection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_objection
    ADD CONSTRAINT tax_objection_pkey PRIMARY KEY (objection_id);


--
-- Name: tax_officer tax_officer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_officer
    ADD CONSTRAINT tax_officer_pkey PRIMARY KEY (officer_id);


--
-- Name: tax_payment tax_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_payment
    ADD CONSTRAINT tax_payment_pkey PRIMARY KEY (payment_id);


--
-- Name: tax_period tax_period_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_period
    ADD CONSTRAINT tax_period_pkey PRIMARY KEY (tax_period_id);


--
-- Name: tax_refund tax_refund_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_refund
    ADD CONSTRAINT tax_refund_pkey PRIMARY KEY (refund_id);


--
-- Name: tax_registration tax_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_registration
    ADD CONSTRAINT tax_registration_pkey PRIMARY KEY (registration_id);


--
-- Name: tax_type tax_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_type
    ADD CONSTRAINT tax_type_pkey PRIMARY KEY (tax_type_id);


--
-- Name: tax_type tax_type_tax_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_type
    ADD CONSTRAINT tax_type_tax_type_name_key UNIQUE (tax_type_name);


--
-- Name: taxpayer taxpayer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxpayer
    ADD CONSTRAINT taxpayer_pkey PRIMARY KEY (taxpayer_id);


--
-- Name: taxpayer taxpayer_taxpayer_tin_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxpayer
    ADD CONSTRAINT taxpayer_taxpayer_tin_key UNIQUE (taxpayer_tin);


--
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (vehicle_id);


--
-- Name: vehicle vehicle_plate_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_plate_number_key UNIQUE (plate_number);


--
-- Name: tax_audit fk_audit_officer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_audit
    ADD CONSTRAINT fk_audit_officer FOREIGN KEY (officer_id) REFERENCES public.tax_officer(officer_id);


--
-- Name: tax_audit fk_audit_taxpayer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_audit
    ADD CONSTRAINT fk_audit_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: business fk_business_taxpayer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT fk_business_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: enforcement_case fk_enforcement_officer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enforcement_case
    ADD CONSTRAINT fk_enforcement_officer FOREIGN KEY (officer_id) REFERENCES public.tax_officer(officer_id);


--
-- Name: enforcement_case fk_enforcement_taxpayer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enforcement_case
    ADD CONSTRAINT fk_enforcement_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: audit_finding fk_finding_audit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_finding
    ADD CONSTRAINT fk_finding_audit FOREIGN KEY (audit_id) REFERENCES public.tax_audit(audit_id);


--
-- Name: audit_finding fk_finding_tax_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_finding
    ADD CONSTRAINT fk_finding_tax_type FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);


--
-- Name: tax_objection fk_objection_assessment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_objection
    ADD CONSTRAINT fk_objection_assessment FOREIGN KEY (assessment_id) REFERENCES public.tax_assessment(assessment_id);


--
-- Name: tax_objection fk_objection_taxpayer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_objection
    ADD CONSTRAINT fk_objection_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: penalty fk_penalty_assessment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penalty
    ADD CONSTRAINT fk_penalty_assessment FOREIGN KEY (assessment_id) REFERENCES public.tax_assessment(assessment_id);


--
-- Name: property fk_property_taxpayer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT fk_property_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: tax_refund fk_refund_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_refund
    ADD CONSTRAINT fk_refund_payment FOREIGN KEY (payment_id) REFERENCES public.tax_payment(payment_id);


--
-- Name: tax_refund fk_refund_taxpayer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_refund
    ADD CONSTRAINT fk_refund_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: revenue_target fk_target_centre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenue_target
    ADD CONSTRAINT fk_target_centre FOREIGN KEY (tax_centre_id) REFERENCES public.tax_centre(tax_centre_id);


--
-- Name: revenue_target fk_target_tax_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenue_target
    ADD CONSTRAINT fk_target_tax_type FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);


--
-- Name: tax_officer fk_tax_officer_tax_centre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_officer
    ADD CONSTRAINT fk_tax_officer_tax_centre FOREIGN KEY (tax_centre_id) REFERENCES public.tax_centre(tax_centre_id);


--
-- Name: vehicle fk_vehicle_taxpayer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT fk_vehicle_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: tax_assessment tax_assessment_declaration_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_assessment
    ADD CONSTRAINT tax_assessment_declaration_id_fkey FOREIGN KEY (declaration_id) REFERENCES public.tax_declaration(declaration_id);


--
-- Name: tax_assessment tax_assessment_officer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_assessment
    ADD CONSTRAINT tax_assessment_officer_id_fkey FOREIGN KEY (officer_id) REFERENCES public.tax_officer(officer_id);


--
-- Name: tax_declaration tax_declaration_registration_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_declaration
    ADD CONSTRAINT tax_declaration_registration_id_fkey FOREIGN KEY (registration_id) REFERENCES public.tax_registration(registration_id);


--
-- Name: tax_declaration tax_declaration_tax_period_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_declaration
    ADD CONSTRAINT tax_declaration_tax_period_id_fkey FOREIGN KEY (tax_period_id) REFERENCES public.tax_period(tax_period_id);


--
-- Name: tax_payment tax_payment_assessment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_payment
    ADD CONSTRAINT tax_payment_assessment_id_fkey FOREIGN KEY (assessment_id) REFERENCES public.tax_assessment(assessment_id);


--
-- Name: tax_payment tax_payment_bank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_payment
    ADD CONSTRAINT tax_payment_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES public.bank(bank_id);


--
-- Name: tax_period tax_period_tax_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_period
    ADD CONSTRAINT tax_period_tax_type_id_fkey FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);


--
-- Name: tax_registration tax_registration_tax_centre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_registration
    ADD CONSTRAINT tax_registration_tax_centre_id_fkey FOREIGN KEY (tax_centre_id) REFERENCES public.tax_centre(tax_centre_id);


--
-- Name: tax_registration tax_registration_tax_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_registration
    ADD CONSTRAINT tax_registration_tax_type_id_fkey FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);


--
-- Name: tax_registration tax_registration_taxpayer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_registration
    ADD CONSTRAINT tax_registration_taxpayer_id_fkey FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- PostgreSQL database dump complete
--

\unrestrict hQnFXWywuQMylckhU7ULsBNgsvyzYzIHecDVaJwpyCMwf3QcrhwDS2JtQIXd3Os

