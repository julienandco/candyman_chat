
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
1. App in Firebase registrieren, am besten mithilfe der [FlutterFireCLI][flutterfire_cli_link] und im Anschluss die automatisch generierten ```DefaultFirebaseOptions``` zum initialisieren nutzen (kein GoogleServiceInfo.plist bzw. .json Rumgebumse mehr!):

```dart
...
await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
...
```

Alternativ den alten Weg über die Firebase Konsole gehen, da gibt es aber ein paar Dinge zu beachten:
  a. Bei iOS das plist File über XCode einfügen! Wenn man über das Fileverzeichnis geht, rallt Flutter das nicht! 
  b. Beim Setup von ```AppDelegate.swift``` diese Zeile NICHT!!! einfügen:

```swift
FirebaseApp.configure()
```
Die Doku der Firebase Konsole ist noch nicht auf dem Flutter-Standard (Stand 23.02.2022).


2. In der neu aufgesetzen Firebase die Authentication und FirebaseFirestore aktivieren (wenn das durch das Backend noch nicht passiert ist).

3. Die App, in die der Chat integriert werden soll, MUSS von ```firebase_core``` und ```firebase_auth``` abhängen, um sowohl die Firebase App zu initialisieren, als auch das Anmelden in Firebase zu ermöglichen.

4. Anmeldung in ```FirebaseAuth``` implementieren, im Example Projekt hier ist das über ```signInWithEmailAndPassword``` gelöst, in deinem aktuellen Projekt höchstwahrscheinlich NICHT! NEON-Standard ist, dass du beim SignUp vom Backend den Custom-Firebase-Token zurückbekommst, den du am besten auf dem Device cachest. Diesen dann in Zukunft immer zum 
Anmelden verwenden: ```FirebaseAuth.signInWithCustomToken(myToken)```.

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

6. Einige dich mit dem Backend auf Naming Conventions(!!!) bei den Daten in FireStore, die sowohl Front- als auch Backend schreiben. Nutze dazu die ```FirebaseKeys``` Datenstruktur. Im Idealfall nutzt ihr die Default-Werte, dann muss dem Chat beim Initialisieren gar nichts übergeben werden.

## Nutzung

Der Chat hat zwei Use-Cases: 

  1. Hirn auf Leerlauf, den Default NEON-Chat nutzen und nur Styling ändern.
  2. Irgendein Special Snowflake ❄ hat die Chat-Welt revolutioniert und das Default-Design reicht nicht aus. Also nur die Logik des NEON-Chats nutzen.

Unabhängig davon, welcher Fall auf dich zutrifft, musst du die ```RemoteDataSource``` implementieren, da sie die File-Uploads (Fotos, Videos, Dateien, Audionachrichten) ermöglicht. Das alles wird nämlich nicht in Firebase (dort liegt nur ein Link), sondern in einem anderen, projektspezifischen Backend gespeichert.

Ab jetzt wird differenziert!

Ich kenne meine Pappenheimer, daher bewegen wir uns gerade wahrscheinlich im Fall 1. 


Du kannst jetzt den Neon-Chat völlig hirnbefreit als Widget in deine App einbinden. Du musst dabei ```FirebaseAuth, FirebaseFirestore``` und ```RemoteDataSource```-Instanzen bereitstellen und alles der ```NeonChat.initNeonChat()```-Methode übergeben. Diese soll nur einmal! pro App-Life-Cycle aufgerufen werden (wie ```Firebase.initializeApp```, pack sie also am besten in die main von deinem Projekt). Dabei musst du auch eine Funktion übergeben, die bei gegebenem ```BuildContext``` die Page auf den Navigator Stack pushed, in der du das ```NeonChat``` Widget instanziierst. Das ist nötig, damit sich die passende Konversation öfnnen kann, sobald du auf eine Push-Benachrichtigung klickst. Weiter unten im Widget Tree kannst du dann den ```NeonChat``` instanziieren und eigene Methoden für den Appbar-Tap oder das Öffnen eines Nutzerprofils übergeben und zahlreiche Styles selbst customizen! Achtung! Du musst ganz oben im Widget Tree (bevorzugt in ```app.dart``` o.Ä.) den ```ConversationsBloc``` providen! Ansonsten funktioniert der Push Notification Service nicht! Solltest du an einem Projekt ohne Push Notifications arbeiten, kannst du den Provider weglassen und dem ```NeonChat```-Widget das Flag ```provideConversationsBloc=true``` übergeben.

FUNFACT: Solltest du in deinem Projekt [GetIt][get_it_link] verwenden, kannst du jetzt mithilfe von [mason][mason_link] das ```Firebase-Injections-Brick``` generieren, um sowohl ```FirebaseFirestore``` als auch ```FirebaseAuth``` über ```getIt``` zu verwalten. Was? Du weißt nicht, wie das geht? 
Dann lies dir die Doku zu dem [Template Projekt][template_project_link] und den [NEON-Bricks][neon_bricks_link] durch. Die [Doku von Mason][mason_link] und [dieses Tutorial][mason_tutorial_link] sind auch sehr hilfreich.

TL;DR:
In das lib Verzeichnis wechseln und dann diesen Befehl ausführen:

```mason make firebase_injections```

Was? Dir steht das Brick nicht zur Verfügung, weil du diese App nicht mit der [NEON CLI][neon_cli_link] aufgesetzt hast? BigMac, bann den weg!

Wenn dir das mit den Bricks zu anstrengend ist (🤨) kannst du das File auch händisch (🤢) in den ```lib```-Ordner deines Projekts kopieren:

```example/lib/injection/firebase_injectable_module.dart```


(Komplettes Beispiel siehe ```example/lib/main.dart```)

```dart
void main() {
  ...

  NeonChat.initNeonChat(
    firebaseAuth: getIt<FirebaseAuth>(),
    firebaseFirestore: getIt<FirebaseFirestore>(),
    remoteDataSource: getIt<NeonChatRemoteDataSource>(),
    openAppChatPage: (context) => Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => const Scaffold(
          body: NeonChat(),
        ),
      ),
    ),
  );

  ...
}
...
 @override
  Widget build(BuildContext context) {
    return const NeonChat();
  }
```

Damit der NeonChat in vollem Glanz erstrahlt, müssen natürlich Push-Notifications her. Dazu dient der ```PushNotificationService```, der auch erst konfiguriert werden muss. Rufe dazu ```configurePushNotifications``` auf einer Instanz des ```PushNotificationService``` auf. ACHTUNG: Das muss in einem Ort im Widget Tree geschehen, in dem 
```dart 
Overlay.of(context) != null
```
gilt, also z.B. das allererste Widget deiner ```MaterialApp``` oder ```CupertinoApp``` (das home-Widget)!

Solltest du [GetIt][get_it_link] verwenden, könnte der Code so aussehen:

```dart
class MainAppLoader extends StatefulWidget {
  const MainAppLoader({Key? key}) : super(key: key);

  @override
  State<MainAppLoader> createState() => _MainAppLoaderState();
}

class _MainAppLoaderState extends State<MainAppLoader> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      getIt<PushNotificationService>().configurePushNotifications(
        context,
        onNewNotification: (message) {
          //do stuff
        },
      );
      Future.delayed(const Duration(seconds: 1), () {
        getIt<PushNotificationService>().checkInitialMessage();
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }
  ...
}
```

Noch ein kleiner Zusatz: Innerhalb der ```ChatImageBubble``` wird ein ```CachedNetworkImage``` verwendet, um verschickte Bilder anzuzeigen. Sollte das Backend, dass du in diesem Projekt nutzt, http Headers erwarten, kannst du auch diese initialiseren! Rufe dazu einfach die Funktion ```NeonChat.initHttpHeaders``` auf! Kleines Beispiel gefällig?

```dart 
...
NeonChat.initHttpHeaders({'Authorization': 'myCustomJWT123'});
...
```

Das klingt zu einfach? Stimmt! 🥴

Solltest du dich wider Erwarten in Fall 2 befinden, dann willst du höchstwahrscheinlich die gesamten UI-Komponenten neu bauen, oder die Chat-Logik sogar erweitern 😱 (falls du denkst, dass das auch für andere Projekte Sinn macht, dann hauen wir das mit ins Package)!

Dank der nicht vorhandenen Export-Regeln des Packages steht dir die gesamte NEON-Chat-Logik zur Verfügung 💪🏻 

Nutze sie, doch nutze sie weise 🧙🏻‍♂️ !

Selbstverständlich stehen dir auch alle Widgets aus dem Chat-Package zur Verfügung, tob dich aus!

Als letzer Hinweis: die erste Nutzung wird höchstwahrscheinlich schiefgehen, weil du noch Suchindizies im Firestore aktivieren musst. Dazu kommt dann eine wunderschöne Konsolenausgabe mit Link, die dich genau dorthin führt, wo du hinwillst.

Und jetzt: Abfahrt! 🏎


[flutterfire_cli_link]: https://firebase.flutter.dev/docs/overview/
[get_it_link]: https://pub.dev/packages/get_it
[mason_link]: https://pub.dev/packages/mason_cli
[template_project_link]: https://github.com/julien-neon/NEON_template_project
[neon_bricks_link]: https://github.com/julien-neon/NEON_bricks
[mason_tutorial_link]: https://www.youtube.com/watch?v=G4PTjA6tpTU
[neon_cli_link]: https://github.com/julien-neon/NEON_cli