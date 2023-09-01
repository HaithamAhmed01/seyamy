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
    header: 'فضل صيام الأيام البيض في شوال',
    body: 'Content of section 1',
  ),
  ExpandableContent(
    header: 'فضل صيام العشر من  ذي الحجة',
    body: 'Content of section 2',
  ),
  ExpandableContent(
    header: 'فضل صيام الإثنين والخميس',
    body: 'Content of section 2',
  ),
  ExpandableContent(
    header: 'فضل صيام يوم عاشوراء',
    body: 'Content of section 2',
  ),
  ExpandableContent(
    header: 'فضل صيام يوم  عرفه',
    body: 'Content of section 2',
  ),
  ExpandableContent(
    header: 'مبطلات الصيام',
    body: 'Content of section 2',
  ),
];
