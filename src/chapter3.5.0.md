## Animazioni e movimento

Negli esempi discussi fino a questo momento sono stati usati unicamente asset tridimensionali statici.
Gli oggetti virtuali che di volta in volta sono stati integrati nel mondo reale non erano né dotati di animazioni, né erano in grado di muoversi all'interno dell'ambiente reale circostante.
La scelta di utilizzare modelli statici è stata dettata da un lato dalla filosofia *kiss*[^kiss], e quindi di concentrarsi unicamente sull'aspetto rilevante del progetto, dall'altro da un supporto quasi inesistente alle animazioni e al movimento.

Come abbiamo avuto modo di vedere nel secondo capitolo, queste lacune sono da imputare principalmente alla libreria grafica.
Infatti sia per le animazioni, sia per la gestione del movimento, Sceneform non offre alcun supporto nativo o diretto.
Nonostante ciò è possibile aggirare il problema tramite opportuni escamotage, anche se bisogna tenere in conto che i risultati sono generalmente modesti e macchinosi da raggiungere.

### Animazioni

L'utilizzo di oggetti animati oltre ad essere un orpello grafico diventa, in molti casi, un aspetto fondamentale nel processo di sviluppo.
Questo è ancora più vero nello sviluppo di applicazioni AR su smartphone che, per forza di cose, hanno nell'utenza consumers lo sbocco naturale.
Il mancato utilizzo di un'animazione potrebbe segnare in modo permanete l'esperienza utente e quindi determinare il fallimento del progetto.

Non a caso uno dei problemi più discussi nell'issues tracker di Sceneform su GitHub\cite{googlear:Animated3DObjects:2019}, è proprio la totale mancanza di supporto alle animazioni.
Sebbene ci siano stati dei lavori in questo senso ed una prima contabilità con i modelli animati FBX sia stata aggiunta alla code base, ad oggi non è possibile utilizzare questa funzione, in quanto è in fase di testing per il solo personale interno.

In attesa di un rilascio al pubblico, l'unica via percorribile è quella presentata dalla stessa Google durante un codelab\cite{googlear:ChromaKey:2019}.
La soluzione consiste nel renderizzare un schermo trasparente nel mondo reale e proiettare su di esso un video.
Affinché l'*illusione* riesca è necessario usare un video che sfrutti il *chroma key*[^chroma-key], in questo modo l'integrazione con il mondo reale risulta migliore.
Inoltre per impedire che l'utente possa guardare il retro dello schermo è consigliabile rendere quest'ultimo solidale con l'utente.

Non solo risultano evidenti le limitazioni di questo metodo, ma anche la natura più di *pezza* che soluzione al problema, che non lo rendono adatto per un utilizzo commerciale.

[^kiss]: Acronimo di *Keep It Simple, Stupid*, è un principio di programmazione che consiglia di concentrarsi su un problema alla volta.

[^chroma-key]: Conosciuto anche con il nome di *green screen*, è una tecnica cinematografica che permette di sovrapporre due sorgenti video. Nel caso specifico la prima fonte video è catturata in real time dal sensore fotografico del device, mentre la seconda è quella che vogliamo integrare nell'ambiente.
