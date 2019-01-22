# ARCore e Sceneform

## ARCore 

### Caratteristiche principali

ARCore è stata costruita intorno a tre caratteristiche principali[@googlear:FundamentalConceptsARCore:2019]:

- **Motion tracking**:
  Grazie ad un processo chiamato *concurrent odometry and mapping*(COM), ARCore è in grado di capire come il telefono si posiziona rispetto all'ambiente circostante.
  ARCore riesce ad estrapolare dall'immagine proveniente dalla fotocamera una serie di ***feature points***, ed usa questi punti per calcolare il proprio movimento rispetto all'ambiente.
  Queste informazioni, combinate con quelle provenienti dall'*inertial measurement unit*[^imu], permettono alla libreria di determinare la ***pose*** ovvero la posizione e l'orientamento del device.
- **Environmental understanding**:
  ARCore ottiene continuamente nuove informazione sull'ambiente tramite i *feature points*, grazie ai quali è in grado di determinare le superfici piane(sia orizzontali che verticali) e i bordi di quest'ultime.
  Dato che le superfici piane sono determinate attraverso i *feature points*, la libreria incontra non poche difficoltà nel riconoscimento di superfici piane verticali monocromatiche come, ad esempio, i muri.
- **Light estimation**:
  ARCore è in grado di comprendere come la luce illumina gli oggetti reali, mettendo a disposizione del programmatore un'API per poter correggere l'immagine proveniente dalla fotocamera.
  Queste informazioni permettono di integrare meglio gli oggetti virtuali nella scena ed avere un maggiore foto-realismo
  
### Altre caratteristiche

Altri due concetti importati di ARCore sono le ***Anchor*** e i ***Trackable***.


I punti e i piani sono oggetti speciali che implementano l'interfaccia `Trackable` e come risulta evidente dal nome, questi oggetti possono essere tracciati da ARCore nel corso del tempo.
La possibilità di ottenere informazioni su questi oggetti è molto importante perché ci permette di aggiornare la posa di essi man mano che ARCore apprende informazione sull'ambiente esterno. 
Per questo, quando si vuole posizionare un oggetto virtuale, è necessario definire un'*ancora* ad un trackable, così facendo ARCore è in grado di tracciare e aggiornare la posizione dell'oggetto renderizzato.
Inoltre per ridurre lo sforzo della CPU le ancore possono essere riutilizzate o messe in pausa quando non sono più parte della scena.
  
Risulta importante notare che ARCore non offre alcun supporto alle tecnologie di mixed reality.
A fronte di ciò è evidente che l'unica modalità di interazione tra l'utente e gli oggetti virtuali sia lo smartphone.
Quando l'utente tocca lo schermo dello smartphone ARCore proietta un raggio nella visuale della fotocamera, restituendo tutti i punti caratteristici e i piani del mondo reale intersecati dal raggio.
Questa operazione prende il nome di *hit test*.

### Perché ARCore

La scelta di ARCore rispetto ad altri ambienti di sviluppo non è stata determinata da una supremazia tecnica.
La costruzione di una rappresentazione interna dell'ambiente e il posizionamento in questo sono le caratteristiche su cui si erigono tutte le librerie di realtà aumentata markerless.
Tant'è non è possibile notare una sostanziale differenza tra ARCore e la già citata ARKit, o l'altrettanto valida Vuforia[@vuforia:VuforiaAugmentedReality:2019].

Il campo in cui ARCore eccelle rispetto alla concorrenza invece è la gestione della luce.
Questo punto di forza, però, viene abbondantemente compensato dall'impossibilità di riconoscere un oggetto reale[^image-recognition](sia esso statico che dinamico) dato un modello 3D.
Funzione disponibile sia su Vuforia, sia, dalla versione 2.0, su ARKit.

La prima ragione per cui si è scelto di approfondire lo studio di ARCore è la sua natura multi piattaforma, con buona parte dell'API condivisa dai due maggiori sistemi operativi mobili.
Però ciò che rende veramente unica la soluzione di Google è la licenza, Apache 2.0, che le conferisce il titolo di unico SDK per la realtà virtuale su dispositivi mobili ad essere rilasciato sotto una licenza open source.

Scopo della tesi sarà, mediante applicazioni d'esempio, esplorare potenzialità e limiti nello sviluppo di progetti dell'AR mediante tecnologie open source.

## Sceneform

In qualsiasi applicazione di augmented reality è possibile distinguere due macro aree:

- **riconoscimento dell'ambiente reale**:
  Questa risulta essere la parte più strettamente di AR.
  ARCore ci fornisce tutti gli strumenti per adempiere a questo compito.
- **renderizzazione degli oggetti virtuali**
  Consiste nella generazione e visualizzazione degli oggetti virtuali.
  ARCore, come d'altronde gli altri SDK, non forniscono alcun supporto diretto per questo compito.

Nelle versioni dell'SDK per Android, sia esso standard o NDK[^ndk] e per dispositivi iOS, la gestione del comparto grafico è delegata completamente allo sviluppatore.
Quindi per la renderizzazione degli oggetti tridimensionali si è *costretti* ad usare API di basso livello come OpenGL ES[^opengl] o la più moderna Vulkan.

Oltre alle soluzioni platform-specific sono disponibili altre due versioni di ARCore, una per l'ambiente Unity 3D e una per Unreal Engine.
Con queste ultime è possibile appoggiarsi ad un motore grafico per la gestione del rendering e quindi rendere più semplice e veloce il compito dello sviluppatore.
Per quanto i vantaggi di queste soluzioni siano innegabili, bisogna considerare che facendo ricorso ad esse si sta introducendo un ulteriore strato di software nel processo di sviluppo;
software distribuito tramite licenze proprietarie che comportano costi di utilizzo.

Oltre alle soluzioni elencate in precedenza, per lo sviluppo in ambiente Android, Google mette a disposizione Sceneform[@googlear:SceneformSDKAndroid:2019], un framework per la gestione del rendering di oggetti 3D, ottimizzato per dispositivi mobili che permette di creare velocemente applicazioni in AR sfruttando Java.
Inoltre essendo pensato specificamente per Android e ARCore offre una serie di ulteriori vantaggi, come la gestione del ciclo di vita dell'activity o la gestione automatica delle ombre.

Per lo sviluppo delle applicazioni di esempio si è scelto di fare affidamento proprio su quest'ultima  soluzione, in quanto offre un ottimo trade-off tra facilità di accesso e potenzialità.
Inoltre vista la natura open source di Sceneform non si viene meno all'intento della tesi di mostrare le possibilità offerte da tecnologie aperte nel campo dell'AR per smartphone.

[^image-recognition]: Google ha preferito relegare il riconoscimento di oggetti ad altre sue librerie  di deep learning.
[^imu]: Anche nota con l'acronimo di IMU è un dispositivo elettronico che misura, mediante l'accelerometro, il giroscopio e là dove presente il magnetometro, la forza specifica che agisce sul dispositivo.
[^ndk]: Acronimo di Native Development Kit, è un insieme di strumenti che permettono di scrivere parti di applicazioni Android in C o C++.
[^opengl]: Acronimo di Open Graphics Library for Embedded Systems, è una specifica che permette di avere un API condivisa su hardware differente.
