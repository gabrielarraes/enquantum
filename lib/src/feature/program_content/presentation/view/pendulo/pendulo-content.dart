import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

import 'constants.dart';

class PenduloContent extends AbstractContent {
  final TeXViewRenderingEngine renderingEngine;

  const PenduloContent({
    super.key,
    this.renderingEngine = const TeXViewRenderingEngine.katex(),
  });

  @override
  Widget build(BuildContext context) => TeXView(
    renderingEngine: renderingEngine,
    style: const TeXViewStyle(
      margin: TeXViewMargin.all(5),
      padding: TeXViewPadding.all(10),
      borderRadius: TeXViewBorderRadius.all(10),
      elevation: 3,
      contentColor: Color.fromRGBO(73, 4, 163, 1),

      border: TeXViewBorder.all(
        TeXViewBorderDecoration(
          borderColor: Colors.deepPurple,
          borderStyle: TeXViewBorderStyle.solid,
          borderWidth: 5),
      ),
      backgroundColor: Colors.white,
    ),
    child: TeXViewColumn(
      children: [
        TeXViewDocument(PENDULO_DESCRIPTION,
          style: TeXViewStyle(
            contentColor: Colors.black87,
            fontStyle: TeXViewFontStyle(fontWeight: TeXViewFontWeight.w500, fontFamily: 'Poppins')
          )
        ),

        TeXViewDocument(r""" A força resultante que passa a atuar sobre a massa m é dada por: """,
          style: TeXViewStyle(
            contentColor: Colors.black87,
            fontStyle: TeXViewFontStyle(fontWeight: TeXViewFontWeight.w500, fontFamily: 'Poppins')
          )
        ),
        const TeXViewDocument(r""" <p> $$Fr = { -m * g * sin(θ) }$$</p> """),

        TeXViewDocument(r""" Para ângulos pequenos podemos aproximar (sinθ ≡ θ) assim a aceleração do sistema será dada por: """,
          style: TeXViewStyle(
            contentColor: Colors.black87,
            fontStyle: TeXViewFontStyle(fontWeight: TeXViewFontWeight.w500, fontFamily: 'Poppins')
          )
        ),
        const TeXViewDocument(r""" <p> $$a = { -gθ }$$</p> """),

        TeXViewDocument(r""" O ângulo que o pêndulo faz com o plano vertical varia conforme a expressão: """,
          style: TeXViewStyle(
            contentColor: Colors.black87,
            fontStyle: TeXViewFontStyle(fontWeight: TeXViewFontWeight.w500, fontFamily: 'Poppins')
          )
        ),
        const TeXViewDocument(r""" <p> $$θ = { θ_0 * cos(ω t) }$$</p> """),

        TeXViewDocument(r""" onde: """,
          style: TeXViewStyle(
            contentColor: Colors.black87,
            fontStyle: TeXViewFontStyle(fontWeight: TeXViewFontWeight.w500, fontFamily: 'Poppins')
          )
        ),
        const TeXViewDocument(r""" <p style="align-self: start">$$ω = { \sqrt { g \over l } }.$$</p> """),

        TeXViewDocument(r""" O período de oscilação do pêndulo será dado por: """,
          style: TeXViewStyle(
            contentColor: Colors.black87,
            fontStyle: TeXViewFontStyle(fontWeight: TeXViewFontWeight.w500, fontFamily: 'Poppins')
          )
        ),
        const TeXViewDocument(r""" <p>$$T = { 2 * π \sqrt { l \over g } }.$$</p> """),

        TeXViewDocument(r""" 
            Utilizando o simulador e um cronômetro verifique se variando a fase inicial, utilizando o terceiro controle
            deslizante, do movimento o valor do período se altera. 
          """,
          style: TeXViewStyle(
            contentColor: Colors.black87,
            margin: const TeXViewMargin.only(bottom: 16),
            fontStyle: TeXViewFontStyle(fontWeight: TeXViewFontWeight.w500, fontFamily: 'Poppins')
          )
        ),

        TeXViewDocument(r""" Depois altera o valor da gravidade no primeiro controle deslizante e verifique se o período varia ou não. """,
          style: TeXViewStyle(
            contentColor: Colors.black87,
            margin: const TeXViewMargin.only(bottom: 16),
            fontStyle: TeXViewFontStyle(fontWeight: TeXViewFontWeight.w500, fontFamily: 'Poppins')
          )
        ),

        TeXViewDocument(r""" Por fim altera o comprimento do pêndulo e verifique se há ou não variação do período do movimento. """,
          style: TeXViewStyle(
            contentColor: Colors.black87,
            margin: const TeXViewMargin.only(bottom: 16),
            fontStyle: TeXViewFontStyle(fontWeight: TeXViewFontWeight.w500, fontFamily: 'Poppins')
          )
        ),
      ]
    )
  );
}