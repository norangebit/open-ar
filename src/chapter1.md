# Capito 1

## Definizione

Con il termine ***augmented reality***(da qui in poi AR), si intende un insieme di tecnologie mediante le quali è possibile arricchire, *"aumentare"*, gli oggetti che risiedono nel mondo reale con del contenuto percettivo[^olfactory] generato da un calcolatore.
Mediante l'AR è possibile aggiungere, AR *costruttiva*, o rimuovere, *AR de-costruttiva*[^destructive], contenuto informativo al mondo che ci circonda.

Risulta importate non fare confusione tra AR e VR(virtual reality), in quanto la prima parte dal mondo reale per aggiungerci del contenuto, mentre la seconda si pone l'obbiettivo di sostituire completamente il mondo reale con uno generato da un computer.

Recentissima invece è l'MR(mixed reality), che può essere definita come un'AR potenziata, infatti in un'esperienza di MR l'utente oltre a percepire oggetti virtuali è in grado anche di interagire con essi.

Volendo usare un paragone cinematografico, possiamo dire che in *Matrix*[@wachowski:Matrix:1999] viene usata la VR.
Invece in *Iron Man*[@favreau:IronMan:2008] quando *Tony Stark* è in volo e gli vengono mostrate a video informazioni aggiuntive sta usando l'AR, mentre quando interagisce con gli ologrammi sta usando tecnologie di mixed reality.

## Storia

Possiamo datare la nascita dell'AR al 1968 quando *Ivan Sutherland* inventa il primo visore in grado di aggiungere elementi generati dal computer alla visione umana[@sutherland:HeadmountedThreedimensionalDisplay:1968].
Mentre per il battesimo si dovrà attendere il 1990 quanto *Tom Caudell* introduce per la prima volta il termine *augmented reality*.

![Apparecchiatura meccanica di sostegno del visore di Sutherland](src/figures/headmounted1.jpg){width=200 height=300px}

![Vista frontale del visore di Sutherland](src/figures/headmounted2.jpg){width=300 height=200px}

Sempre agli inizi degli anni 90 arriva anche la prima applicazione non accademica da parte dell'aviazione Americana.
Tramite degli *head-up display*, ovvero un visore a sovrimpressione, venivano mostrate ai piloti delle informazioni aggiuntive, come velocità, quota, beccheggio, In questo modo il pilota non aveva la necessità di guardare gli strumenti dell'abitacolo e poteva concentrarsi sul pilotaggio del velivolo.

A partire dalla fine degli anni 90 le tecnologie AR hanno trovato sempre maggiore applicazione nel campo dell'intrattenimento[@williamsii:HistoryAugmentedReality:2016].
Infatti è proprio a cavallo tra secondo e terzo millennio, per la prima volta, durante una partita di NFL, la linea gialla del *primo down* viene generata da un computer.

Negli ultimi anni il fiorente progresso tecnologico ha consentito la diffusione sempre maggiore di apparecchi che permettono di fondere elementi virtuali con la realtà che li circondava.
Uno dei prodotti più riusciti sono senza dubbio i *Google Glass*[@x:Glass:2019], presentati al grande pubblico durante il Google I/O del 2013, hanno la forma di comuni occhiali, ma con l'aggiunta di un'appendice che racchiude una fotocamera e un prisma usato per ottenere un *head-up display*.
L'interazione può avvenire sia tramite un touchpad(in grado di riprodurre audio mediante conduzione ossea[^conduzione-ossea]) sia mediante comandi vocali.
Grazie a quest'ultima caratteristica è possibile avere un'esperienza d'uso *hand-free* che li ha resi particolarmente utili in campo industriale e medico.

La crescente diffusione degli smartphone e il progressivo aumento delle loro capacità di calcolo, ha reso queste nuove tecnologie accessibili al grande pubblico.
In questo modo è scaturita una continua richiesta di contenuti AR, che ha spinto molti player del settore tecnologico ad investire in questo campo.
Investimenti che hanno fatto nascere una moltitudine di *SDK* per la realtà aumentata in grado di funzionare su smartphone.

Agli inizi del 2014 viene presentato *Google project Tango*[@googleatap:SayHelloProject:2014] uno dei progetti più interessanti e innovativi nel campo della visione artificiale e dell'AR.
Nasce dalla divisione ATAP[^atap] di Google sotto la guida di Johnny Lee, uno dei leader di *Kinect* in *Microsoft* con l'intento di estendere le capacità di visione artificiale degli smartphone, rendendoli in grado di capire l'ambiente circostante[@eddy:GoogleFuturePhones:2015].
I *Tango devices* avevano la forma e le funzionalità di un normale smartphone, ma erano dotati di hardware specifico che gli consentiva di comprendere meglio, velocemente e più a fondo l'ambiente fisico che lo circondava.
Sebbene nel 2016 sia stata rimossa la dicitura *project* e sono stati commercializzati alcuni dispositivi di Lenovo e Asus, *Tango* non ha mai avuto grande successo né tra i produttori, né tra i consumatori.

Il mancato successo è stato determinato da una parte dalla tendenza di Google a lanciare prodotti in eterna beta e dall'altra dal costante miglioramento degli algoritmi di visione digitale che permettevano di ottenere risultati soddisfacenti anche su smartphone con hardware standard, e quindi più a buon mercato.
La soluzione di Google, da progetto avveniristico, si è ritrovata ad essere limitata ed acerba per il settore professional, in cui stavano emergendo soluzioni decisamente più potenti ed interessanti come *Microsoft HoloLens*[^mixed-reality][@microsoft:MicrosoftHoloLens:2019], ma troppo costosa e limitante per quello consumers.

Il mancato successo di *Tango* unito alla concorrenza di altri *SDK* per la realtà aumentata, tra cui *ARKit* di Apple[@apple:ARKitAppleDeveloper:2019], hanno convinto Google ad abbandonare completamente il progetto, trovandosi nella strana situazione di essere stata una delle prime ad investire in AR per smartphone, ma nonostante ciò essere indietro rispetto alla concorrenza.
Le risorse investite, e le conoscenze accumulate con *Tango* hanno però permesso a Google di recuperare velocemente il terreno perso, così dalle ceneri di *Tango*[@kastrenakesGoogleProjectTango2017a] nasce *ARCore*, la piattaforma AR di Google[@googlear:ARCoreGoogleDeveloper:2019].

[^olfactory]: Si è soliti associare l'AR principalmente a contenuti audio-video, ma in realtà è un settore che comprende tutti e cinque i sensi. Un'ipotetica tecnologia, che data in input un piatto, riesce a farci percepite il sapore e l'odore andrebbe ascritta comunque al campo dell'AR.
[^destructive]: Anche se meno conosciuta, la branca *de-costruttiva*, si pone l'obbiettivo di rimuovere del contenuto dal mondo reale. Una delle applicazioni più interessanti, sebbene ancora in fase sperimentale, è la realizzazione di un AD blocker per il mondo reale [@vanhemert:ARExperimentThat:2015]. L'AR de-costruttiva resta ad oggi ancora marginale, sia per una carenza di idee di applicazione, sia perché espone ancora di più l'utente ai pericoli dell'AR che già hanno portato a dei decessi. Mediaticamente più interessanti sono state le morti ascrivibili a *Pokémon GO* [@pokemongodeathtracker:PokemonGODeath:2019].
[^mixed-reality]: Sebbene HoloLens sia un visore per la mixed reality, possiamo annoverarlo anche tra i dispositivi AR in quanto la realtà aumentata è una tecnologia abilitate per l'MR.
[^conduzione-ossea]: Tecnica che consente la conduzione del suono all'orecchio mediante le ossa del cranio.
[^atap]: Divisione Advanced Technology And Projects di Google, precedentemente nota come Google X.
