import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

import '../common/tex-view/content-description-text.dart';
import '../common/style/content-document-style.dart';
import 'constants.dart';

class PenduloContent extends StatelessWidget implements AbstractContent {
  final TeXViewRenderingEngine renderingEngine;

  const PenduloContent({
    super.key,
    this.renderingEngine = const TeXViewRenderingEngine.katex(),
  });

  @override
  Widget build(BuildContext context) => TeXView(
    renderingEngine: renderingEngine,
    style: DocumentStyle,
    child: TeXViewColumn(
      children: [
        descriptionText(PENDULO_DESCRIPTION, 16),

        descriptionText(PENDULO_DESCRIPTION_2, null),
        const TeXViewDocument(r""" <p>$$Fr = { -m * g * sin(θ) }$$</p> """),

        descriptionText(PENDULO_DESCRIPTION_3, null),
        const TeXViewDocument(r""" <p>$$a = { { d^2θ \over dt^2  } = -gθ }$$</p> """),

        descriptionText(PENDULO_DESCRIPTION_4, null),
        const TeXViewDocument(r""" <p>$$θ = { θ_0 * cos(ω t) }$$</p> """),

        descriptionText(PENDULO_DESCRIPTION_5, null),
        const TeXViewDocument(r""" <p>$$ω = { \sqrt { g \over l } }.$$</p> """),

        descriptionText(PENDULO_DESCRIPTION_6, null),
        const TeXViewDocument(r""" <p>$$T = { 2 * π \sqrt { l \over g } }.$$</p> """),

        descriptionText(PENDULO_DESCRIPTION_7, 16),
        descriptionText(PENDULO_DESCRIPTION_8, 16),
        descriptionText(PENDULO_DESCRIPTION_9, 16)
      ]
    )
  );
}
