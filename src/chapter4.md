# Conclusioni

Nel corso di questo elaborato e in particolar modo durante lo sviluppo dei vari progetti d'esempio è stato possibile analizzare nel dettaglio ARCore e Sceneform e scoprirne limiti e potenzialità.

Nelle seguenti sezioni sono riportate alcune considerazioni finali su entrambe le librerie utilizzate.

## ARCore

ARCore si è dimostrata una soluzione potente ed efficace.
La disponibilità dell'SDK per i due ecosistemi più utilizzati e il supporto ad Unity 3D, lo standard *de facto* nello sviluppo di contenuti multimediali in ambiente mobile, la rendono una soluzione flessibile e capace di adattarsi a tutte le esigenze.

Nonostante i chiari ed evidenti punti a favore, nel corso dello sviluppo delle applicazioni, sono emersi anche una serie di mancanze e limitazioni.

### AR marker based

ARCore e il suo predecessore, *project tango*, hanno puntato da sempre a soluzioni orientate all'AR markerless, conferendo un ruolo secondario all'AR marker based.
Infatti, a differenza di altre soluzioni, ARCore presenta alcune limitazioni in questo campo, come ad esempio il solo riconoscimento di immagini.

Nonostante questo, non si può parlare di una vera e propria lacuna, ma più di una scelta progettuale.
Google ha preferito delegare il riconoscimento di pattern alle altre, e numerose, soluzioni offerte da essa stessa.
Infatti tramite la libreria open source TensorFlow[@googlebrain:TensorFlow:2019] o le soluzioni in cloud, come il machine learning kit di Firebase[@firebase:IntroducingMLKit:2018] è possibile adempiere perfettamente a questi compiti.

### Riconoscimento delle superfici verticali

Il più grosso limite riscontrato nell'utilizzo della libreria si ha senza dubbio nel riconoscimento delle superfici verticali, sopratutto se queste si presentano senza soluzioni di continuità.

Questi problemi sono intrinsechi alla tecnologia stessa del tracking basato su features points, infatti ARCore non riesce a trovare nessun punto caratteristico a cui agganciarsi per svolgere le operazioni di tracking.

Se è vero che nella maggior parte dei casi si opera con piani orizzontali e che alcuni miglioramenti siano stati apportati con la versione 1.6, ad oggi, se si necessita di un uso esclusivo o massiccio di piani verticali, è consigliabile ricorrere ad altre soluzioni.

### Cloud Anchors

Una caratteristica peculiare di ARCore sono le Cloud Anchors che si presentano senza dubbio come una soluzione innovativa e dalle molte potenzialità, presentando però, limitazioni prevalentemente di natura tecnica.

Il ripristino di un'ancora remota non sempre avviene in modo corretto e in alcuni casi si ottengono vere e proprie anomalie visive, come oggetti in bilico o sospesi a mezz'aria.
Per ottenere risultati migliori è consigliabile, sia in fase di creazione, sia in fase di ripristino, posizionarsi ad una distanza non inferiore al metro dal punto in cui verrà creata/ripristinata l'ancora.
Inoltre si è notato un ripristino migliore se quest'ultimo viene eseguito dalla medesima prospettiva dalla quale è stata effettuata la creazione.

Nella documentazione ufficiale, le Cloud Anchors, vengono presentate come una soluzione in grado di abilitare la condivisione di un'esperienza AR, ma allo stato attuale si tratta più di una soluzione per lo storage di ancore.
Infatti per ottenere una condivisione trasparente all'utente, sono richiesti servizi aggiuntivi e un notevole lavoro extra da parte dello sviluppatore.

### Mancanza di listener

Un'altra limitazione emersa prepotentemente durante lo sviluppo è l'impossibilità di associare listener a molti eventi d'interesse.

Quasi tutti gli eventi più complicati del semplice tocco su una superficie piana non possono essere trattati direttamente, ma ci si deve appoggiare all'evento di aggiornamento della scena.
Questa situazione, in *problemi non giocattolo*, comporta l'utilizzo eccessivo del listener e l'assegnazione ad esso di numerosi compiti eterogenei e quindi la nascita di un codice meno leggibile e manutenibile, con una conseguente maggiore propensione all'errore.

## Sceneform

La natura *platform specific* di Sceneform permette agli sviluppatori di sfruttare una serie di facilitazioni che rendono il processo di sviluppo di applicazioni AR più veloce ed immediato.

Tra le più importanti troviamo sicuramente:

- **Gestione delle ombre**:
  Sceneform, sfruttando le informazioni fornite da ARCore, riesce a gestire in maniera automatica le ombre degli oggetti virtuali piazzati sulla scena.
  Ottenendo così risultati soddisfacenti sia con oggetti semplici, sia con oggetti in movimento, che con oggetti dotati di varie appendici.
- **Gestione del ciclo dell'applicazione**:
  Grazie a Sceneform, allo sviluppatore, è sufficiente dichiarare l'`ArFragment` per avere un ambiente AR a portata di mano che gestisce quasi perfettamente il ciclo di vita dell'applicazione.
  
Sebbene questi vantaggi siano tangibili e innegabili, sono presenti anche molte limitazioni, come già ampiamente discusso in precedenza.
Le animazioni e il movimento o, più in generale, l'assenza di un motore grafico vero e proprio, pesano come una spada di Damocle sull'affidabilità della libreria.

Durante l'utilizzo di Sceneform si ha sempre l'impressione di star utilizzando un prodotto ancora acerbo e incompleto, per cui l'utilizzo di questa soluzione deve essere attentamente valutata da parte dello sviluppatore.
