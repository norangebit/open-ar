# Progetti d'esempio

Per poter realizzare delle applicazioni mediante ARCore e Sceneform sono necessarie una serie di configurazioni iniziali.

Requisito necessario al funzionamento di ARCore è una versione di Android uguale o superiore ad Android 7.0 Nougat(API level 24).
Inoltre se si sta lavorando su un progetto con API level minore di 26 è necessario esplicitare il supporto a Java 8 andando a modificare file `app/build.gradle`.

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

Sempre nel file per il build del progetto è necessario aggiungere la dipendenza di Sceneform.

```gradle
implementation "com.google.ar.sceneform.ux:sceneform-ux:1.6.0"
```

Inoltre nell'Android Manifest[^manifest] va dichiarato l'utilizzo del permesso della fotocamera[^camera] e l'utilizzo di ARCore[^arcore].

[^manifest]: File in cui vengono dichiarate tutte caratteristiche di un'applicazione Android, tra cui anche i permessi.

[^camera]: Lo sviluppatore deve solo dichiarare l'utilizzo del permesso, la richiesta di concessione è gestita in automatico da Sceneform.

[^arcore]: L'utilizzo di ARCore deve essere dichiarata in quanto non tutti i dispositivi lo supportano.