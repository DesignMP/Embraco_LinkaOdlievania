[LIT]
9
11	118	41	151	41
14	65	28	126	28
15	65	41	91	41
16	65	28	65	41
22	63	28	65	28
23	25	28	50	28
24	29	39	48	39
25	48	39	48	32
26	48	32	50	32

[TET]
5
0	4	27	25	29	4	5	OkruhCS_Aktivny
1	126	27	142	29	4	3	soOtocnyStol
12	135	44	151	46	4	5	TIME#500ms
13	164	40	189	42	4	3	Release_soOtocnyStol
17	1	38	29	40	4	5	OkruhOplotenia_Aktivny

[FBS]
3
4	93	37	116	45	1	SAFEBOOL_TO_BOOL	
9	153	37	162	49	0	TON	CasRelease_soOtocnyStol
21	52	24	61	36	1	AND_S	

[FPT]
9
2	93	40	95	42		0	640	0	SAFEBOOL
3	115	40	116	42		1	0	640	BOOL
5	153	40	158	42	IN	0	129	0	BOOL
6	153	44	158	46	PT	0	128	0	TIME
7	159	40	162	42	Q	1	0	129	BOOL
8	158	44	162	46	ET	1	0	128	TIME
18	52	27	54	29		0	1665	0	ANY_SAFEBIT
19	52	31	54	33		0	1665	0	ANY_SAFEBIT
20	60	27	61	29		1	0	641	ANY_SAFEBIT

[KOT]
0

[VER]
0
