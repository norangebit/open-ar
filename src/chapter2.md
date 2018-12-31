# Capito 2

## ARCore 

### Caratteristiche

ARCore è stata costruita intorno a tre caratteristiche principali[@googlear:FundamentalConceptsARCore:2019]:

- **Motion tracking**:
  Grazie ad un processo chiamato *concurrent odometry and mapping*(COM), ARCore è in grado di capire come il telefono si posiziona rispetto all'ambiente circostante.
  ARCore riesce ad estrapolare dall'immagine proveniente dalla fotocamera una serie di ***feature points***, ed usa questi punti per calcolare il proprio movimento rispetto all'ambiente.
  Queste informazioni, combinate con quelle provenienti dall'*inertial measurement unit*[^imu] permettono alla libreria di determinare la ***pose*** ovvero la posizione e l'orientamento del devices.
- **Environmental understanding**:
  ARCore ottiene continuamente nuove informazione sull'ambiente tramite i *feature points*, grazie ai quali è in grado di determinare le superfici piane(sia orizzontali che verticali) e i bordi di quest'ultime.
  Visto che le superfici piane sono determinate attraverso i *feature points* la libreria incontra non poche difficoltà nel riconoscimento di superfici piane verticali monocromatiche come, ad esempio, i muri.
- **Light estimation**:
  ARCore è in grado di comprendere come la luce illumina gli oggetti reali, mettendo a disposizione del programmatore una serie di informazioni per poter correggere l'immagine proveniente dalla fotocamera.
  Queste informazioni permettono di integrare meglio gli oggetti virtuali nella scena ed avere un maggiore foto-realismo

### Perché ARCore

La scelta di ARCore rispetto ad altri ambienti di sviluppo non è stata determinata da una supremazia tecnica.
La costruzione di una rappresentazione interna dell'ambiente e il posizionamento in questo sono le caratteristiche su cui si erigono tutte le librerie di realtà aumentata.
Tant'è non è possibile notare una sostanziale differenza tra ARCore e la già citata ARKit, o l'altrettanto valida Vuforia[@vuforia:VuforiaAugmentedReality:2019].
Il campo in cui ARCore eccelle rispetto alla concorrenza invece è la gestione della luce.
Questo punto di forza, però, viene abbondantemente compensato dall'impossibilità di riconoscere un oggetto reale(sia esso statico[^image-recognition] che dinamico) dato un modello 3D.
Funzione disponibile sia su Vuforia, sia, dalla versione 2.0, su ARKit.

La prima ragione per cui si è scelto di approfondire lo studio di ARCore è la sua natura multi piattaforma, con buona parte dell'API condivisa dai due maggiori sistemi operativi mobili.
Ma ciò che rende veramente unica la soluzione di Google è la licenza, Apache 2.0, che le conferisce il titolo di unico SDK per la realtà virtuale ad essere rilasciato sotto una licenza open source.

Scopo della tesi sarà, mediante applicazioni d'esempio, esplorare potenzialità e limiti nello sviluppo di progetti dell'AR mediante tecnologie open source.

[^image-recognition]: Google ha preferito relegare il riconoscimento di oggetti ad altre sue librerie  di deep learnig.
[^imu]: Anche nota con l'acronimo di IMU è un dispositivo elettronico che misura, mediante l'accelerometro, il giroscopio e là dove presente il magnetometro, la forza specifica che agisce sul dispositivo.
