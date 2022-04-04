//TODOGROUPSEEN: register it in getit
import 'package:neon_chat/neon_chat.dart';

class GetAllGroupTimestampsUC {
  final NeonChatCacheService cacheService;

  GetAllGroupTimestampsUC(this.cacheService);

  Future<TimestampMap> call() async {
    return await cacheService.groupchatsTimestampMap;
  }
}
