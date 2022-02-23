
# NEON Chat

Unser absolut performanter, universell einsetzbarer Chat. WhatsApp ist lit, aber wir sind litter! (🏴󠁧󠁢󠁥󠁮󠁧󠁿-pun intended)

Firebase Setup unbedingt mit FlutterFire CLI machen! (ist wesentlich entspannter)
Google-Services.json/plist muss man manuell einfügen! (für iOS über xcode, wenn man das einfach ins filesystem kopiert, wird es nicht verlinkt).

Beim ersten run der app wird sie vermutlich abschmieren, da currentuser von firebase auth noch null ist.

du musst firebse auth erst in der firebase konsole aktivieren (firebase firestore auch!).
anonym ist witzlos, weil dann alles auf null gesetzt ist. aktiviere die email/pw anmeldung und setze einen test user über firebase konsole in die datenbank. dann kannst du dich 
programmatisch im code anmelden (s. example/lib/main.dart).

um die magie passieren zu sehen, ist es hilfreich, die firebase firstore collectoins mit chat nachrichten zu füllen (entweder per hand, oder programmatisch mit ConversationsRepository.createConversation).

Beim Aufsetzen bitte die naming conventions in lib/core/firebase_keys.dart beachten!
TODO: datenstruktur aufsetzen, die custom strings abspeichert, damit man beliebige firebase
implementierung mit diesem package nutzen kann!

anschließend musst du indizes für die erstellten collections machen (für den anfang messages, was eine subcollection einer conversation ist (die in der collection conversations zu finden ist)).

damit die app nicht beim versuch, ein foto zu machen crasht, musst du ein paar keys ins Info.plist buttern: 
```
<key>NSAppTransportSecurity</key>
<dict>
	<key>NSAllowsArbitraryLoads</key>
	<true/>
</dict>
<key>NSPhotoLibraryUsageDescription</key>
<string>Gallerie bite.</string>
<key>NSCameraUsageDescription</key>
<string>Kamera bite.</string>
<key>NSMicrophoneUsageDescription</key>
<string>Mikro bite.</string>
```

für das auffüllen ein skript schreiben? conversations,messages und users populaten

noch logik für staging/production einführen. es soll in die collections staging/conversations bzw. production/conversations geschrieben werden, damit man später staging löschen/bearbeiten kann.

##Features: 
Gesamte Logik, die man benötigt, um eine super-custom Chat UI zu bauen.

Keine wahnsinnige UI, sondern standard? Dann nutze DefaultConversationLoader, DefaultConversationPage, DefaultConversationsLoader und DefaultConversationsPage und style sie dem Fall entsprechend!
<!-- 
## Stand 17.02.21:
- habe Hadis Code aus Papeo kopiert und ihn syntax-fehler-frei im package zum laufen gebracht
- package kann in flutter projekte importiert werden
- viele files sind komplett auskommentiert (oft im data/models ordner), da sie durch freezed
redundant geworden sind. habe sie noch nicht gelöscht, da ich zu testungszwecken gerne
hadis komplette codebase behalten möchte.
- bei einigen files ist daher im unteren teil ein ```TODO: old```, als Verweis auf die alte Implementierung

- das ziel war folgende verwendung: in der ```main.dart``` des flutter projekts muss zunächst

```dart 
NEONChat.initializeChat(...);
```

aufgerufen werden, mit allen für den Chat nötigen Abhängigkeiten (firebaseAuth, firebaseFirestore etc.). auf diese weise können wir singletons erzeugen (ohne getIt, da das leider nicht auf die packages sieht, sondern nur in der flutter app bleibt).

Erst nachdem der ```init``` call stattgefunden hat, kann man auf die getter von ```NEONChat``` zugreifen. Verwendung habe ich mir folgendermaßen vorgestellt:

```dart
//Das hier ist in einem Chat-UI-bezogenen File, z.B. ChatPage:
...
return BlocProvider<ChatSearchBloc, ChatSearchState>(
    create: (_) => NEONChat.chatSearchBloc,
    ...
);
```

etc. Auf die Chat-bezogenen Blocs wird also nicht via ```getIt```, sondern statisch zugegriffen. Außerdem exportiert das package zahlreiche Widgets, wie z.B. die ```ChatBottomBar``` (die ganzen ätzenden Features davon wie z.B. FilePicker, AudioRecorder sind leider noch nicht getestet, aber 1-zu-1 von papeo übernommen und da liefen sie 🤪 - also feel free das auszutesten!).

Sollte das zu schwammig oder etwas unklar sein, mich (Julien) einfach auf Slack/WhatsApp anhauen! -->

<!-- ## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more. -->
