
# NEON Chat

Unser absolut performanter, universell einsetzbarer Chat. WhatsApp ist lit, aber wir sind litter! (🏴󠁧󠁢󠁥󠁮󠁧󠁿-pun intended)

## Installation
In das ```pubspec.yaml``` des Projekts einfügen:

```yaml
neon-chat:
    git: 
        url: https://github.com/NEON-Software-Solutions/NEON_chat
```

## Setup
1. App in der Firebase Konsole registrieren und die GoogleService-Info.plist bzw. .json in die korrekten Verzeichnisse unter ```android``` und ```ios``` packen. Bei iOS das plist File über XCode einfügen! Wenn man über das Fileverzeichnis geht, rallt Flutter das nicht! 
Außerdem beim Setup von ```AppDelegate.swift``` diese Zeile NICHT!!! einfügen:

```swift
FirebaseApp.configure()
```
Die Doku der Firebase Konsole ist noch nicht auf dem Flutter-Standard (Stand 23.02.2022).
Das komplette Setup (iOS und Android App in Firebase anmelden), geht übrigens sehr entspannt mithilfe der [FlutterFireCLI][flutterfire_cli_link])

2. In der neu aufgesetzen Firebase die Authentication und FirebaseFirestore aktivieren.

3. Suchindizies im Firestore aktivieren. Der erste Request wird vermutlich schiefgehen, dann gibt es eine wunderschöne Konsolenausgabe mit Link, die dich genau dorthin führt, wo du hinwillst.

4. Die App, in die der Chat integriert werden soll, MUSS von ```firebase_core``` und ```firebase_auth``` abhängen, um sowohl die Firebase App zu initialisieren, als auch das Anmelden in Firebase zu ermöglichen.

5. Der Chat ermöglicht out-of-the-box das Teilen von Dateien, Fotos und Videos. Damit die App beim Versuch, ein Foto zu machen oder auf deine Galerie zuzugreifen, nicht crasht, musst du ein paar Keys ins Info.plist buttern: 

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

ZUSATZ:
Es macht mehr Fun, wenn schon Daten vorhanden sind, dafür die Authentication und den Firestore populaten (Coming soon: ein Mörderskript, das das automatisch macht)! Am einfachsten ist es, Nutzername/PW Anmeldung zu aktivieren und dich dann programmatisch wie in ```example/lib/main.dart``` einzuloggen, ohne jegliche UI (nur am Anfang natürlich!)
Falls die Daten im Firestore von Hand aufgesetzt werden sollten, bitte die Naming Conventions in ```lib/core/util/firebase_keys.dart``` beachten bzw. eigene etablieren und eine Instanz der ```FirebaseKeys``` Datenstruktur erstellen. Diese im ```getIt``` des Projekts registrieren, damit der Chat darauf zugreifen kann. Beim Benennen der FirebaseKeys die Staging/Production Logik beachten!!! (Staging Chats in z.B. ```staging-conversations``` speichern)

## Nutzung

Der Chat hat zwei Use-Cases: 

  1. Hirn auf Leerlauf, den Default NEON-Chat nutzen und nur Styling ändern.
  2. Irgendein Special Snowflake ❄ hat die Chat-Welt revolutioniert und das Default-Design reicht nicht aus. Also nur die Logik des NEON-Chats nutzen.

Unabhängig davon, welcher Fall auf dich zutrifft, musst du die ```RemoteDataSource``` implementieren, da sie die File-Uploads (Fotos, Videos, Dateien, Audionachrichten) ermöglicht. Das alles wird nämlich nicht in Firebase (dort liegt nur ein Link), sondern in einem anderen, projektspezifischen Backend gespeichert.

Ab jetzt wird differenziert!

Ich kenne meine Pappenheimer, daher bewegen wir uns gerade wahrscheinlich im Fall 1. 


Du kannst jetzt den Neon-Chat völlig hirnbefreit als Widget in deine App einbinden. Du musst dabei ```FirebaseAuth, FirebaseFirestore``` und ```RemoteDataSource```-Instanzen bereitstellen und kannst zahlreiche Styles zum customisen und Methoden für den Appbar-Tap oder das Öffnen eines Nutzerprofils übergeben!

FUNFACT: Solltest du in deinem Projekt [GetIt][get_it_link] verwenden, kannst du jetzt mithilfe von [mason][mason_link] das ```NEON-Chat-Injection-Brick``` generieren, um sowohl ```FirebaseFirestore``` als auch ```FirebaseAuth``` über ```getIt``` zu verwalten. Was? Du weißt nicht, wie das geht? 
Dann lies dir die Doku zu dem [Template Projekt][template_project_link] und den [NEON-Bricks][neon_bricks_link] durch. Die [Doku von Mason][mason_link] und [dieses Tutorial][mason_tutorial_link] sind auch sehr hilfreich.

TL;DR:
In das lib Verzeichnis wechseln und dann diesen Befehl ausführen:

```mason make firebase_injections```

Was? Dir steht das Brick nicht zur Verfügung, weil du diese App nicht mit der [NEON CLI][neon_cli_link] aufgesetzt hast? BigMac, bann den weg!

Wenn dir das mit den Bricks zu anstrengend ist (🤨) kannst du das File auch händisch (🤢) in den ```lib```-Ordner deines Projekts kopieren:

```example/lib/injection/firebase_injectable_module.dart```


(Komplettes Beispiel siehe ```example/lib/main.dart```)

```dart
...
 @override
  Widget build(BuildContext context) {
    return NeonChat(
        firebaseAuthInstance: getIt<FirebaseAuth>(),
        firebaseFirestoreInstance: getIt<FirebaseFirestore>(),
        remoteDataSource: getIt<RemoteDataSource>(),
    );
  }
```

Solltest du dich wider Erwarten in Fall 2 befinden, dann willst du höchstwahrscheinlich die gesamten UI-Komponenten neu bauen, oder die Chat-Logik sogar erweitern 😱 (falls du denkst, dass das auch für andere Projekte Sinn macht, dann hauen wir das mit ins Package)!

Dank der nicht vorhandenen Export-Regeln des Packages steht dir die gesamte NEON-Chat-Logik zur Verfügung 💪🏻 

Nutze sie, doch nutze sie weise 🧙🏻‍♂️ !

Selbstverständlich stehen dir auch alle Widgets aus dem Chat-Package zur Verfügung, tob dich aus!

Und jetzt: Abfahrt! 🏎


[flutterfire_cli_link]: https://firebase.flutter.dev/docs/overview/
[get_it_link]: https://pub.dev/packages/get_it
[mason_link]: https://pub.dev/packages/mason_cli
[template_project_link]: https://github.com/julien-neon/NEON_template_project
[neon_bricks_link]: https://github.com/julien-neon/NEON_bricks
[mason_tutorial_link]: https://www.youtube.com/watch?v=G4PTjA6tpTU
[neon_cli_link]: https://github.com/julien-neon/NEON_cli