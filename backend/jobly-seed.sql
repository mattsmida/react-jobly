--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: applications; Type: TABLE; Schema: public; Owner: matt
--

CREATE TABLE public.applications (
    username character varying(25) NOT NULL,
    job_id integer NOT NULL
);


ALTER TABLE public.applications OWNER TO matt;

--
-- Name: companies; Type: TABLE; Schema: public; Owner: matt
--

CREATE TABLE public.companies (
    handle character varying(25) NOT NULL,
    name text NOT NULL,
    num_employees integer,
    description text NOT NULL,
    logo_url text,
    CONSTRAINT companies_handle_check CHECK (((handle)::text = lower((handle)::text))),
    CONSTRAINT companies_num_employees_check CHECK ((num_employees >= 0))
);


ALTER TABLE public.companies OWNER TO matt;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: matt
--

CREATE TABLE public.jobs (
    id integer NOT NULL,
    title text NOT NULL,
    salary integer,
    equity numeric,
    company_handle character varying(25) NOT NULL,
    CONSTRAINT jobs_equity_check CHECK ((equity <= 1.0)),
    CONSTRAINT jobs_salary_check CHECK ((salary >= 0))
);


ALTER TABLE public.jobs OWNER TO matt;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO matt;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: matt
--

CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    password text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    is_admin boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_check CHECK ((POSITION(('@'::text) IN (email)) > 1))
);


ALTER TABLE public.users OWNER TO matt;

--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.applications (username, job_id) FROM stdin;
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.companies (handle, name, num_employees, description, logo_url) FROM stdin;
bauer-gallagher	Bauer-Gallagher	862	Redefining urban mobility through innovative transportation solutions.	\N
edwards-lee-reese	Edwards, Lee and Reese	744	Enhancing business efficiency with virtual reality technology tailored for industry needs.	/logos/logo2.png
baker-santos	Baker-Santos	225	Transforming the way we access clean water through sustainable purification techniques.	/logos/logo3.png
boyd-evans	Boyd-Evans	698	Creating a new era of transportation with pioneering flying car advancements.	/logos/logo4.png
anderson-arias-morrow	Anderson, Arias and Morrow	245	Amplifying music enjoyment with a diverse range of premium audio accessories.	/logos/logo3.png
arnold-berger-townsend	Arnold, Berger and Townsend	795	Embracing sustainability with eco-conscious home and garden product offerings.	\N
davis-davis	Davis-Davis	23	Ensuring data security through cutting-edge cybersecurity solutions for businesses.	\N
ayala-buchanan	Ayala-Buchanan	309	Inspiring brand growth with strategic marketing and creative branding approaches.	\N
burton-ltd	Burton Ltd	610	Harnessing solar energy for a greener future with advanced panel technology.	/logos/logo4.png
carr-wells-jones	Carr, Wells and Jones	27	Advancing healthcare with cutting-edge medical devices and software innovations.	/logos/logo3.png
erickson-inc	Erickson Inc	267	Innovating virtual reality solutions to transform business operations globally.	/logos/logo4.png
foster-rice	Foster-Rice	901	Committed to providing clean drinking water through sustainable purification methods.	\N
garcia-ray	Garcia-Ray	217	Leading the way in futuristic transportation with cutting-edge flying car technology.	/logos/logo2.png
garner-michael	Garner-Michael	940	Elevating the music experience with a range of premium audio products and accessories.	\N
gillespie-smith	Gillespie-Smith	302	Empowering sustainable living with eco-friendly home and garden solutions.	/logos/logo1.png
graham-herring-lane	Graham, Herring and Lane	188	Protecting businesses with state-of-the-art cybersecurity measures against advanced threats.	/logos/logo4.png
hall-davis	Hall-Davis	749	Elevating brands with creative marketing strategies and innovative branding solutions.	/logos/logo2.png
hall-mills	Hall-Mills	266	Harnessing solar power with advanced panel technology for renewable energy solutions.	/logos/logo3.png
hudson-inc	Hudson Inc	627	Revolutionizing healthcare with groundbreaking medical devices and software innovations.	\N
humphrey-llc	Humphrey LLC	678	Nurturing healthy lifestyles through organic, locally sourced food products.	/logos/logo4.png
ingram-ferguson-rubio	Ingram, Ferguson and Rubio	753	Redefining urban mobility through innovative transportation solutions.	/logos/logo3.png
jackson-davila-conley	Jackson, Davila and Conley	813	Enhancing business efficiency with virtual reality technology tailored for industry needs.	/logos/logo4.png
jackson-sons	Jackson and Sons	649	Transforming the way we access clean water through sustainable purification techniques.	/logos/logo4.png
logan-miller	Logan-Miller	429	Creating a new era of transportation with pioneering flying car advancements.	\N
martinez-daniels	Martinez-Daniels	12	Amplifying music enjoyment with a diverse range of premium audio accessories.	/logos/logo4.png
mejia-scott-ryan	Mejia, Scott and Ryan	\N	Embracing sustainability with eco-conscious home and garden product offerings.	/logos/logo4.png
miller-woods-hernandez	Miller, Woods and Hernandez	444	Ensuring data security through cutting-edge cybersecurity solutions for businesses.	/logos/logo4.png
mitchell-brown	Mitchell-Brown	288	Inspiring brand growth with strategic marketing and creative branding approaches.	/logos/logo1.png
moore-plc	Moore PLC	100	Harnessing solar energy for a greener future with advanced panel technology.	\N
morgan-sullivan	Morgan-Sullivan	409	Advancing healthcare with cutting-edge medical devices and software innovations.	\N
mueller-moore	Mueller-Moore	932	Cultivating a culture of wellness through organic, locally sourced food options.	/logos/logo2.png
norman-harvey	Norman-Harvey	\N	Redefining urban landscapes with innovative transportation solutions for all.	/logos/logo4.png
owen-newton	Owen-Newton	953	Delivering clean water solutions through sustainable purification practices.	\N
perez-miller	Perez-Miller	298	Shaping the future of transportation with forward-thinking flying car technology.	/logos/logo4.png
pugh-ltd	Pugh Ltd	87	Enhancing music experiences with premium audio products designed for quality.  	/logos/logo2.png
reynolds-greene	Reynolds-Greene	343	Innovating virtual reality solutions to transform business operations globally.	/logos/logo2.png
rivas-llc	Rivas LLC	552	Committed to providing clean drinking water through sustainable purification methods.	\N
robbins-marsh-martin	Robbins, Marsh and Martin	709	Leading the way in futuristic transportation with cutting-edge flying car technology.	/logos/logo3.png
russo-gillespie-conrad	Russo, Gillespie and Conrad	398	Elevating the music experience with a range of premium audio products and accessories.	/logos/logo2.png
salas-group	Salas Group	624	Empowering sustainable living with eco-friendly home and garden solutions.	/logos/logo4.png
scott-smith	Scott-Smith	993	Protecting businesses with state-of-the-art cybersecurity measures against advanced threats.	/logos/logo2.png
sellers-bryant	Sellers-Bryant	369	Elevating brands with creative marketing strategies and innovative branding solutions.	/logos/logo3.png
smith-llc	Smith LLC	908	Harnessing solar power with advanced panel technology for renewable energy solutions.	\N
stone-stewart	Stone-Stewart	459	Revolutionizing healthcare with groundbreaking medical devices and software innovations.	\N
taylor-yu-lee	Taylor, Yu and Lee	226	Nurturing healthy lifestyles through organic, locally sourced food products.	/logos/logo2.png
thomas-sons	Thomas and Sons	51	Redefining urban mobility through innovative transportation solutions.	/logos/logo1.png
watson-davis	Watson-Davis	819	Enhancing business efficiency with virtual reality technology tailored for industry needs.	/logos/logo3.png
weber-hernandez	Weber-Hernandez	681	Transforming the way we access clean water through sustainable purification techniques.	/logos/logo4.png
wiggins-frederick-boyer	Wiggins, Frederick and Boyer	298	Creating a new era of transportation with pioneering flying car advancements.	/logos/logo2.png
willis-henson-miller	Willis, Henson and Miller	821	Amplifying music enjoyment with a diverse range of premium audio accessories.	\N
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.jobs (id, title, salary, equity, company_handle) FROM stdin;
1	Conservator, furniture	110000	0	watson-davis
2	Information officer	200000	0	hall-mills
3	Consulting civil engineer	60000	0	sellers-bryant
4	Early years teacher	55000	0	perez-miller
5	Intelligence analyst	77000	0	garner-michael
6	Surveyor, building	144000	0	russo-gillespie-conrad
7	Technical brewer	157000	0	anderson-arias-morrow
8	Control and instrumentation engineer	171000	0	salas-group
9	Photographer	198000	0	davis-davis
10	Multimedia programmer	192000	0	graham-herring-lane
11	English as a foreign language teacher	111000	0	russo-gillespie-conrad
12	Passenger transport manager	70000	0	rivas-llc
13	Psychologist, clinical	172000	0	hudson-inc
14	Financial planner	115000	0	taylor-yu-lee
15	Scientist, forensic	50000	0	foster-rice
16	Occupational therapist	183000	0	garcia-ray
17	Ophthalmologist	135000	0	hall-mills
18	Embryologist, clinical	138000	0	anderson-arias-morrow
19	Marine scientist	54000	0	scott-smith
20	Tourist information centre manager	88000	0	foster-rice
21	Interior and spatial designer	177000	0	gillespie-smith
22	Surveyor, rural practice	193000	0	weber-hernandez
23	Colour technologist	81000	0	burton-ltd
24	Technical brewer	77000	0	thomas-sons
25	Pharmacist, hospital	194000	0	boyd-evans
26	Medical sales representative	125000	0	jackson-davila-conley
27	Energy engineer	62000	0	norman-harvey
28	Research officer, government	167000	0	mejia-scott-ryan
29	Barrister	130000	0	stone-stewart
30	Loss adjuster, chartered	76000	0	bauer-gallagher
31	Database administrator	79000	0	willis-henson-miller
32	IT consultant	59000	0	gillespie-smith
33	Museum/gallery conservator	82000	0	mejia-scott-ryan
34	Engineering geologist	170000	0	garcia-ray
35	Television production assistant	125000	0	logan-miller
36	Accountant, chartered certified	175000	0	stone-stewart
37	Merchant navy officer	106000	0	mitchell-brown
38	Medical physicist	84000	0	perez-miller
39	Podiatrist	68000	\N	reynolds-greene
40	Nurse, children's	162000	\N	humphrey-llc
41	Teacher, music	127000	\N	ingram-ferguson-rubio
42	Occupational hygienist	79000	\N	reynolds-greene
43	Research officer, political party	134000	\N	garner-michael
44	Therapist, occupational	82000	\N	mejia-scott-ryan
45	Teacher, secondary school	127000	\N	sellers-bryant
46	Scientist, product/process development	106000	\N	scott-smith
47	Astronomer	143000	\N	watson-davis
48	Counsellor	\N	0	owen-newton
49	Financial controller	\N	0	sellers-bryant
50	Advertising account executive	\N	0	thomas-sons
51	Buyer, industrial	\N	\N	reynolds-greene
52	Interpreter	55000	0	hudson-inc
53	Best boy	\N	0	jackson-sons
54	Freight forwarder	183000	0	hudson-inc
55	Designer, jewellery	\N	0	weber-hernandez
56	Tree surgeon	\N	0.001	hall-davis
57	Management consultant	183000	0	edwards-lee-reese
58	Ergonomist	160000	0	bauer-gallagher
59	Psychologist, forensic	176000	0	boyd-evans
60	Architectural technologist	57000	0	owen-newton
61	Patent attorney	143000	0	foster-rice
62	Art gallery manager	\N	0.085	anderson-arias-morrow
63	Engineer, chemical	81000	0	russo-gillespie-conrad
64	Speech and language therapist	159000	0	gillespie-smith
65	Orthoptist	200000	0	perez-miller
66	Camera operator	130000	0	arnold-berger-townsend
67	Field trials officer	137000	0	davis-davis
68	Transport planner	\N	\N	reynolds-greene
69	Bonds trader	\N	\N	mitchell-brown
70	Editor, magazine features	118000	0.002	foster-rice
71	Applications developer	84000	0.091	sellers-bryant
72	Clothing/textile technologist	171000	0.041	smith-llc
73	Secretary/administrator	172000	0.096	jackson-sons
74	Field seismologist	62000	0.064	martinez-daniels
75	Engineer, materials	185000	0.081	garner-michael
76	Race relations officer	97000	0.065	bauer-gallagher
77	Engineering geologist	89000	0.043	ayala-buchanan
78	Aeronautical engineer	135000	0.078	norman-harvey
79	Development worker, community	192000	0.047	weber-hernandez
80	Speech and language therapist	154000	0.014	humphrey-llc
81	Health promotion specialist	72000	0.010	burton-ltd
82	Careers adviser	57000	0.051	carr-wells-jones
83	Surveyor, minerals	98000	0.037	carr-wells-jones
84	Forest/woodland manager	156000	0.030	carr-wells-jones
85	Haematologist	63000	0.062	ayala-buchanan
86	Advertising account executive	130000	0.064	thomas-sons
87	Ship broker	124000	0.045	davis-davis
88	Fisheries officer	67000	0.062	hall-davis
89	Air cabin crew	105000	0.077	ingram-ferguson-rubio
90	Financial trader	153000	0.012	garner-michael
91	Paramedic	122000	0.047	baker-santos
92	Historic buildings inspector/conservation officer	129000	0.052	watson-davis
93	Transport planner	123000	0.091	hudson-inc
94	Public librarian	115000	0.099	norman-harvey
96	Designer, fashion/clothing	81000	0.026	garcia-ray
97	Information systems manager	123000	0.100	arnold-berger-townsend
98	Art gallery manager	73000	0.054	perez-miller
99	Operational researcher	167000	0.020	ayala-buchanan
100	Solicitor	131000	0.034	wiggins-frederick-boyer
101	Intelligence analyst	148000	0	sellers-bryant
102	Naval architect	126000	0	scott-smith
103	Dealer	175000	0	hall-mills
104	Multimedia programmer	154000	\N	owen-newton
105	Psychologist, occupational	190000	\N	robbins-marsh-martin
106	Leisure centre manager	135000	\N	edwards-lee-reese
107	Television production assistant	99000	\N	edwards-lee-reese
108	Historic buildings inspector/conservation officer	135000	\N	rivas-llc
109	Sports development officer	102000	\N	scott-smith
110	Investment banker, corporate	131000	\N	ingram-ferguson-rubio
111	Conservation officer, historic buildings	168000	\N	robbins-marsh-martin
112	Physicist, medical	190000	\N	humphrey-llc
113	Press sub	100000	\N	erickson-inc
114	Engineer, civil (contracting)	\N	0.018	moore-plc
115	Therapist, music	103000	0.087	reynolds-greene
116	Water engineer	\N	0.028	mejia-scott-ryan
117	Engineer, energy	\N	0.048	arnold-berger-townsend
118	Plant breeder/geneticist	\N	0.081	thomas-sons
119	Oceanographer	\N	0.097	anderson-arias-morrow
120	Clinical cytogeneticist	152000	0.027	mitchell-brown
121	Nature conservation officer	82000	0.093	watson-davis
122	Insurance underwriter	\N	0.008	hall-davis
123	Chief of Staff	110000	0.016	scott-smith
124	Surveyor, insurance	\N	0.066	foster-rice
125	Surveyor, building control	\N	\N	reynolds-greene
126	Trade mark attorney	\N	\N	mueller-moore
127	Glass blower/designer	126000	0.099	anderson-arias-morrow
128	Geochemist	130000	0.004	smith-llc
129	Scientist, research (physical sciences)	117000	0.090	ayala-buchanan
130	Historic buildings inspector/conservation officer	65000	0.075	mejia-scott-ryan
131	Surveyor, insurance	130000	0.009	martinez-daniels
132	Contractor	89000	0.065	mueller-moore
133	Hydrologist	50000	0.097	wiggins-frederick-boyer
134	Aeronautical engineer	156000	0.055	perez-miller
135	Freight forwarder	183000	0.093	burton-ltd
136	Engineer, materials	140000	0.057	mitchell-brown
137	Product designer	184000	0.090	gillespie-smith
138	Editor, film/video	199000	0.070	bauer-gallagher
139	Fashion designer	131000	0.080	taylor-yu-lee
140	Legal secretary	155000	0.080	pugh-ltd
141	Financial risk analyst	72000	0.001	scott-smith
142	Regulatory affairs officer	96000	0.061	logan-miller
143	Ranger/warden	86000	0.095	ayala-buchanan
144	Farm manager	138000	0.085	stone-stewart
145	Primary school teacher	142000	0.036	moore-plc
146	Quality manager	138000	0.002	russo-gillespie-conrad
147	Radio producer	99000	0.038	mitchell-brown
148	Music therapist	100000	0.058	taylor-yu-lee
149	Farm manager	68000	0.049	morgan-sullivan
150	Camera operator	51000	0.066	jackson-davila-conley
151	Engineer, technical sales	167000	0.077	ingram-ferguson-rubio
152	Ranger/warden	145000	0.046	jackson-davila-conley
153	Lawyer	162000	0.072	hall-mills
154	Estate manager/land agent	94000	0.008	jackson-davila-conley
155	Orthoptist	129000	0.062	willis-henson-miller
156	Recycling officer	57000	0.098	carr-wells-jones
157	Scientist, research (life sciences)	157000	0.057	ayala-buchanan
158	Armed forces technical officer	136000	0.012	scott-smith
159	Public relations officer	112000	0.087	weber-hernandez
160	Set designer	132000	0.055	russo-gillespie-conrad
161	Accountant, chartered certified	86000	0.070	boyd-evans
162	Special effects artist	101000	0.023	willis-henson-miller
163	Glass blower/designer	60000	0.095	mueller-moore
164	Print production planner	197000	0.095	humphrey-llc
165	Psychologist, counselling	180000	0.008	perez-miller
166	Meteorologist	81000	0.037	sellers-bryant
167	Therapist, drama	200000	0.095	hall-mills
168	Engineer, technical sales	157000	0.083	baker-santos
169	Scientist, audiological	61000	0.095	foster-rice
170	Dietitian	198000	0	ayala-buchanan
171	Electrical engineer	157000	\N	jackson-davila-conley
172	Agricultural consultant	67000	\N	moore-plc
173	Geochemist	104000	\N	hudson-inc
174	Geologist, engineering	116000	\N	jackson-davila-conley
175	Clinical biochemist	92000	\N	norman-harvey
176	Probation officer	128000	\N	foster-rice
177	Chief Executive Officer	83000	\N	miller-woods-hernandez
178	Surveyor, building	144000	0.007	salas-group
179	Engineer, water	165000	0.010	ingram-ferguson-rubio
180	Psychologist, counselling	111000	0.059	taylor-yu-lee
181	Astronomer	55000	0.074	martinez-daniels
182	Medical physicist	110000	0.015	mitchell-brown
183	Chief Technology Officer	64000	0.067	robbins-marsh-martin
184	Arboriculturist	191000	0.062	salas-group
185	Conservation officer, nature	108000	0.006	jackson-davila-conley
186	Psychologist, sport and exercise	172000	0.061	ayala-buchanan
187	Designer, furniture	149000	0.041	mueller-moore
188	Chartered loss adjuster	72000	0.084	davis-davis
189	Producer, radio	168000	0.010	salas-group
190	Operational investment banker	200000	0.022	smith-llc
191	Surveyor, quantity	72000	0.071	mejia-scott-ryan
192	Ship broker	177000	0	hall-davis
193	Bookseller	164000	0	reynolds-greene
194	Medical sales representative	196000	0	hall-mills
195	Copy	103000	0	foster-rice
196	Engineer, broadcasting (operations)	86000	0	baker-santos
197	Fashion designer	137000	0	reynolds-greene
198	Learning disability nurse	66000	\N	ayala-buchanan
199	Research scientist (medical)	175000	\N	norman-harvey
200	Accommodation manager	126000	\N	mejia-scott-ryan
95	PA to Tucker Diane	172000	0.091	anderson-arias-morrow
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.users (username, password, first_name, last_name, email, is_admin) FROM stdin;
testuser	$2b$12$AZH7virni5jlTTiGgEg4zu3lSvAw68qVEfSIOjJ3RqtbJbdW/Oi5q	Test	User	joel@joelburton.com	f
testadmin	$2b$12$AZH7virni5jlTTiGgEg4zu3lSvAw68qVEfSIOjJ3RqtbJbdW/Oi5q	Test	Admin!	joel@joelburton.com	t
expressman	$2b$12$GSGMfwy9BfppOypVHKhwGeLKvC62VSSWRTjhQh0CLUM.k2T33IM.K	express	man	e@e.com	f
jules	$2b$12$VL05sH676gB20eprpVWlp.3G9gQezz9TDNCpi0vuKd.94BG3fz7Eu	jules	c	j@j.co	f
nodeman	$2b$12$13.yjUbMWMeDjY6VDVAO9.Zs4.fmTEFlK21FNTAG0PLIXmwii5w1W	node	man	n@n.co	f
flaskman	$2b$12$AjON9kYFUkhu2CYllS9yc.JR2NyzY6u1YnkfWvKo90Fa0WhSsnbI2	flask	man	f@f.man	f
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.jobs_id_seq', 400, true);


--
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (username, job_id);


--
-- Name: companies companies_name_key; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_name_key UNIQUE (name);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (handle);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: applications applications_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(id) ON DELETE CASCADE;


--
-- Name: applications applications_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) ON DELETE CASCADE;


--
-- Name: jobs jobs_company_handle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_company_handle_fkey FOREIGN KEY (company_handle) REFERENCES public.companies(handle) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

