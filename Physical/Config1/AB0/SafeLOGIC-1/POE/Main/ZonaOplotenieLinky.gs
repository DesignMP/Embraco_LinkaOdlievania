[LIT]
11
11	150	55	172	55
12	172	55	172	56
13	172	56	174	56
16	86	41	158	41
17	86	55	123	55
18	86	41	86	55
24	63	41	69	41
25	82	41	86	41
26	64	53	67	53
27	67	53	67	45
28	67	45	69	45

[TET]
5
0	42	40	63	42	4	5	OkruhCS_Aktivny
1	158	40	178	42	4	3	soOplotenieLinky
14	158	59	174	61	4	5	TIME#500ms
15	187	55	216	57	4	3	Release_soOplotenieLinky
19	36	52	64	54	4	5	OkruhOplotenia_Aktivny

[FBS]
3
4	125	51	148	59	1	SAFEBOOL_TO_BOOL	
9	176	52	185	64	0	TON	CasRelease_soOplotenieLinky
23	71	37	80	49	1	AND_S	

[FPT]
9
2	125	54	127	56		0	640	0	SAFEBOOL
3	147	54	148	56		1	0	640	BOOL
5	176	55	181	57	IN	0	129	0	BOOL
6	176	59	181	61	PT	0	128	0	TIME
7	182	55	185	57	Q	1	0	129	BOOL
8	181	59	185	61	ET	1	0	128	TIME
20	71	40	73	42		0	1665	0	ANY_SAFEBIT
21	71	44	73	46		0	1665	0	ANY_SAFEBIT
22	79	40	80	42		1	0	641	ANY_SAFEBIT

[KOT]
0

[VER]
0

