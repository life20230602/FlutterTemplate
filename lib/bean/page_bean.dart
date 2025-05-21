class Page {
  int total;
  int totalPage;
  int pageSize;
  int currentPage;

  Page({
    required this.total,
    required this.totalPage,
    required this.pageSize,
    required this.currentPage,
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        total: json["total"],
        totalPage: json["total_page"],
        pageSize: json["page_size"] ?? 0,
        currentPage: json["current_page"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "total_page": totalPage,
        "page_size": pageSize,
        "current_page": currentPage,
      };
}
