import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:neon_chat/neon_chat.dart';

class PushNotificationService {
  BuildContext? _cachedContext;
  String _openedConversationId = '';
  final bool Function() isAuthenticated;
  final String? remoteUploadsURL;
  final PushNotificationToastStyle toastStyle;

  PushNotificationService({
    required this.isAuthenticated,
    required this.remoteUploadsURL,
    required this.toastStyle,
  });

  void enableChatNotifications() {
    _openedConversationId = '';
  }

  void disableChatNotificationsForConversationId(String id) {
    _openedConversationId = id;
  }

  void configurePushNotifications(
    BuildContext context, {
    void Function(RemoteMessage)? onNewNotification,
  }) async {
    log('CONFIGURED PUSH NOTIFICATIONS', name: '$runtimeType');
    _cachedContext = context;

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    try {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        log('User granted permission', name: '$runtimeType');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        log('User granted provisional permission', name: '$runtimeType');
      } else {
        log('User declined or has not accepted permission',
            name: '$runtimeType');
      }
    } catch (err) {
      log('$err', name: '$runtimeType');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('received data message: ${message.data}', name: '$runtimeType');

      _showPushAlert(
        message: message,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('data message opened app: ${message.data}', name: '$runtimeType');
      _handleCommand(message);
      onNewNotification?.call(message);
    });
  }

  void checkInitialMessage() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (cachedContext != null && isAuthenticated()) {
      if (initialMessage != null) {
        _handleCommand(initialMessage);
      }
    }
  }

  Widget _getLeftChildForToast(RemoteMessage message) {
    if (message.data.containsKey('command') &&
        message.data['command'] == 'openChat') {
      if (message.data.containsKey('senderId')) {
        // final String userId = message.data['senderId'];
        final String? uploadId = message.data['senderProfilePicture'];

        return Container(
          margin: const EdgeInsets.only(right: 20),
          child: AvatarWidget(
            imgUrl: uploadId != null && remoteUploadsURL != null
                ? '$remoteUploadsURL/$uploadId?preferThumbnail=true'
                : null,
          ),
        );
      }
    }
    return Container();
  }

  void _handleCommand(RemoteMessage message) {
    try {
      final data = message.data;

      if (data.containsKey('command')) {
        final String command = data['command'];

        if (command == 'openConversation') {
          if (data.containsKey('contentId') && data.containsKey('senderId')) {
            final String conversationId = data['contentId'];
            if (_openedConversationId == conversationId) {
              return;
            } else {
              if (_cachedContext != null) {
                openConversationFromPushNotification(
                  _cachedContext!,
                  conversationId: conversationId,
                );
              }
            }
          }
        }
      }
      dismissAllToast(showAnim: true);
    } catch (e) {
      log('$e', name: '$runtimeType');
    }
  }

  void _showPushAlert({
    required RemoteMessage message,
  }) {
    if (message.data.containsKey('command') &&
        message.data.containsKey('contentId')) {
      if (message.data['command'] == 'openConversation' &&
          message.data['contentId'] == _openedConversationId) {
        //TODOPUSH: contentId abstract enough?

        return;
      }
    }

    Future.delayed(
      Duration.zero,
      () {
        showToastWidget(
          Padding(
            padding: toastStyle.padding,
            child: GestureDetector(
              onTap: () => _handleCommand(message),
              child: Container(
                width: double.infinity,
                height: toastStyle.toastHeight,
                padding: toastStyle.padding,
                decoration: toastStyle.decoration,
                child: Row(
                  children: [
                    _getLeftChildForToast(message),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.notification?.title ?? '',
                            style: toastStyle.notificationTitleStyle,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            message.notification?.body ?? '',
                            style: toastStyle.notificationBodyStyle,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: toastStyle.dismissIcon,
                      onPressed: () {
                        dismissAllToast(showAnim: true);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          context: _cachedContext,
          position: toastStyle.toastPosition,
          duration: toastStyle.toastVisibilityDuration,
          animDuration: toastStyle.toastDisappearAnimationDuration,
          isIgnoring: false,
          animationBuilder: (
            BuildContext context,
            AnimationController controller,
            Duration duration,
            Widget child,
          ) {
            return SlideTransition(
              position: getAnimation<Offset>(
                const Offset(0.0, -20.0),
                const Offset(0, 0),
                controller,
                curve: Curves.fastOutSlowIn,
              ),
              child: child,
            );
          },
          reverseAnimBuilder: (
            BuildContext context,
            AnimationController controller,
            Duration duration,
            Widget child,
          ) {
            return SlideTransition(
              position: getAnimation<Offset>(
                const Offset(0.0, 0.0),
                const Offset(-3.0, 0),
                controller,
                curve: Curves.fastOutSlowIn,
              ),
              child: child,
            );
          },
        );
      },
    );
  }

  BuildContext? get cachedContext {
    return _cachedContext;
  }
}
