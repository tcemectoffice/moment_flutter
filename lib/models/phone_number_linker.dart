import 'package:linkify/linkify.dart';
import 'package:moment/models/constants.dart';

class PhoneLinkifier extends Linkifier {
  const PhoneLinkifier();

  @override
  List<LinkifyElement> parse(elements, options) {
    final list = <LinkifyElement>[];

    for (LinkifyElement element in elements) {
      if (element is TextElement) {
        final match = phoneRegex.firstMatch(element.text);
        if (match == null) {
          list.add(element);
        } else {
          list.add(PhoneElement(
            match.group(0)!.replaceFirst(RegExp(r'tel:'), ''),
          ));
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
