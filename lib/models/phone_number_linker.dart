import 'package:linkify/linkify.dart';

final _phoneRegex = RegExp(
  r'^(.*?)(((\+91|91|0)+(\-|\s)?)?[6-9]\d{9})',
);

class PhoneLinkifier extends Linkifier {
  const PhoneLinkifier();

  @override
  List<LinkifyElement> parse(elements, options) {
    final list = <LinkifyElement>[];

    for (LinkifyElement element in elements) {
      if (element is TextElement) {
        final match = _phoneRegex.firstMatch(element.text);
        print('match ${match?.end}');
        if (match == null) {
          list.add(element);
        } else {
          final text = element.text.replaceFirst(match.group(0)!, '');
          if (match.group(1)?.isNotEmpty == true) {
            list.add(TextElement(match.group(1)!));
          }

          if (match.group(2)?.isNotEmpty == true) {
            list.add(PhoneElement(
              match.group(2)!.replaceFirst(RegExp(r'tel:'), ''),
            ));
          }

          if (text.isNotEmpty) {
            list.addAll(parse([TextElement(text)], options));
          }
        }
      } else {
        list.add(element);
      }
    }

    return list;
  }
}

class PhoneElement extends LinkableElement {
  final String phoneNumber;

  PhoneElement(this.phoneNumber) : super(phoneNumber, 'tel:$phoneNumber');

  @override
  String toString() {
    return "PhoneElement: '$phoneNumber' ($text)";
  }

  @override
  bool equals(other) =>
      other is PhoneElement &&
      super.equals(other) &&
      other.phoneNumber == phoneNumber;
}
