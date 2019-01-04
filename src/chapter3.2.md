## Runtime fetching models

Lo scopo di questa seconda applicazione è mostrare come sia possibile recuperare i modelli da renderizzare durante l'esecuzione dell'applicazione.
Questa funzione risulta particolarmente utile quando si deve rilasciare un'applicazione che sfrutta un numero elevato di modelli e non si vuole appesantire il volume del file *apk*[^apk].
Inoltre è possibile aggiungere nuovi modelli, o aggiornare quelli vecchi, senza dover aggiornare l'applicazione, ma lavorando esclusivamente lato server.

Per quest'applicazione oltre alle configurazioni già viste in precedenza dobbiamo aggiungere una nuova dipendenza che include le funzioni necessarie per il fetching del modello.

```gradle
  implementation 'com.google.ar.sceneform:assets:1.6.0'
```

Inoltre nell'AndroidManifest bisogna aggiungere il permesso per accedere alla rete.

### Interazione con l'utente

L'interazione con l'utente avviene mediante un tocco sul display.
Sceneform ci permette di personalizzare il comportamento al verificarsi di questo evento tramite un listener.

```kotlin
override fun onCreate(savedInstanceState: Bundle?) {
	//...
	arFragment.setOnTapArPlaneListener(this::fetchAndPlaceModel)
	//...
}
```

Dove la funzione `fetchAndPlaceModel` si occupa di recuperare il modello e renderizzarlo.

```kotlin
private fun fetchAndPlaceModel(
	hitResult: HitResult,
	plane: Plane,
	motionEvent: MotionEvent
) {
  val modelUri = Uri.parse(MODEL_SOURCE)
  val fetchedModel = fetchModel(this, modelUri)
  buildRenderable(this, fetchedModel, modelUri) {
    addTransformableNodeToScene(
      arFragment,
      hitResult.createAnchor(),
      it
    )
  }
}
```

### Fetching del model

Il recupero del modello avviene attraverso la funzione `fetchModel`.

```kotlin
fun fetchModel(
  context: Context,
  source: Uri
) : RenderableSource {
	return RenderableSource.builder()
      .setSource(context, source, RenderableSource.SourceType.GLTF2)
      .setRecenterMode(RenderableSource.RecenterMode.ROOT)
      .build()
}
```

Attualmente[^sceneform-1.6] Sceneform supporta unicamente il fetching di modelli gLTF.

### Rendering e aggiunta del modello

Il rendering del modello avviene tramite la funzione `buildRenderable`, che è molto simile a quella utilizzata nel progetto precedente, con la differenza che in questo caso deve essere passato anche il modello che si è recuperato in precedenza.

```kotlin
fun buildRenderable(
  context: Context,
  model: RenderableSource,
  modelUri: Uri,
  onSuccess: (renderable: Renderable) -> Unit
) {
	ModelRenderable.builder()
      .setRegistryId(modelUri)
      .setSource(context, model)
      .build()
      .thenAccept(onSuccess)
      .exceptionally {
        Log.e("SCENEFORM", "unable to load model", it)
        return@exceptionally null
      }
}
```

L'aggiunta del modello renderizzato alla scena avviene mediante la medesima funzione `addTransformableNodeToScene` vista in precedenza.

[^sceneform-1.6]: Sceneform 1.6.0.
[^apk]: Formato delle applicazioni android.
