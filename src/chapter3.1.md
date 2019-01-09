## Augmented images

Nel primo progetto d'esempio si è affrontato un classico problema di AR marker based, ovvero il riconoscimento di un'immagine preimpostata e il conseguente sovrapponimento di un oggetto virtuale.
Nel caso specifico si vuole riconoscere una foto del pianeta terra e sostituirvi un modello tridimensionale di essa.

### Aggiunta del modello

Il modello tridimensionale della terra è stato recuperato dal sito `poly.google.com`, che funge da repository per modelli 3D.
La scelta del modello è stata dettata sia del formato[^format] in cui era disponibile, sia dalla licenza con cui veniva distribuito. 
Una volta ottenuto il modello è stato salvato nella cartella *"sampledata"*, il cui contenuto sarà usato solo in fase di progettazione.

L'importazione del modello all'interno del progetto di Android Studio è stato effettuato mediante l'utilizzo del plug-in *Google Sceneform Tools*, che si occupa sia di convertire il modello nel formato di Sceneform, sia di aggiornare il file `build.gradle` affinché sia incluso nell'APK[^apk] finale.

### Creazione del database

Il database contenente tutte le immagini che si desidera far riconosce all'applicazione, può essere creato sia a priori, sia a tempo di esecuzione.
Per la prima soluzione Google mette a disposizione *The arcoreimag tool*, un software a linea di comando, che oltre a creare il database, si occupa anche di valutare l'immagine.

Dato che nel caso specifico si vuole far riconoscere un'unica immagine, si è optato per la generazione del database a runtime.
In particolare quest'operazione avviene mediante la funzione `setupAugmentedImageDb`.

```kotlin
private fun setupAugmentedImageDb (config: Config): Boolean {
  val image = loadImage(IMAGE_FILE_NAME) ?: return false

  val augmentedImageDb = AugmentedImageDatabase(session)
  augmentedImageDb.addImage(IMAGE_NAME, image)
  config.augmentedImageDatabase = augmentedImageDb
  return true
}
```

### Riconoscimento dell'immagine

Il riconoscimento dell'immagine non può avvenire mediate l'utilizzo di una callback in quanto ARCore non permette di registrare un listener all'evento.
Risulta dunque evidente che la verifica dell'avvenuto match sarà delegata allo sviluppatore.

Per fare ciò si è usato il metodo `addOnUpdateListener` dell'oggetto `Scene`, che permette di eseguire un pezzo di codice ogni qual volta la scena viene aggiornata.

```kotlin
override fun onCreate(savedInstanceState: Bundle?) {
  //...
  
  arSceneView.scene.addOnUpdateListener(this::detectAndPlaceAugmentedImage)
  
  //...
}
```

Dove la funzione `detectAndPlaceAugmentedImage` si occupa di verificare la presenza di un match e nel caso di un riscontro positivo, dell'aggiunta dell'oggetto virtuale alla scena.

```kotlin
private fun detectAndPlaceAugmentedImage(frameTime: FrameTime) {
  if (isModelAdded)
    return

  val augmentedImage = arSceneView.arFrame
    .getUpdatedTrackables(AugmentedImage::class.java)
    .filter { isTrackig(it) }
    .find { it.name.contains(IMAGE_NAME) }
    ?: return

  val augmentedImageAnchor = augmentedImage.createAnchor(augmentedImage.centerPose)

  buildRenderable(this, Uri.parse(MODEL_NAME)) {
    addTransformableNodeToScene(
      arFragment,
      augmentedImageAnchor,
      it
    )
  }

  isModelAdded = true
}
```

Il settaggio del flag `isModelAdded` al valore booleano di vero, si rende necessario al fine di evitare l'aggiunta incontrollata di nuovi modelli alla medesima immagine. 

### Rendering del modello

Il rendering del modello avviene attraverso la funzione `buildRenderable` che a sua volta chiama la funzione di libreria `ModelRenderable.builder()`.
Poiché quest'ultima è un operazione onerosa viene restituito un `Future`[^future] che racchiude il `Renderable` vero e proprio.
L'interazione con l'oggetto concreto avviene mediante una callback che è possibile specificare attraverso il metodo `thenAccept`.

```kotlin
fun buildRenderable(
  context: Context,
  model: Uri,
  onSuccess: (renderable: Renderable) -> Unit
) {
  ModelRenderable.builder()
    .setSource(context, model)
    .build()
    .thenAccept(onSuccess)
    .exceptionally {
        Log.e("SCENEFORM", "unable to load model", it)
        return@exceptionally null
    }
}
```

### Aggiunta dell'oggetto virtuale nella scena

L'ultima operazione da compiere è l'aggiunta del modello renderizzato alla scena.
Questa operazione avviene attraverso la funzione `addTrasformableNodeToScene` che si occupa di creare un'ancora in corrispondenza del punto reale d'interesse.
A partire da quest'ancora viene creato un nodo che racchiude l'oggetto renderizzato.
Inoltre nel caso specifico si è usato un `TransformabelNode`, in modo da concedere all'utente la possibilità di ridimensionare o ruotare il modello.

```kotlin
fun addTransformableNodeToScene(
  arFragment: ArFragment,
  anchor: Anchor,
  renderable: Renderable
) {
  val anchorNode = AnchorNode(anchor)
  val transformableNode = TransformableNode(arFragment.transformationSystem)
  transformableNode.renderable = renderable
  transformableNode.setParent(anchorNode)
  arFragment.arSceneView.scene.addChild(anchorNode)
  transformableNode.select()
}
```

[^format]: Attualmente sono supportati solo modelli OBJ, FBX e gLTF.

[^apk]: Formato delle applicazioni Android.

[^future]: In informatica con il termine *future*, o *promise*, *delay* e *deferred*, si indica un tecnica che permette di sincronizzare l'esecuzione di un programma concorrente.
