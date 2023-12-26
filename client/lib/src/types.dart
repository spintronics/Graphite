typedef ID = String;

class Paging {
  final int page;
  final int pageSize;

  const Paging({
    this.page = 1,
    this.pageSize = 10,
  });
}
