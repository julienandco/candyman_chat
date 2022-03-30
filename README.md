
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
6. Es macht mehr Fun, wenn schon Daten vorhanden sind, dafür die Authentication und den Firestore populaten (Coming soon: ein Mörderskript, das das automatisch macht)! Am einfachsten ist es, Nutzername/PW Anmeldung zu aktivieren und dich dann programmatisch wie in ```example/lib/main.dart``` einzuloggen, ohne jegliche UI (nur am Anfang natürlich!)
Falls die Daten im Firestore von Hand aufgesetzt werden sollten, bitte die Naming Conventions in ```lib/core/util/firebase_keys.dart``` beachten bzw. eigene etablieren und eine Instanz der ```FirebaseKeys``` Datenstruktur erstellen. Diese im ```getIt``` des Projekts registrieren, damit der Chat darauf zugreifen kann. Beim Benennen der FirebaseKeys die Staging/Production Logik beachten!!! (Staging Chats in z.B. ```staging-conversations``` speichern)

## Nutzung

Der Chat hat zwei Use-Cases: 

  1. Hirn auf Leerlauf, den Default NEON-Chat nutzen und nur Styling ändern.
  2. Irgendein Special Snowflake ❄ hat die Chat-Welt revolutioniert und das Default-Design reicht nicht aus. Also nur die Logik des NEON-Chats nutzen.

Unabhängig davon, welcher Fall auf dich zutrifft, musst du Stand jetzt (29.03.22) die folgenden Schritte bis zum STOP 🛑🙅🏻‍♀️🙅🏻‍♂️🛑 Signal durchführen, da der Chat im Moment vollständig auf eine Dependency Injection durch [Get_It][get_it_link] vertraut.

Also ab damit in die pubspec (```cloud_firestore``` jetzt auch, da das im Injection File verwendet wird).

ACHTUNG: Damit der nächste Absatz für dich funktioniert, muss deine App diese Abhängigkeiten in ihrer ```pubspec.yaml``` haben:

```yaml
dependencies:
  injectable: ^x.y.z
  get_it: ^a.b.c

dev_dependencies:
  injectable_generator: ^å.∫.ç
  build_runner: ^≈.¥.†
```

Erstelle jetzt mithilfe von [mason][mason_link] das ```NEON-Chat-Injection-Brick```. Was? Du weißt nicht, wie das geht?
Dann lies dir die Doku zu dem [Template Projekt][template_project_link] und den [NEON-Bricks][neon_bricks_link] durch. Die [Doku von Mason][mason_link] und [dieses Tutorial][mason_tutorial_link] sind auch sehr hilfreich.

TL;DR:
In das lib Verzeichnis wechseln und dann diesen Befehl ausführen:

```mason make neon_chat_injection```

Was? Dir steht das Brick nicht zur Verfügung, weil du diese App nicht mit der [NEON CLI][neon_cli_link] aufgesetzt hast? BigMac, bann den weg!

Wenn dir das mit den Bricks zu anstrengend ist (🤨) kannst du auch diese zwei Files im ```lib```-Ordner deines Projekts händisch (🤢) erstellen:

```neon_chat_injectable_module.dart```
```dart
//TODOINIT: adjust this import to find your project's injection file
import 'package:example/injection/injection.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:neon_chat/neon_chat.dart';

@module
abstract class NEONChatInjectableModule {
  //TODO: fill the firebase keys with custom ones if needed.
  //TODO: adjust firebaseKeys environment to the environment used by getIt
  @lazySingleton
  FirebaseKeys get firebaseKeys => const FirebaseKeys();

  @LazySingleton(as: ConversationRepository)
  ConversationRepositoryImpl get conversationRepository =>
      ConversationRepositoryImpl(
        firestore: getIt<FirebaseFirestore>(),
        firebaseAuth: getIt<FirebaseAuth>(),
        firebaseKeys: firebaseKeys,
      );

  @LazySingleton(as: ConversationsRepository)
  ConversationsRepositoryImpl get conversationsRepository =>
      ConversationsRepositoryImpl(
        firestore: getIt<FirebaseFirestore>(),
        firebaseAuth: getIt<FirebaseAuth>(),
        firebaseKeys: firebaseKeys,
      );

  @LazySingleton(as: FileUploadRepository)
  FileUploadRepositoryImpl get fileUploadRepository =>
      FileUploadRepositoryImpl(remoteDataSource: getIt<RemoteDataSource>());

  @LazySingleton(as: UploadManagerRepository)
  UploadManagerRepositoryImpl get uploadManagerRepository =>
      UploadManagerRepositoryImpl(fileUploadRepository: fileUploadRepository);

  @LazySingleton(as: FirebaseUserProfileRepository)
  FirebaseUserProfileRepositoryImpl get firebaseUserProfileRepository =>
      FirebaseUserProfileRepositoryImpl(
        firestore: getIt<FirebaseFirestore>(),
        firebaseKeys: firebaseKeys,
      );

  @lazySingleton
  HideMessageUC get hideMessageUC => HideMessageUC(conversationRepository);

  @lazySingleton
  DeleteMessageUC get deleteMessageUC =>
      DeleteMessageUC(conversationRepository);

  @lazySingleton
  MarkMessageAsSeenUC get markAsSeenUC =>
      MarkMessageAsSeenUC(conversationRepository);

  @lazySingleton
  MarkGroupMessageAsSeenUC get markGroupMessageAsSeenUC =>
      MarkGroupMessageAsSeenUC(conversationRepository);

  @lazySingleton
  SendPlatformFileMessageUC get sendPlatformFileMessageUC =>
      SendPlatformFileMessageUC(
          conversationRepository: conversationRepository,
          uploadManagerRepository: uploadManagerRepository);

  @lazySingleton
  SendFileMessageUC get sendFileMessageUC => SendFileMessageUC(
      conversationRepository: conversationRepository,
      uploadManagerRepository: uploadManagerRepository);

  @lazySingleton
  SendTextMessageUC get sendTextMessageUC =>
      SendTextMessageUC(conversationRepository);

  @lazySingleton
  InitializeConversationStreamUC get initializeConversationStreamUC =>
      InitializeConversationStreamUC(
        conversationRepository: conversationRepository,
      );

  @lazySingleton
  InitializeConversationItemStreamUC get initializeConversationItemStreamUC =>
      InitializeConversationItemStreamUC(
          conversationRepository: conversationRepository,
          conversationsRepository: conversationsRepository,
          userProfileRepository: firebaseUserProfileRepository);

  @lazySingleton
  InitializeConversationsStreamUC get initializeConversationsStreamUC =>
      InitializeConversationsStreamUC(conversationsRepository);

  @lazySingleton
  HideConversationUC get hideConversationUC =>
      HideConversationUC(conversationsRepository);

  @lazySingleton
  ChatSearchBloc get chatSearchBloc => ChatSearchBloc();

  @lazySingleton
  CurrentConversationCubit get currentConversationCubit =>
      CurrentConversationCubit();

  @lazySingleton
  ConversationsBloc get conversationsBloc => ConversationsBloc(
      initializeConversationsStreamUC: initializeConversationsStreamUC,
      initializeConversationItemStreamUC: initializeConversationItemStreamUC,
      hideConversationUC: hideConversationUC);

  @lazySingleton
  ConversationsSearchBloc get conversationsSearchBloc =>
      ConversationsSearchBloc();
}
```

```remote_data_source_injectable_module.dart```
```dart
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

import 'package:neon_chat/neon_chat.dart';

@module
abstract class RemoteDataBaseInjectableModule {
  @lazySingleton
  RemoteDataSource get remoteDataSource => _MyDataSource();
}

class _MyDataSource implements RemoteDataSource {
  @override
  Future<Either<Failure, String>> deleteEndpoint(String fileId) async {
    // TODO: implement deleteEndpoint

    return right('TODO');
  }

  @override
  Future<Either<Failure, String>> getEndpoint(String fileId) async {
    // TODO: implement getEndpoint
    return right('TODO');
  }

  @override
  Future<Either<Failure, String>> patchEndpoint(
      String fileId, Map<String, dynamic> body) async {
    // TODO: implement patchEndpoint
    return right('TODO');
  }

  @override
  Future<Either<Failure, String>> postEndpoint(
      String fileId, Map<String, dynamic> body) async {
    // TODO: implement postEndpoint
    return right('TODO');
  }

  @override
  Future<Either<Failure, Success>> uploadFileToPresignedURL(String url,
      {String? filePath,
      PlatformFile? platformFile,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    // TODO: implement uploadFileToPresignedURL
    return right(const Success());
  }
}
```

Sobald diese beiden Files in deinem ```lib```-Verzeichnis liegen, kannst (sollst, musst) du alle TODOs darin abarbeiten, sprich eventuell anstehende Key-Name-Änderungen in der FirebaseKeys Datenstruktur vermerken und die ```RemoteDataSource``` implementieren. Die ```RemoteDataSource``` ist der springende Punkt für jegliche Art von File-Uploads (Dateien, Fotos, Videos, Audionachrichten), da das alles nicht in Firebase, sondern in einem anderen, projektspezifischen Backend gespeichert wird.


ACHTUNG: Dir ist sicher aufgefallen, dass in ```neon_chat_injectable_module.dart``` sowohl ```FirebaseFirestore``` als auch ```FirebaseAuth``` über ```getIt``` instanziiert werden. Das passiert aber nicht in diesem File, sondern in ```firebase_injectable_module.dart```. Solltest du dieses File auch nocht nicht generiert haben: auch dafür gibt es ein Mason Brick 🎉 : 

```mason make firebase_injections```

Jetzt noch den build_runner laufen lassen und du bist good to go!

STOP 🛑🙅🏻‍♀️🙅🏻‍♂️🛑 STOP 🛑🙅🏻‍♀️🙅🏻‍♂️🛑 STOP 🛑🙅🏻‍♀️🙅🏻‍♂️🛑 STOP

Ab jetzt wird differenziert!

Ich kenne meine Pappenheimer, daher bewegen wir uns gerade wahrscheinlich im Fall 1.  

Du kannst jetzt den Neon-Chat völlig hirnbefreit als Widget in deine App einbinden. Du musst dabei eine ```GetIt```-Instanz und kannst zahlreiche Styles zum customisen übergeben! (Komplettes Beispiel siehe ```example/lib/main.dart```)

```dart
...
 @override
  Widget build(BuildContext context) {
    return NeonChat(getItInstance: getIt);
  }
```

Solltest du dich wider Erwarten in Fall 2 befinden, dann willst du höchstwahrscheinlich die gesamten UI-Komponenten neu bauen, oder die Chat-Logik sogar erweitern 😱 (falls du denkst, dass das auch für andere Projekte Sinn macht, dann hauen wir das mit ins Package)!

Dank der Dependency Injection steht dir die gesamte NEON-Chat-Logik zur Verfügung (gesamtes Beispiel siehe ```example/lib/my_custom_conversations_loader.dart```):
```dart
...
MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ConversationsSearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CurrentConversationCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ConversationsBloc>(),
        ),
      ],
      child: ...,
);
```

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