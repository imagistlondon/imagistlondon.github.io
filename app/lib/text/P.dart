import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/URL.dart';
import 'package:flutter/gestures.dart';
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

  static final String nbsp = String.fromCharCode(0x00A0);

  @override
  Widget build(BuildContext context) {
    final TextStyle _style = Break.decide(
        context, Design.X1_P, Design.X2_P, Design.X3_P, Design.X4_P);

    // merge
    TextStyle s = style != null ? _style.merge(style) : _style;

    // opacity
    if (opacity != null) s = s.copyWith(color: s.color.withOpacity(opacity));

    // replace &nbsp; as no-breaking space
    String t = text
        .replaceAll('&nbsp;', nbsp)
        .replaceAll('&NonBreakingSpace;', nbsp)
        .replaceAll('U+00A0', nbsp)
        .replaceAll('&#160;', nbsp);

    // init text spans
    final List<TextSpan> textSpans = [];

    // build spans with links
    String currentText = '';
    bool inGif = false;
    bool inLink = false;
    bool inSrc = false;
    String currentSrc = '';
    for (final String c in text.characters) {
      // link start
      if (c == '{') {
        // end previous span
        textSpans.add(TextSpan(text: currentText));
        currentText = '';
        inGif = true;
      }

      // link end
      else if (c == '}') {
      }

      // link start
      else if (c == '[') {
        // end previous span
        textSpans.add(TextSpan(text: currentText));
        currentText = '';
        inLink = true;
      }

      // link end
      else if (c == ']') {
      }

      // src start
      else if ((inGif || inLink) && c == '(') {
        inSrc = true;
      }

      // gif src end
      else if (inGif && c == ')') {
        final String cs = currentSrc;
        // add the giff
        textSpans.add(TextSpan(
          text: currentText,
          style: Design.A(context),
          recognizer: new TapGestureRecognizer()..onTap = () => URL.open(cs),
        ));
        currentText = '';
        currentSrc = '';
        inGif = false;
        inSrc = false;
      }

      // link src end
      else if (inLink && c == ')') {
        final String cs = currentSrc;
        // add the link
        textSpans.add(TextSpan(
          text: currentText,
          style: Design.A(context),
          recognizer: new TapGestureRecognizer()..onTap = () => URL.open(cs),
        ));
        currentText = '';
        currentSrc = '';
        inLink = false;
        inSrc = false;
      }

      // src character
      else if (inSrc) {
        currentSrc += c;
      }

      // text character
      else {
        currentText += c;
      }
    }

    // add final text
    if (currentText.isNotEmpty) {
      textSpans.add(TextSpan(text: currentText));
    }

    // build text span
    final TextSpan textSpan = TextSpan(children: textSpans);

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
        ? SelectableText.rich(textSpan,
            textAlign: textAlign,
            style: s) //SelectableText(text, textAlign: textAlign, style: s)
        : Text(text, textAlign: textAlign, style: s);
  }
}
