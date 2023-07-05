import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tex/flutter_tex.dart';

import '../common/style/content-document-style.dart';
import '../common/tex-view/content-description-text.dart';

class MovimentoCircularVariadoContent extends StatelessWidget implements AbstractContent {
  @override
  Widget build(BuildContext context) => TeXView(
    style: DocumentStyle,
    child: TeXViewColumn(
    children: [
        descriptionText(
          "Os movimento variado possuem uma aceleração γ de módulo constate que altera o valor da"
          " velocidade angular. Esses movimentos podem ser acelerados, onde ocorre um aumento da"
          " velocidade angular ou retardado onde ocorre uma redução no valor da velocidade angular.", 16
        ),

        descriptionText("A aceleração angular é definida por:", null),
        const TeXViewDocument(r""" <p>$$γ = { Δω \over Δt }$$</p> """),

        descriptionText(
          "A aceleração angular constante faz com que a velocidade angular varia com o tempo segundo uma"
          " função do primeiro grau, dada por :",
          null
        ),
        const TeXViewDocument(r""" <p>$$ω = { ω_0 + γ * t }$$</p> """),

        descriptionText("A fase, ou ângulo é dado por uma função do segundo grau dependente do tempo,", null),
        const TeXViewDocument(r""" <p>$$θ = { θ_0 + ω * t + { 1 \over 2 } * γ * t^2 }$$</p> """),

        descriptionText("Nos movimentos acelerados a velocidade angular e a aceleração angular estão no mesmo sentido.", 16),
        descriptionText("Nos movimentos retardados a velocidade angular e a aceleração angular estão em sentidos opostos.", 16),
      ]
    )
  );
}