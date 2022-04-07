import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';

part 'upload_url_state.dart';
part 'upload_url_cubit.freezed.dart';

class UploadUrlCubit extends Cubit<UploadUrlState> {
  final GetUploadUrlUC uploadUrlUC;
  UploadUrlCubit(this.uploadUrlUC) : super(const UploadUrlState.initial());

  Future<String?> getUploadURL(String fileId) async {
    return await uploadUrlUC(id: fileId);
  }
}
