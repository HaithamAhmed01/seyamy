class ExpandableContent {
  ExpandableContent({
    required this.header,
    required this.body,
    this.isExpanded = false,
  });

  final String header;
  final String body;
  bool isExpanded;
}

List<ExpandableContent> dataExpandable = [
  ExpandableContent(
    header: "Fadl_header1",
    body: "Fadl_body1",
  ),
  ExpandableContent(
    header: "Fadl_header2",
    body: "Fadl_body2",
  ),
  ExpandableContent(
    header: "Fadl_header3",
    body: "Fadl_body3",
  ),
  ExpandableContent(
    header: "Fadl_header4",
    body: "Fadl_body4",
  ),
  ExpandableContent(
    header: "Fadl_header5",
    body: "Fadl_body5",
  ),
  ExpandableContent(
    header: "Fadl_header6",
    body: "Fadl_body6",
  ),
  ExpandableContent(
    header: "Fadl_header7",
    body: "Fadl_body7",
  ),
];
