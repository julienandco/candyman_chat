# 💬 NEON Chat

Unser absolut performanter, universell einsetzbarer Chat. WhatsApp ist lit, aber wir sind litter! (🏴󠁧󠁢󠁥󠁮󠁧󠁿-pun intended)

## 👨🏻‍🔧 Installation
In das ```pubspec.yaml``` des Projekts einfügen:

```yaml
neon-chat:
    git: 
        url: https://github.com/NEON-Software-Solutions/NEON_chat
```

🚨 Achtung! Dieses Package funktioniert nur in Kombination mit [AutoRoute][auto_route_package]! Hast du das Routing in deiner App anders gelöst?? Red Flag 🚩

## 🧪 Setup
1. App in Firebase registrieren, am besten mithilfe der [FlutterFireCLI][flutterfire_cli_link] und im Anschluss die automatisch generierten ```DefaultFirebaseOptions``` zum initialisieren nutzen (kein GoogleServiceInfo.plist bzw. .json Rumgenerve mehr!):

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

## ⚙️ Nutzung

Der Chat hat zwei Use-Cases: 

  1. Hirn auf Leerlauf, den Default NEON-Chat nutzen und nur Styling ändern.
  2. Irgendein Special Snowflake ❄ hat die Chat-Welt revolutioniert und das Default-Design reicht nicht aus. Also nur die Logik des NEON-Chats nutzen.

Unabhängig davon, welcher Fall auf dich zutrifft, musst du die ```RemoteDataSource``` implementieren, da sie die File-Uploads (Fotos, Videos, Dateien, Audionachrichten) ermöglicht. Das alles wird nämlich nicht in Firebase (dort liegt nur ein Link), sondern in einem anderen, projektspezifischen Backend gespeichert.

Falls du dich in Fall 1 befindest oder auch wenn du alles selber baust, aber das ```MessageContentWidget``` bzw. die ```openConversation```-Methode aus ```util_functions.dart``` nutzt, musst du das Routing noch aufsetzen. Erweitere dazu dein app-spezifisches ```router.dart```-File:

```dart
part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Loader|Page,Route',
  routes: <AutoRoute>[
    ...

    //NUR diese zwei Routen einfügen!

    //NEON-Chat-Package specific
    AutoRoute(page: DefaultConversationLoader),
    AutoRoute(page: ChatMediaViewerLoader),
  ],
)

class AppRouter extends _$AppRouter {}
```

Ab jetzt wird differenziert!

Ich kenne meine Pappenheimer, daher bewegen wir uns gerade wahrscheinlich im Fall 1. 

TL;DR: Rufe ```NeonChat.initNeonChat``` in der ```main``` deiner App auf und falls du für das Fetchen von Bildern, Videos, Dateien etc. im Chat http-Headers benötigst, so rufe ```NeonChat.initHttpHeaders``` auf, sobald dir alle nötigen Informationen dazu bekannt sind (z.B. sobald JWT vom Backend geholt wurde). Falls dir korrektes Timestamp-Formatting wichtig ist, rufe auch ```NeonChat.initNeonChatLocale``` auf und übergib die Locale deiner App!


Du kannst jetzt den Neon-Chat völlig hirnbefreit als Widget in deine App einbinden. Du musst dabei ```FirebaseAuth, FirebaseFirestore```, ```RemoteDataSource``` und ein paar wenige weitere Instanzen bereitstellen (der Rest ist optional) und alles der ```NeonChat.initNeonChat()```-Methode übergeben. Hier passiert das KOMPLETTE Customizen des NEON-Chats! Auch eigene Methoden für den Appbar-Tap oder das Öffnen eines Nutzerprofils und zahlreiche Styles können hier übergeben werden. Näheres zu allen Flags, die du bei der Initialisierung übergeben kannst, findest du unten im Abschnitt **Doku** und natürlich im Code.

Diese Methode soll nur *einmal*! pro App-Life-Cycle aufgerufen werden (wie ```Firebase.initializeApp```, pack sie also am besten in die main von deinem Projekt). Dabei musst du (innerhalb der ```RoutingInitData```) auch eine Route zu der Page übergeben, auf der sich das ```NeonChat```-Widget befindet. Das ist nötig, damit die Routing-Funktion ```openConversation``` funktioniert (das ```NeonChat``` - Widget providet nämlich einige BLoCs über die ```DefaultConversationsPage```, sodass einfach nur das Pushen einer ```DefaultConversationPage``` zu ```ProviderNotFound```-Errors führen würde). 

Weiter unten im Widget Tree kannst du dann den ```NeonChat``` instanziieren (s. unten oder im example-Projekt). 🚨 Achtung! Du musst ganz oben im Widget Tree (bevorzugt in ```app.dart``` o.Ä.) den ```ConversationsBloc``` providen! Ansonsten funktioniert der Push Notification Service nicht! Solltest du an einem Projekt ohne Push Notifications arbeiten, kannst du den Provider weglassen und dem ```NeonChat```-Widget das Flag ```provideConversationsBloc=true``` übergeben.

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
    locale: 'de_DE',
    firebaseAuth: getIt<FirebaseAuth>(),
    firebaseFirestore: getIt<FirebaseFirestore>(),
    remoteDataSource: getIt<NeonChatRemoteDataSource>(),
    routingInit: RoutingInitData(
      chatPageRoute: const ChatRoute(),
      ...
    ),
    ...  
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

Noch ein kleiner Zusatz: Innerhalb der ```ChatImageBubble``` wird ein ```CachedNetworkImage``` verwendet, um verschickte Bilder anzuzeigen. Sollte das Backend, dass du in diesem Projekt nutzt, http Headers erwarten, kannst du auch diese initialiseren! Rufe dazu einfach die Funktion ```NeonChat.initHttpHeaders``` auf!

🚨 Achtung: Die Headers werden als leere Map ```{}``` initialisiert. Solltest du also über den Chat auf Bilder im Backend zugreifen, für die eine Authorization nötig ist, bevor du die Headers über ```NeonChat.initHttpHeaders``` initialisiert hast, wirst du nichts bzw. nur den Placeholder sehen!

Kleines Beispiel gefällig?

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


Wer den Chat nicht checkt und meine schweißtreibende Doku (s. unten) nicht liest: direkt Berlin-Brandenburg-Verbot ⛔️

Als letzer Hinweis: die erste Nutzung wird höchstwahrscheinlich schiefgehen, weil du noch Suchindizies im Firestore aktivieren musst. Dazu kommt dann eine wunderschöne Konsolenausgabe mit Link, die dich genau dorthin führt, wo du hinwillst. Außerdem kannst du dir das Leben sehr schnell sehr schwer machen, wenn komische Firebase Regeln definiert werden, aber das findest du schon selber raus :)

Und jetzt: Abfahrt! 🏎


## 📜 Doku

Vorab: Im gesamten Package wirst du auf die Begriffe Conversation und Conversations stoßen. Da "Chat" der Name für das Package/Feature ist, mussten für die Entities und Models andere Bezeichnungen her. So ist also das, was man umgangssprachlich als einen Chat beschreiben würde (eine Unterhaltung zw. zwei Personen, bzw. eine Gruppenunterhaltung), im Code als Conversation (DirectConversation oder GroupConversation) dargestellt. Daher wirst du unter ```ConversationPage``` den "Chat"-Verlauf und die für einen Chat typische Message-Bubble finden und unter ```ConversationsPage``` die "Homepage" des Chats, sprich alle deine offenen "Chats" (Conversations).

Zu jeder guten Packagenutzung gehört natürlich das ausführliche Studieren der Doku. Ich habe so gut es geht, die Funktionen und Felder der Datenstrukturen, mit denen du den Chat customizen kannst, im Code dokumentiert, sodass du alles per Hover in VS Code sehen können müsstest. Es kann gut sein, dass ich an manchen Stellen zu sparsam mit meinen Worten war oder sogar gar nichts geschrieben habe. Sobald so etwas auffällt: direkt an mich (Julien) wenden, ich erklärs dir und schreibe ein bisschen Doku. Weil ich aber einfach ein geiler Typ bin, habe ich mir im Voraus schon mal ein bisschen die Mühe gemacht und versucht, meine kreativen Ergüsse, die in diesem Package zuhauf auftreten, in Wort zu fassen.

Hier also eine nach bestem Wissen und gewissen vollständige (🥴) Doku aller Flags, mit denen du den Chat einrichten kannst (Stand: 22.07.2022): 

## NeonChat (Widget)
- ```provideConversationsBloc```: Boolean Flag, das bestimmt, ob das ```NeonChat```-Widget eine ```ConversationsBloc```-Instanz providet. Das Flag ist by default auf ```false``` gestellt, da wir in den meisten Apps den ```ConversationsBloc``` top-level injecten, um jederzeit auf Firebase Data Messages listenen zu können.

## NeonChat.initNEONChat
### Firebase
- ```firebaseAuth (FirebaseAuth)```: Die FirebaseAuth-Instanz deiner App.
- ```firebaseFirestore (FirebaseFirestore)```: Die FirebaseFirestore-Instanz deiner App.
- ```firebaseKeys (FirebaseKeys, optional)```: Dieser Parameter ist aus gutem Grund optional: fass ihn nicht an! Dort sind die Keys definiert, die in Firebase genutzt werden. Sollte mal in einem Projekt (wider Erwarten, also überlegt es euch wirklich gut) andere Keys im Firebase-Backend genutzt werden, dann hinterlegt sie in dieser "Map"-Datenstruktur, sonst läuft gar nichts.

### Backend
- ```remoteDataSource (NeonChatRemoteDataSource)```: Deine Implementierung der NeonChatRemoteDataSource. Sie wird für das Hochladen und löschen von Files benötigt.

### Funktionen
Du musst eine Instanz der Datenstruktur ```FunctionInitData``` übergeben. Diese Datenstruktur hat folgende Felder:

- ```getUserForID```: Funktion, die für eine gegebene UserID (String) ein ```Future<FirebaseUser>``` zurückgibt. Wrappe dafür das Ergebnis deines app-spezifischen "getUser"-Calls in die im NEONChat definierte ```FirebaseUser```-Datenstruktur.
- ```isAuthenticated```: Funktion, die zurückgibt, ob der aktuelle Nutzer authentifiziert ist. Da wir in den meisten unserer Apps aber sowieso Auth-Walls haben und der Chat sowieso nur funktioniert, wenn man in Firebase eingeloggt ist, kannst du diese Funktion so gut wie immer ignorieren. 
- ```onDirectConversationAppBarTap```: Funktion, die aufgerufen wird, sobald auf die ConversationAppBar einer ```DirectConversation``` oder in der ```ConversationsPage``` auf das Profilbild des Konversationspartners getippt wird. 🚨 Achtung: Solltest du eine ```CustomConversationAppBar``` implementiert haben, musst du das onTap-Verhalten natürlich dort spezifieren und diese Methode wird nur beim Profilbild-Tap auf der ```ConversationsPage``` aufgerufen.
- ```onGroupConversationAppBarTap```: Analog zu ```onDirectConversationAppBarTap```, nur für ```GroupConversation```.  
- ```disableGroupConversationAppBarTap```: Solltest du KEINE ```CustomConversationAppBar``` implementiert haben, so wird beim Tippen auf die AppBar in einer Gruppenkonversation nichts ausgeführt, eine eventuell über ```onGroupConversationAppBarTap``` übergebene Funktion wird ignoriert. 
- ```onOpenUserProfile```: Wenn die Default Funktionalität bei einem Gruppenkonversations-AppBar-Tap ausgeführt wird (```onGroupConversationAppBarTap == null```), dann wird eine Liste an Usern (Mitglieder der Gruppe) angezeigt. Die Funktion ```onOpenUserProfile``` wird ausgeführt, wenn auf einen dieser User getippt wird. 🚨 Achtung: Solltest du eine eigene Implementierung von ```onGroupConversationAppBarTap``` an den Chat übergeben haben, so hat diese Funktion keinerlei Auswirkung und kann weggelassen werden.
- ```getConversationMessageTypeDisplayString```: Funktion, die für gegebenen ```ConversationMessageType``` einen String zurückgibt. Das ist die Vorschau, die du z.B. bei einer Audio by default in der ```ConversationsPage```sehen würdest: 🎤 voice. Sollte dir "voice" nicht gefallen und du möchtest stattdessen z.B. "Sprachnachricht" dort stehen haben, so implementiere diese Funktion.
- ```getConversationCreationData```: Funktion, die eine Instanz von ```ConversationCreationData``` zurückgibt, sprich die zur Erstellung einer neuen Konversation (Direkt oder Gruppe) nötigen Daten. 🚨 Achtung: diese Funktion wird nur verwendet, wenn in der übergebenen ```ConversationsStyle```-Instanz ```showFab==true``` UND ```fabAction==null``` gilt! Das wird aber meistens nicht der Fall sein, da du app-spezifisch die Erstellung eines Chats anders triggern möchtest und nicht einfach nur per FloatingActionButton (FAB) im ChatScreen. Dieses Flag kannst du also in 95% der Fälle ignorieren!



### Routing
Du musst eine Instanz der Datenstruktur ```RoutingInitData``` übergeben. Diese Datenstruktur besteht zu 66% aus Boilerplate-Code, da nur die ```chatPageRoute``` wirklich app-spezifisch ist, die anderen zwei Routen musst du nur in deine ```router.dart``` einfügen (s.oben), damit sie im ```StackRouter``` deiner App registriert sind. Du willst also immer genau das hier übergeben:

```dart
NeonChat.initNEONChat(
  ...,
  routingInit: RoutingInitData(
      chatPageRoute: const ChatRoute(), //TODO: das hier zu dem Namen deiner app-spezifischen Route, die zum Chat führt, ändern!
      buildConversationRoute: (convoID, showCloseButton, convosBloc) =>
          DefaultConversationRoute(
        conversationId: convoID,
        showCloseButton: showCloseButton,
        conversationsBloc: convosBloc,
      ),
      buildChatMediaViewerRoute: (title, message, conversationBloc) =>
          ChatMediaViewerRoute(
              title: title, message: message, convoBloc: conversationBloc),
  ),
  ...
)
```

Der Vollständigkeit halber noch eine Auflistung aller Flags dieser Datenstruktur:
- ```chatPageRoute```: Die ```PageRouteInfo```, die zu der ChatPage deiner App führt. In anderen Worten: wenn das Chat-Package
```dart
context.router.push(chatPageRoute);
```
ausführt, soll man auf der ChatPage landen.
- ```buildConversationRoute```: Funktion, die die ```PageRouteInfo``` zurückgibt, die eine ```DefaultConversationPage``` öffnet.
- ```buildChatMediaViewerRoute```: Funktion, die die ```PageRouteInfo``` zurückgibt, die eine ```_ChatMediaViewerPage``` öffnet.

### Widgets
Du kannst eine Instanz der Datenstruktur ```WidgetInitData``` übergeben. Diese Datenstruktur hat folgende Felder:
- ```getUserAvatar```: Funktion, die für eine gegebene UserID (String) ein Widget zurückgibt, das in der ```ConversationsPage``` neben der letzten Nachricht angezeigt wird (wie bei den WhatsApp-Chats) und in der ```ConversationPage``` in der AppBar. Solltest du eine eigene ```ConversationAppBar``` implementiert haben (s. oben), dann wird diese Funktion nur für die ```ConversationsPage``` genutzt.
- ```getGroupAvatar```: Analog zu ```getUserAvatar``` mit gegebener ConversationID (String).
- ```conversationDateSeparatorBuilder```: Funktion, die gegeben einem timestamp (DateTime), ein Widget zurückgibt, das als Separator zwischen Nachrichten zweier verschiedener Tage dient.

### Datenstrukturerweiterungen
Du kannst eine Instanz der Datenstruktur ```AdditionalDataInitData``` übergeben. Diese Datenstruktur hat folgende Felder:
- ```additionalDirectConversationDataConfig```: Datenstruktur, die zusätzliche Felder für eine 1-on-1-Konversation definiert. Am besten an einem Beispiel erklärt: 

Die Datenstruktur ```DirectConversation``` ist im Package so definiert: 
```dart 
class DirectConversation implements Conversation {
  final String _id;
  final String _displayName;
  final String? _thumbnail;
  final bool _isBlockedForMe;
  final DateTime _createdAt;
  final Map<String, dynamic>? _additionalData;

  /// Only the other user
  final FirebaseUser conversationPartner;
	...
}
```
Das heißt, jede ```DirectConversation``` soll diese Flags besitzen. Jetzt möchtest du aber in deinem aktuellen Projekt noch weitere Informationen abspeichern, zum Beispiel eine eventID (String), weil es in deiner neuen App z.B. nötig ist, für jedes ```DirectConversation``` Objekt in Firebase auch eine eventID zu speichern, weil du damit etwas machen möchtest (z.B. onTap die passende Seite dazu öffnen). Normalerweise würdest du jetzt eine neue Klasse ```MyDirectConversation extends DirectConversation``` schreiben, da das eben beschriebene DIE Definition von Vererbung ist. Da wir hier aber mit einem Package arbeiten, das im Idealfall als "Black Box" genutzt werden soll (wenn du jedes Mal die komplette BLoC-Logik neu schreibst, hätte ich mir die Nummer hier auch sparen können), müssen wir dem Package diese Information anderes zukommen lassen.

Auftritt ```AdditionalConversationDataConfig```! Implementiere deine eigene Version von dieser Klasse und packe alle deine gewünschten zusätzlichen Daten (in diesem Fall ein Feld mit dem Namen "eventID" und dem Typ String) in dort hinein. So könnte das aussehen:

```dart
class ConversationEventData implements AdditionalConversationDataConfig {
  @override
  List<AdditionalConversationDataInfo> get additionalDataInfos =>
      [_ConversationEventDataInfo()];
}

class _ConversationEventDataInfo
    extends AdditionalConversationDataInfo<String?, String?> {
  _ConversationEventDataInfo()
      : super(
          firebaseKey: 'eventId',
          fromJson: (dynamic json) => json,
          toJson: (dynamic eventID) => eventID,
        );
}
```
Die Implementierung von ```AdditionalConversationDataConfig``` macht nichts anderes, als eine Liste von ```AdditionalConversationDataInfo``` zurückzugeben, die eigentliche Magie passiert in ```AdditionalConversationDataInfo```. Und dort mache ich nichts anderes, als den Namen des Feldes zu spezifieren (dieser wird dann auch in Firebase verwendet und so wird die Datenstruktur geparsed!) und jeweils eine to- und fromJSON Methode (in diesem Fall nicht sehr spannend, einfach eine Identitätsfunktion, weil String fromJSON und toJSON sehr straight-forward ist).
Natürlich hört das Ganze nicht bei einem zusätzlichen Flag auf, denn ```AdditionalConversationDataConfig``` gibt ja eine LISTE an ```AdditionalConversationDataInfo``` zurück! Du musst also für JEDES zusätzliche Feld, dass du in deiner ```DirectConversation```-Datenstruktur gerne hättest, eine Kindklasse von ```AdditionalConversationDataInfo```schreiben und der Hase läuft 🐇!

- ```additionalGroupConversationDataConfig```: Genau analog zu ```additionalDirectConversationDataConfig```, nur für ```GroupConversation```.

### Styling
Du kannst eine Instanz der Datenstruktur ```StyleInitData``` übergeben. Diese Datenstruktur hat folgende Felder:
- ```conversationStyle```: Datenstruktur, die verschiedene Farben, Strings etc. enthält, die das Styling einer Conversation betreffen (sprich, die ```ConversationPage```, in der effektiv mit der anderen Person / mit der Gruppe geschrieben wird). Unter anderem kannst du dort unter ```buildCustomConversationAppBar``` eine Funktion hinterlegen, die ein Widget zurückgibt und zwar deine custom implementierte AppBar. Genauere Erklärungen findest du im Code.
- ```conversationsStyle```: Datenstruktur, die verschiedene Farben, Strings etc. enthält, die das Styling der Conversations betreffen (sprich, die Übersicht aller deiner Unterhaltungen auf der ```ConversationsPage```). Genauere Erklärungen findest du im Code.
- ```messageBubbleStyle```: Datenstruktur, die verschiedene Farben, Strings etc. enthält, die das Styling einer MessageBubble betreffen. Genauere Erklärungen findest du im Code.
- ```searchAppBarStyle```: Datenstruktur, die verschiedene Farben, Strings etc. enthält, die das Styling der SearchBar betreffen, die auftaucht, sobald ein Chat durchsucht wird. 🚨 Achtung: Falls du dem ```conversationStyle``` eine ```buildCustomConversationAppBar```-Methode übergeben hast, die nicht-null ist, so wird dieses Flag ignoriert.
- ```bottomBarStyle```: Datenstruktur, die verschiedene Farben, TextStyes etc. enthält, die das Styling der BottomBar in einer Konversation betreffen. 🚨 Achtung: Falls du in der ```BottomBarStyle``` - Instanz das Feld ```customBottomBar``` übergibst (sprich: deine eigene Implementierung der Bottom Bar, die ihr Styling *selbst*! managed), werden alle anderen Felder ignoriert!
- ```pushNotificationToastStyle```: Datenstruktur, die das Aussehen der Toasts bestimmt, die auftauchen, sobald eine Push Notification empfangen wird.


# 🪵 Changelog

## [0.1.0] - BREAKING -  22.07.2022

### Added
- Neue Datenstrukturen zum Initialisieren des Chats.
- Zusätzliche Methode ```uploadGroupConversationThumbnail``` in der ```NeonChatRemoteDataSource```, um das Thumbnail von neu erstellten Gruppenchats hochzuladen.
### Changed
- ```initNEONChat``` nimmt neue Datenstrukturen als Argumente. Gesamte Initialiserung des Chats findet jetzt hier statt.
- ```NeonChat``` (Widget) hat nur noch ein Argument.
### Fixed
- GetIt Bug, falls eine Conversation geöffnet werden sollte, bevor in dem App Lifecycle die ChatPage geöffnet worden ist. 
## [0.0.1]
Erste Version des NEON-Chats, frei nach Papeo geklaut. Intensives Testen und Erstintegration in ein Projekt nötig.

# 👷🏻‍♂️ Development TODOs
- [ ] Push Notification Service raus aus dem Chat Package. Push Notifications sollten von App zu App jeweils Top-Level gehandled werden, das hat bei [OAmN][oamn_project] große Probleme gemacht, dass es im Chat-Package drinnen ist. Eine Idee wäre es, eine vorgeschriebene Datei hier zu hinterlegen (z.B. als mason Brick 😉), die die Pushes für den Chat schon korrekt konfiguriert hat und die nur noch in den App Top-Level Push Notfication Service eingefügt werden muss.
- [ ] Die ```NeonChatRemoteDataSource``` sollte unbedingt überarbeitet werden, sie ist im Moment viel zu unübersichtlich. Ein Beispiel einer funktionierenden ```NeonChatRemoteDataSource``` findest du [hier][oamn_chat_datasource]. Unbedingt so gut es geht unnötige Methoden entfernen, bzw. zu einfachen Gettern resetten.
- [X] Die zweistufige Initialisierung mit den Methoden ```initNEONChat``` und dem Übergeben der Parameter an das ```NeonChat```-Widget macht nur Probleme. So sind bspw. ```FunctionInitData``` noch nicht initialisiert, wenn man in einen Bereich der App navigiert, der auf den NEON-Chat zugreift, man davor aber noch nicht die Route zu der ChatPage getriggert hat (damit auch alle Funktionen, die dem ```NeonChat``` Widget übergeben werden initialisiert werden). Lieber alles in der ```initNeonChat```-Methode machen. Wird halt dann etwas dicker, aber so what.
- [X] Routing im Chat-Package an unsere Best Practices anpassen. Sollten wir dabei bleiben, in jeder App [AutoRoute][auto_route_package] zu nutzen, dann sollten wir das auch in das Chat-Package einbauen, damit keine Probleme mehr wegen der gleichzeitigen Verwendung von ```Navigator.of(context)``` und ```context.router``` entstehen.

[flutterfire_cli_link]: https://firebase.flutter.dev/docs/overview/
[get_it_link]: https://pub.dev/packages/get_it
[mason_link]: https://pub.dev/packages/mason_cli
[template_project_link]: https://github.com/julien-neon/NEON_template_project
[neon_bricks_link]: https://github.com/julien-neon/NEON_bricks
[mason_tutorial_link]: https://www.youtube.com/watch?v=G4PTjA6tpTU
[neon_cli_link]: https://github.com/julien-neon/NEON_cli
[auto_route_package]: https://pub.dev/packages/auto_route
[oamn_project]: https://github.com/NEON-Software-Solutions/2203_oamn_app/tree/production
[oamn_chat_datasource]: https://github.com/NEON-Software-Solutions/2203_oamn_app/tree/production/lib/features/chat/data/data_sources