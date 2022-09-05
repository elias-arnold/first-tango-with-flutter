import 'dart:convert';

class HalRequest {
  Page? page;
  Map<String, HalLink>? links;

  HalRequest(Map<String, dynamic> json) {
    Map<String, dynamic> newLinks = json['_links'];
    Map<String, HalLink> mylinks = {};
    newLinks.entries.forEach((element) {
      mylinks.putIfAbsent(element.key, () => HalLink(element.value));
    });
    page = Page(json['page']);
    links = mylinks;
  }
}

class ClientHalRequest extends HalRequest {
  List<Client> elements = [];

  ClientHalRequest(json) : super(json) {
    elements = [];
    List<dynamic> myDynElements = (json['_embedded'] as Map<String, dynamic>)
        .entries
        .first
        .value as List<dynamic>;
    for (var element in myDynElements) {
      this.elements.add(Client(element));
    }
  }
}

class HalRequestObject {
  Map<String, HalLink> links = {};

  HalRequestObject(Map<String, dynamic> json) {
    Map<String, dynamic> newLinks = json['_links'];
    newLinks.entries.forEach((element) {
      links.putIfAbsent(element.key, () => HalLink(element.value));
    });
  }
}

class Client extends HalRequestObject {
  String? code;
  String? configFileName;
  String? configJson;
  String? country;
  String? name;

  Client(Map<String, dynamic> json) : super(json) {
    code = json['code'] as String;
    configFileName = json['configFileName'] as String;
    configJson = json['configJson'] as String;
    country = json['country'] as String;
    name = json['name'] as String;
  }
}

class HalLink {
  late final String href;
  HalLink(Map<String, dynamic> json) {
    href = json['href'] as String;
  }
}

class Page {
  int size;
  int? totalElements;
  int? totalPages;
  int? number;

  Page(Map<String, dynamic> json) {
    if (json['size'] == null){
      size = 0;
    } else {
      size = json['size'] as int;
    }
    totalElements = json['totalElements'] as int;
    totalPages = json['totalPages'] as int;
    number = json['number'] as int;
  }
}
