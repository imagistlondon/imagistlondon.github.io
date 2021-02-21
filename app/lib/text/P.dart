import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/URL.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

// <p>
class P extends StatelessWidget {
  const P(
      {Key key,
      this.text = 'Text',
      this.textAlign = TextAlign.left,
      this.style,
      this.selectable = false,
      this.markdown = false,
      this.opacity})
      : super(key: key);

  final String text;
  final TextAlign textAlign;
  final TextStyle style;
  final bool selectable;
  final bool markdown;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    final TextStyle _style = Break.decide(
        context, Design.X1_P, Design.X2_P, Design.X3_P, Design.X4_P);

    // merge
    TextStyle s = style != null ? _style.merge(style) : _style;

    // opacity
    if (opacity != null) s = s.copyWith(color: s.color.withOpacity(opacity));

    // return markdown
    //     ? MarkdownBody(
    //         styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
    //             .copyWith(
    //                 h1: Design.H1(context),
    //                 h2: Design.H2(context),
    //                 h3: Design.H2(context),
    //                 h4: Design.H2(context),
    //                 h5: Design.H2(context),
    //                 h6: Design.H2(context),
    //                 p: Design.P(context)),
    //         data: text,
    //         // how to open links
    //         onTapLink: (text, href, title) {
    //           URL.open(href);
    //         },
    //         // selectable text
    //         selectable: true)
    //     : selectable
    return selectable
        ? SelectableText(text, textAlign: textAlign, style: s)
        : Text(text, textAlign: textAlign, style: s);
  }
}
