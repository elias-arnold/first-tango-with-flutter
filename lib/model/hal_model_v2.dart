abstract class FromJson {
  FromJson.fromJson();
}

class HalRequestResult implements FromJson {
  final List<dynamic> elements;
  final Page page;
  final Map<String, HalLink> links;

  const HalRequestResult(
      {required this.elements, required this.page, required this.links});

  factory HalRequestResult.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> newLinks = json['_links'];
    Map<String, HalLink> mylinks = {};
    newLinks.entries.forEach((element) {
      mylinks.putIfAbsent(element.key, () => HalLink.fromJson(element.value));
    });
    return HalRequestResult(
        elements:
            (json['_embedded'] as Map<String, dynamic>).entries.first.value as List<dynamic>,
        page: Page.fromJson(json['page']),
        links: mylinks);
  }
}

class HalLink implements FromJson {
  final String href;

  const HalLink({required this.href});

  factory HalLink.fromJson(Map<String, dynamic> json) {
    return HalLink(href: json['href'] as String);
  }
}

class Page implements FromJson {
  final int size;
  final int totalElements;
  final int totalPages;
  final int number;

  const Page(
      {required this.size,
      required this.totalElements,
      required this.totalPages,
      required this.number});

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
      number: json['number'] as int,
    );
  }
}
