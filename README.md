# Tesi di laurea triennale in ingegneria informatica presso l'Unisannio.

- **titolo**: Un'analisi del toolkit ARCore per la realtà aumentata in ambiente mobile
- **autore**: Raffaele Mignone
- **relatore**: Prof. Gerardo Canfora

## Abstract


Con il termine realtà aumentata viene indicata una serie di tecnologie che permettono di aggiungere nuovo contenuto percettivo al mondo reale che ci circonda generato mediante l'ausilio di un calcolatore.

In un primo momento le tecnologie di AR erano veicolate mediante l'utilizzo di appositi visori e dispositivi che rendevano difficile e costoso l'accesso ad esse per il mercato consumers.
Tuttavia il continuo progresso tecnologico e la crescente capacità computazionale dei devices mobili ha permesso una sempre maggiore diffusione di queste nuove tecnologie.
A fronte di ciò sono nati numerosi framework per lo sviluppo di esperienze di realtà aumentata per dispositivi mobili.
In questo documento si è svolta un'analisi del tool ARCore e della libreria grafica Sceneform, al fine di comprendere e valutare le possibilità messe a disposizione da queste soluzioni.

In seguito a quest'analisi è stato possibile isolare una serie di punti a favore come:

- Licenza open source
- Disponibilità dell'SDK per svariati ambienti di sviluppo
- Ottime capacità nel riconoscimento dell'ambiente reale
- Esperienze di AR cross devices 
- Documentazione completa ed esaustiva

Ma anche degli inconvenienti più o meno limitati:

- Supporto limitato alle tecnologie di marker based
- Difficoltà nel riconoscere superfici piane verticali
- Gestione carente degli eventi di interesse
- Supporto quasi nullo al movimento e alle animazioni

## Ringraziamenti

Un ringraziamento speciale alla mia famiglia, e in particolar modo ai miei genitori e a Noemi, per avermi supportato e sopportato durante questi anni, soprattutto nei momenti di difficoltà.
  
Un ringraziamento al mio relatore, il Prof. Gerardo Canfora, per la sua disponibilità e per il supporto.

Un ringraziamento ad *André Miede* per aver realizzato il pacchetto LaTeX *ClassicThesis* con cui è stato realizzato questo documento. Un grazie anche a *Mike M* e *Jarlan Perez* per aver realizzato i modelli utilizzati nelle varie applicazioni.

Dal punto di vista tecnico nessuna parte di questa tesi sarebbe stata possibile senza il lavoro di centinaia di volontari sparsi in tutto il mondo, che hanno contribuito ai software open source utilizzati in questa tesi, tra cui, neovim, Arch Linux, git, pandoc, LaTeX, Zotero e il kernel Linux.

Infine vorrei esprimere la più sincera gratitudine a chiunque abbia letto le prime versioni di questo documento, grazie per i preziosi suggerimenti.

## Impaginazione

L'impaginazione di questa tesi è avvenuto attraverso [pandoc][] e il template [LaTeKiSS][latekiss].

[pandoc]: https://pandoc.org/

[latekiss]: https://github.com/norangebit/LaTeKiSS
