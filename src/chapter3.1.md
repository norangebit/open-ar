# Progetti di esempio

Prima di procedere allo sviluppo di applicazioni mediante ARCore e Sceneform sono necessarie alcune configurazioni iniziali.

Per funzionare ARCore necessita di Android 7.0(API level 24) o superiore.
Inoltre se si sta lavorando con un progetto con API level minore di 26 è necessario esplicitare il supporto a Java 8 andando a modificare file `app/build.gradle`.

```gradle
android {
  ...
  compileOptions {
    sourceCompatibility JavaVersion.VERSION_1_8
    targetCompatibility JavaVersion.VERSION_1_8
  }
  ...
}
```

Un'altra modifica da fare al file è l'aggiunta della dipendenza di Sceneform.

```gradle
implementation "com.google.ar.sceneform.ux:sceneform-ux:1.6.0"
```

Inoltre nell'AndroidManifest è necessario dichiarare l'utilizzo del permesso della fotocamera[^camera] e l'utilizzo di ARCore[^arcore].

## Augmented images

Il primo progetto è un classico esempio di AR marker based e ha lo scopo di riconosce un immagine data e sovrapporre ad essa un oggetto virtuale.
Nel caso specifico si vuole riconoscere una foto del pianeta terra e sostituirvi un modello tridimensionale di essa.

### Aggiunta del modello

Prima di tutto dobbiamo la cartella *"sampledata"*, il cui contenuto sarà usato solo in fase di progettazione, e aggiungere ad essa il modello tridimensionale[^format] che vogliamo usare.
Per facilitare l'importazione del modello 3D usiamo il plug-in *Google Sceneform Tools*.

### Creazione del database

La prima cosa da fare è la creazione di un database con tutte le immagini che si desidera far riconosce all'applicazione. Questa operazione può essere svolta sia quando si sta sviluppando l'applicazione, sia runtime. Per questo progetto si è scelta la seconda opzione.

L'aggiunta dell'immagine al database avviene mediante la funzione `setupAugmentedImageDb`.

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

Sfortunatamente ARCore non permette di gestire il riconoscimento dell'immagine mediante un listener, per cui sarà compito dello sviluppatore controllare quando si è verificato un match.
Per fare ciò si usa il metodo `addOnUpdateListener()` dell'oggetto `Scene`, che permette di eseguire del codice ogni qual volta che la scena viene aggiornata.

```kotlin
override fun onCreate(savedInstanceState: Bundle?) {
  //...
  
  arSceneView.scene.addOnUpdateListener(this::detectAndPlaceAugmentedImage)
  
  //...
}
```

Dove la funzione `detectAndPlaceAugmentedImage()` si occupa di verificare la presenza di un match e nel caso aggiungere l'oggetto virtuale alla scena.

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

### Rendering del modello

Il rendering del modello avviene attraverso la funzione `buildRenderable()`.
Poiché quest'ultima è un operazione onerosa viene restituito un `Future`[^future] che racchiude il `Renderable` vero e proprio.
L'interazione con quest'oggetto avviene attraverso una callback che è possibile specificare attraverso il metodo `thenAccept()`.

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
Questa operazione avviene attraverso la funzione `addTrasformableNodeToScene()`.

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
[^camera]: Lo sviluppatore deve solo dichiarare l'utilizzo del permesso, la richiesta di concessione è gestita in automatico da Sceneform.
[^arcore]: L'utilizzo di ARCore deve essere dichiarata in quanto non tutti i dispositivi supportano ARCore.
[^future]: In informatica con il termine *future*, o *promise*, *delay* e *deferred*, si indica un tecnica che permette di sincronizzare l'esecuzione di un programma concorrente.
