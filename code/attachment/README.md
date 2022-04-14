# Attachment 

## Study

L'obbiettivo dello studio è di valutare la relazione tra attaccamento verso la madre nei bambini del 3° e 4° anno di scuola primaria.

## Data
Nel dataset abbiamo le seguenti variabili

- `id`: codice identificativo  di ogni bambino
- `classe`: classe frequentata dal bambino (3°anno o 4°anno scuole primarie)
- `genere`: genere del bambino (0=M; 1=F)
- `ssm*` (da 1 a 15): item del questionario sicurezza materna
- `sdq*` (da 1 a 25): idem del questionario problemi internalizzanti e esternalizzanti


## Scoring Questionari

### SSM (Security Scale Mother)

Questionario con 15 item a risposte su scala likert a 4 punti.Le risposte sono codificate come 1-2-3-4.

Il punteggio totale è dato dalla media degli item. Punteggi più alti indicano maggiore sicurezza.

Tuttavia per costruire il punteggio finale è necessario invertire i punteggi degli item 1, 3, 4, 9, 10, 13, e 15.

Ovvero: 1-->4; 2-->3; 3-->2; 4-->1.

### SDQ (Strength and Difficulties Questionnaire)

Questionario con 25 item a risposte su scala likert a 3 punti. Le risposte sono codificate come 0-1-2.

I punteggi totali sono dati dalla somma degli item. Punteggi più alti indicano maggiori problemi.

Tuttavia per costruire il punteggio finale è necessario invertire i punteggi degli item 7, 11, 14, 21, 25.

Ovvero: 0-->2; 1-->1; 2-->0.

Abbiamo 5 sottoscale formate dagli item:

- **Emotion**	=	3, 8, 13, 16, 24
- **Conduct**	=	5, 7, 12, 18, 22
- **Hyper**	=	2, 10, 15, 21, 25
- **Peer**	=	6, 11, 14, 19, 23
- **Prosoc**	=	1, 4, 9, 17, 20

Due punteggi riassuntivi vengono creati unendo le sottoscale:

- **Internalizing** = emotion + peer
- **Externalizing** = hyper + conduct
