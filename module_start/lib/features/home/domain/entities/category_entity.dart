class CategoryEntity {
  String icon;
  String label;

  CategoryEntity({
    required this.icon,
    required this.label
  });

  CategoryEntity.empty({
    this.icon = "",
    this.label = ""
  });
}
