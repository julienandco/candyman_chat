import 'package:neon_chat/src/conversation/conversation.dart';

class GetUploadUrlUC {
  final FileUploadRepository fileUploadRepository;

  const GetUploadUrlUC(this.fileUploadRepository);

  Future<String?> call({
    required String id,
  }) {
    return fileUploadRepository.getUploadUrl(id);
  }
}
