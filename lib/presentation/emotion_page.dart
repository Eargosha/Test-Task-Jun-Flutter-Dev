/*
  EMOTION PAGE: отвеечает за предоставление cubit для view, что является отображением интерфейса

  Для этого используется BlocProvider
*/

import 'package:emotional_app/domain/repository/emotion_repo.dart';
import 'package:emotional_app/presentation/emotion_cubit.dart';
import 'package:emotional_app/presentation/emotion_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmotionPage extends StatelessWidget {
  final EmotionRepo emotionRepo;

  const EmotionPage({super.key, required this.emotionRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return EmotionCubit(emotionRepo);
      },
      child: EmotionView(),
    );
  }
}
