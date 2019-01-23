# Conclusioni

Nel corso di questo elaborato e in particolar modo durante lo sviluppo dei vari progetti d'esempio è stato possibile analizzare nel dettaglio ARCore e Sceneform e scoprirne limiti e potenzialità.

Nelle seguenti sezioni sono riportate le considerazioni finali su entrambe le librerie utilizzate.

## ARCore

ARCore si è dimostrata una soluzione potente ed efficace.
Inoltre la disponibilità dell'SDK per i due ecosistemi più utilizzati e il supporto ad Unity 3D, lo standard *de facto* nello sviluppo di contenuti multimediali in ambiente mobile, la rende anche una soluzione flessibile e capace di adattarsi a tutte le esigenze.
Nonostante i chiari ed evidenti punti a favore, nel corso dello sviluppo delle applicazioni, sono emersi anche una serie di mancanze e limitazioni.

### AR marker based

La natura di soluzione orientata all'AR markerless risulta evidente già dall'origini del progetto.
Infatti, a differenza di altre soluzioni, nel campo dell'AR marker based offre esclusivamente il riconoscimento di immagini.

Sebbene si possa pensare ad una lacuna della libreria, in realtà, si tratta più di una scelta progettuale, infatti Google ha preferito delegare il riconoscimento di pattern alle altre numerose soluzioni offerte da essa stessa.
Tramite la libreria open source TensorFlow[@googlebrain:TensorFlow:2019] o alle soluzioni in cloud, come il machine learning kit di Firebase[@firebase:IntroducingMLKit:2018] è possibile adempiere perfettamente a questi compiti.

### Riconoscimento delle superfici verticali

Il più grosso limite riscontrato nell'utilizzo della libreria si ha senza dubbio nel riconoscimento delle superfici verticali, sopratutto se queste superfici sono senza soluzioni di continuità.

Questi problemi sono intrinsechi alla tecnologia stessa del tracking basato su features points, infatti ARCore non riesce a trovare nessun punto caratteristico a cui agganciarsi per svolgere le operazioni di tracking.
Se da un lato è vero che nella maggior parte dei casi si opera con piani orizzontali e che alcuni miglioramenti siano stati apportati con la versione 1.6, ad oggi, se si necessita di un uso esclusivo e massiccio di piani verticali, è consigliabile ricorrere ad altre soluzioni.

### Cloud Anchors

Una caratteristica peculiare di ARCore sono le cloud anchors che si presentano senza dubbio come una soluzione innovativa e dalle molte potenzialità, ma nonostante ciò presentano anche evidenti limitazioni tecniche.

Il ripristino di un'ancora remota non sempre avviene in modo corretto e in alcuni casi si ottengono vere e proprie anomalie, come oggetti in bilico o sospesi a mezz'aria.
Per ottenere risultati migliori è consigliabile, sia in fase di creazione, sia in fase di ripristino, posizionarsi ad una distanza non inferiore al metro dal punto in cui verrà creata/ripristinata l'ancora.
Inoltre si è notato un ripristino migliore se quest'ultimo viene eseguito dalla medesima prospettiva dalla quasi si è effettuata la creazione.

Infine nella documentazione ufficiale, le cloud anchors, vengono presentate come una soluzione in grado di permettere la condivisione di un'esperienza AR, ma allo stato attuale si tratta più di una soluzione per lo storage di ancore.
Infatti per ottenere una condivisione trasparente all'utente sono richiesti servizi aggiuntivi e un notevole di lavoro extra da parte dello sviluppatore.

### Mancanza di listener

Un'altra limitazione emersa prepotentemente durante lo sviluppo è l'impossibilità di associare listener a molti eventi d'interesse.
Quasi tutti gli eventi più complicati del semplice tocco su una superficie piana non possono essere trattati direttamente, ma ci si deve appoggiare all'evento di aggiornamento della scena.
Questa situazione comporta che in qualsiasi esempio non giocattolo, il listener sull'aggiornamento della scena abbia molti compiti e percorsi di esecuzione distinti. 
Tutto questo comporta un codice meno leggibile e manutenibile ed una maggiore propensione all'errore.
