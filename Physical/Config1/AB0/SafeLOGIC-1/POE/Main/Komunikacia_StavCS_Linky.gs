[LIT]
6
10	151	50	175	50
17	90	38	102	38
18	102	38	160	38
19	102	50	124	50
20	102	38	102	50
21	54	38	63	38

[TET]
4
0	160	37	186	39	4	3	soStavCS_HlavnejLinky
11	159	53	175	55	4	5	TIME#500ms
12	188	49	223	51	4	3	Release_soStavCS_HlavnejLinky
13	25	37	54	39	4	5	CSLinkyOdlievaniaAktivne

[FBS]
3
3	126	46	149	54	1	SAFEBOOL_TO_BOOL	
8	177	46	186	58	0	TON	CasRelease_soStavCS_HlavLinky
16	65	34	88	42	1	BOOL_TO_SAFEBOOL	

[FPT]
8
1	126	49	128	51		0	640	0	SAFEBOOL
2	148	49	149	51		1	0	640	BOOL
4	177	49	182	51	IN	0	129	0	BOOL
5	177	53	182	55	PT	0	128	0	TIME
6	183	49	186	51	Q	1	0	129	BOOL
7	182	53	186	55	ET	1	0	128	TIME
14	65	37	67	39		0	640	0	BOOL
15	87	37	88	39		1	0	640	SAFEBOOL

[KOT]
0

[VER]
0

