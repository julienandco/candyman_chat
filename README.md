
# NEON Chat

Unser absolut performanter, universell einsetzbarer Chat. WhatsApp ist lit, aber wir sind litter! (🏴󠁧󠁢󠁥󠁮󠁧󠁿-pun intended)

## Installation
In das ```pubspec.yaml``` des Projekts einfügen:

```yaml
neon-chat:
    git: 
        url: https://github.com/julien-neon/NEON_chat
```

## Setup
1. App in der Firebase Konsole registrieren und die GoogleService-Info.plist bzw. .json in die korrekten Verzeichnisse unter ```android``` und ```ios``` packen. Bei iOS das plist File über XCode einfügen! Wenn man über das Fileverzeichnis geht, rallt Flutter das nicht! 
Außerdem beim Setup von ```AppDelegate.swift``` diese Zeile NICHT!!! einfügen:

```swift
FirebaseApp.configure()
```
Die Doku der Firebase Konsole ist noch nicht auf dem Flutter-Standard (Stand 23.02.2022).
Das komplette Setup (iOS und Android App in Firebase anmelden), geht übrigens sehr entspannt mithilfe der [FlutterFireCLI][flutterfire_cli_link])

2. Die App, in die der Chat integriert werden soll, MUSS von ```firebase_core, firebase_auth``` und ```cloud_firestore``` abhängen, um den Chat initialisieren zu können!

3. Die App MUSS die abstrakte Klasse ```RemoteDataSource``` implementieren und sie dem Chat zur Verfügung stellen, damit jegliche File-Uploads funktionieren (Bilder, Videos und Sprachnachrichten). Das wird alles nämlich nicht in Firebase gespeichert, sondern in einem anderen Backend.

4. In der neu aufgesetzen Firebase die Authentication und FirebaseFirestore aktivieren.

5. Es macht mehr Fun, wenn schon Daten vorhanden sind, dafür die Authentication und den Firestore populaten (Coming soon: ein Mörderskript, das das automatisch macht)! Am einfachsten ist es, Nutzername/PW Anmeldung zu aktivieren und dich dann programmatisch wie in ```example/lib/main.dart``` einzuloggen, ohne jegliche UI (nur am Anfang natürlich!)
Falls die Daten im Firestore von Hand aufgesetzt werden sollten, bitte die Naming Conventions in ```lib/core/util/firebase_keys.dart``` beachten bzw. eigene etablieren und dem Chat als ```FirebaseKeys``` Datenstruktur übergeben. Dabei die Staging/Production Logik beachten!!! (Staging Chats in z.B. ```staging-conversations``` speichern)

6. Suchindizies im Firestore aktivieren. Der erste Request wird vermutlich schiefgehen, dann gibt es eine wunderschöne Konsolenausgabe mit Link, die dich genau dorthin führt, wo du hinwillst.

7. Damit die App beim Versuch, ein Foto zu machen oder auf deine Gallerie zuzugreifen, nicht crasht, musst du ein paar Keys ins Info.plist buttern: 

```plist
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


## Nutzung

Keine wahnsinnige UI, sondern Standard? Dann nutze ```DefaultConversationLoader, DefaultConversationPage, DefaultConversationsLoader``` und ```DefaultConversationsPage``` und style sie der App entsprechend! Diese Widgets funktionieren out-of-the-box und ein Anwendungsbeispiel findest du in ```example/lib/main.dart```.

Dabei bietet es sich natürlich an, Dependency Injection mithilfe von ```getIt``` zu verwenden! So kann der Code aus ```example/lib/main.dart``` noch schlanker gemacht werden:

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // kann jetzt gelöscht werden :D

    // final firestore = FirebaseFirestore.instance;
    // final firebaseAuth = FirebaseAuth.instance;
    // final remoteDataSource = _MyDataSource();

    return MaterialApp(
      title: 'NEON Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultConversationsLoader(
        firestore: getIt<FirebaseFirestore>(),
        firebaseAuth: getIt<FirebaseAuth>(),
        remoteDataSource: getIt<RemoteDataSource>(),
      ),
    );
  }
}
```

Sollte der Chat völlig extravant aussehen und jedes ```ChatItem, MessageBubble``` und die ```MessageList``` den Ansprüchen nicht gerecht werden, kann auch nur auf die Logik des Packages zugegriffen werden. Durch die gesamten Blocs wird alles exportiert, was man für das Implementieren eines Chat-Features benötigt!

Auch hier bietet es sich an, mit ```getIt``` zu arbeiten, um die Instanziierung der Blocs schöner zu gestalten:

```dart
// Zunächst können wir ein eigenes Modul für den Chat deklarieren:
// (Dazu nehmen wir an, dass FirebaseFirestore, FirebaseAuth und die (optionale) Implementierung von FirebaseKeys innerhalb eines Firebase-Injection-Moduls deklariert sind (s. Papeo-Repo als Referenz))
@module
abstract class NEONChatInjectableModule {
  @lazySingleton
  ConversationsRepository get conversationsRepository => ConversationsRepositoryImpl(
        firestore: getIt<FirebaseFirestore>(),
        firebaseAuth: getIt<FirebaseAuth>(),
        firebaseKeys: getIt<FirebaseKeys>(),
    );
  @lazySingleton
  ConversationRepository get conversationRepository => ConversationRepositoryImpl(
        firestore: getIt<FirebaseFirestore>(),
        firebaseAuth: getIt<FirebaseAuth>(),
        firebaseKeys: getIt<FirebaseKeys>(),
    );

  @lazySingleton
  FirebaseUserProfileRepository get userProfileRepository => FirebaseUserProfileRepositoryImpl(
        firestore: getIt<FirebaseFirestore>(),
        firebaseKeys: getIt<FirebaseKeys>(),
    );
}
```

und dann innerhalb der App:

```dart

... 
ConversationsBloc(
    conversationsRepository: getIt<ConversationsRepository>(),
    conversationRepository: getIt<ConversationRepository>(),
    userProfileRepository: getIt<FirebaseUserProfileRepository>(),
);

...
```


[flutterfire_cli_link]: https://firebase.flutter.dev/docs/overview/
