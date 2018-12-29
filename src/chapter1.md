# Capito 1

## Storia

Con il termine *augmented reality*(da qui in poi AR), si intende un insieme di tecnologie mediante le quali è possibile arricchire, *"aumentare"*[^destructive] il mondo reale.
Possiamo datare la nascita dell'AR al 1968 quando *Ivan Sutherland* inventa il primo visore in grado di aggiungere elementi generati dal computer alla visione umana.
Per il battesimo si dovrà aspettare il 1990 quanto *Tom Caudell* introduce per la prima volta il termine *augmented reality*.

Sempre ad inizio anni 90 arriva anche la prima applicazione con accademica da parte dell'aviazione Americana.
Tramite degli *head-up dispaly* venivano mostrate ai piloti delle informazioni aggiuntive, come velocità, distanza dall'obbiettivo, ma lasciandolo libero di concentrarsi sul pilotaggio del velivolo.

A partire dalla fine degli anni 90 le tecnologie AR hanno trovato sempre maggiore applicazione nel campo dell'intrattenimento[^ar-history].
Infatti è proprio a cavallo del secondo e terzo millennio che si iniziano ad estendere le linee dei campi sportivi mediate immagini generate al computer.

Negli ultimi anni il fiorente progresso tecnologia ha consentito la diffusione sempre maggiore di apparecchi che consentivano di fondere elementi virtuali con la realtà che ci circonda.
Da prima questi apparecchi assumono la forma di pensanti ed ingombrati visori, ma col tempo si è avuta una continua dieta che ha portato alla nascita di apparecchi come i *Google Glass*.
La crescente della diffusione degli smartphone ha reso possibile un accesso a basso costo a queste nuove tecnologie.
Questa continua richiesta di contenuti AR ha spinto molti player del settore tecnologico ad investire in queste nuovo tecnologie, così negli ultimi anni è nata una moltitudine di *SDK* per la realtà aumentata in grado di funzionare su smartphone.

Agli inizi del 2014 viene presentato al grande pubblico *Google project Tango*[^hello-tango] uno dei progetti più interessanti nel campo della visione artificiale de dell'AR.
Nasce dalla divisione ATAP di Google sotto la guida di Johnny Lee, uno dei leader di *Kinect* in Microsoft* con l'intento di estendere le capacita di visione artificiale degli smartphone, rendendoli in grado di capire l'ambiente circostante[^tango-intents].
I *Tango devices* avevano la forma e le funzionalità di un normale smartphone, ma erano dotati di hardware specifico che gli consentiva di comprendere meglio, più velocemente e più a fondo l'ambiente fisico che lo circondava.
Sebbene nel 2016 è stata rimossa la dicitura *project* e sono stati commercializzati alcuni dispositivi di Lenovo e Asus, *Tango* non ha mai avuto grande successo né tra i produttori, né tra i consumatori.
Il mancato successo è stato determinato sia dalla tendenza di Google a lanciere prodotti in eterna beta, sia dal miglioramento degli algoritmi di visione digitale che permettevano di ottenere risultati soddisfacenti anche su smartphone con hardware standard, e quindi più a buon mercato.
La soluzione di Google, da progetto avveniristico, si è ritrovata ad essere né carne né pesce.
Limitata ed acerba per il settore professional, in cui stavano emergendo soluzioni decisamente più potenti ed interessanti come *Microsoft HoloLens*[^mixed-reality][^hololens], ma troppo costosa e limitante per quello consumers.
Il mancato successo di *Tango* unito alla concorrenza di altri *SDK* per la realtà aumentata, tra cui *ARKit* di Apple[^arkit], hanno convinto Google ad abbandonare completamente il progetto.
Google si trovava nella strana situazione di essere stata una dei primi ad investire in AR per smartphone, ma nonostante ciò trovandosi indietro rispetto alla concorrenza.
Le risorse investite, e le conoscenze accumulate con *Tango* hanno però permesso a Google di recuperare velocemente il terreno perso, così dalle ceneri di *project Tango*[^shutting-down-tango] nasce *ARCore*, la piattaforma AR di Google[^arcore].

## Caratteristiche

ARCore è stata costruita intorno a tre caratteristiche principali[^arcore-concepts]:

- **Motion tracking**:
  Grazie ad un processo chiamato *odometry and mapping*(COM), ARCore è in grado di capire come il telefono si posiziona rispetto all'ambiente circostante.
  ARCore riesce ad estrapolare dall'immagine proveniente dalla fotocamera una serie di ***feature points***, ed usa questi punti per calcolare il proprio movimento rispetto all'ambiente.
  Queste informazioni, combinate con quelle provenienti dall'*inertial measurement unit* permettono alla libreria di determinare la ***pose*** ovvero la posizione e l'orientamento del devices.
- **Environmental understanding**:
  ARCore ottiene continuamente nuove informazione sull'ambiente tramite i *feature points*, grazie ai quali è in grado di determinare le superfici piane(sia orizzontali che verticali) e i bordi di quest'ultime.
  Visto che le superfici piane sono determinate attraverso i *feature points* la libreria incontra non poche difficoltà nel riconoscimento di superfici piane verticali monocromatiche.
- **Light estimation**:
  ARCore è in grado di comprendere come la luce illumina gli oggetti reali, mettendo a disposizione del programmatore una serie di informazioni per poter correggere l'immagine proveniente dalla fotocamera.
  Queste informazioni permettono di integrare meglio gli oggetti virtuali nella scena ed avere un maggiore foto-realismo

## Perché ARCore

La scelta di ARCore rispetto ad altri ambienti di sviluppo non è stata determinata da una supremazia tecnica.
La costruzione di una rappresentazione interna dell'ambiente e il posizionamento in questo solo le caratteristiche su cui si erigono tutte le librerie di realtà aumentata, infatti non è possibile notare una sostanziali differenza tra ARCore e la già citata ARKit, o l'altrettanto valida Vuforia[@vuforia].
Il campo in cui ARCore eccelle rispetto alla concorrenza invece è la gestione della luce.
Questo punto di forza, però, viene abbondantemente annullato dall'impossibilità di riconoscere un oggetto reale(sia esso statico[^image-recognition] che dinamico) dato un modello 3D.
La prima ragione per cui si è scelto di approfondire lo studio di ARCore è la sua natura multi piattaforma, con buona parte dell'API condivisa dai sue maggiori sistemi operativi mobili.
Ma ciò che rende veramente unica la soluzione di Google è la licenza, Apache 2.0, che le conferisce il tutolo di unico SDK per la realtà virtuale ad essere rilasciato una licenza open source.
Scopo della tesi sarà, mediante applicazioni d'esempio, esplorare potenzialità e limiti nello sviluppo di progetti dell'AR mediante tecnologie open source.

[^mixed-reality]: Sebbene HoloLens sia un visore per la mixed reality, possiamo annoverarlo anche tra i dispositivi AR in quanto la realtà aumentata è una tecnologia abilitate per l'MR.
[^destructive]: Quando si parla di realtà aumentata si pensa immediatamente a qualcosa che arricchisce la visione che abbiamo sul mondo, in realtà questa è solo una parte delle tecnologie AR. Decisamente meno conosciuta è la branca *de-costruttiva* che si pone l'obbiettivo di rimuovere del contenuto dal mondo reale. Uno delle applicazioni, ancora sperimentale, è la realizzazione di un AD blocker per il mondo reale @wired:ar-ad-blocker. L'AR de-costruttiva resta ad oggi ancora marginale, sia per una mancanza di idee di applicazione, sia perché espone ancora di più l'utente ai pericolo dell'AR che già hanno portato a dei decessi, tra cui spiccano sopratutto quelli scaturiti da pokémon go @death-pokemon-go.
[^image-recognition]: Google ha preferito relegare il riconoscimento di oggetti ad altre sue librerie  di deep learnig.

[^ar-history]: @huffingtonpost:ar-history
[^hololens]: @microsoft:hololens
[^arkit]: @apple:arkit
[^hello-tango]: @atap:hello-project-tango
[^tango-intents]: @pcmag:tango-intents
[^shutting-down-tango]: @theverge:shutting-down-tango
[^arcore]: @google:arcore
[^arcore-concepts]: @google:arcore-concepts
