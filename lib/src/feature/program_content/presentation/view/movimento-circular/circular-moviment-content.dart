import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-content.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/movimento-circular/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tex/flutter_tex.dart';

import '../common/style/content-document-style.dart';
import '../common/tex-view/content-description-text.dart';

class CircularMovimentContent extends AbstractContent {
  const CircularMovimentContent({super.key});

  @override
  Widget build(BuildContext context) => TeXView(
    style: DocumentStyle,
    child: TeXViewColumn(
      children: [
        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_1, 16),
        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_2, 16),

        const TeXViewDocument(r""" <p> $$T = { 1 \over f }$$</p> """),

        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_3, null),
        const TeXViewDocument(r""" <p> $$ΔS = { R*Δθ }$$</p> """),

        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_4, null),
        const TeXViewDocument(r""" <p style="align-self: start">$$ΔS = { 2 * π * R }.$$</p> """),

        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_5, null),
        const TeXViewDocument(r""" <p>$$T = { 2 * π \sqrt { l \over g } }.$$</p> """),

        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_6, 16),
        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_7, null),
        const TeXViewDocument(r""" <p>$$V = { {ΔS \over ΔT} = {2 * π * R \over T} = { 2 * π * R * f } }$$  </p> """),

        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_8, 16),
        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_9, null),
        const TeXViewDocument(r""" <p>$$ω = { {Δθ \over ΔT} = {2 * π \over T} = { 2 * π * f } }$$  </p> """),

        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_10, 16),
        const TeXViewDocument(r""" <p> $$V = { ω * R }$$</p> """),

        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_11, 16),
        descriptionText(CIRCULAR_MOVIMENT_DESCRIPTION_12, null),
        const TeXViewDocument(r""" <p> $$a_cp = { {v^2 \over R} = { ω^2 * R } }$$</p> """),
      ]
    )
  );
}