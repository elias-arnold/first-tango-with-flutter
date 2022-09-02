class HalPagedModel<C extends HalElement> {
  Page page;
  Map<String, HalLink> _links;
  Map<String, List<C>> _embedded;

  HalPagedModel(this.page, this._links, this._embedded);

  Map<String, List<C>> get embedded => _embedded;

  set embedded(Map<String, List<C>> value) {
    _embedded = value;
  }

  Map<String, HalLink> get links => _links;

  set links(Map<String, HalLink> value) {
    _links = value;
  }
}

class HalLink {
  String href;

  HalLink(this.href);
}

class Page {
  int size;
  int totalElements;
  int totalPages;
  int number;

  Page(this.size, this.totalElements, this.totalPages, this.number);
}

abstract class HalElement {
  Map<String, HalLink> _links;

  Map<String, HalLink> get links => _links;

  set links(Map<String, HalLink> value) {
    _links = value;
  }

  HalElement(this._links);
}

class Client extends HalElement{
  String? configJson;
  String? configFileName;
  String? code;
  String? name;
  String? country;

  Client(
      this.configJson, this.configFileName, this.code, this.name, this.country) : super({});

}