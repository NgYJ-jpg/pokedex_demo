class PokemonBasic {
  PokemonBasic({
    required this.id,
    required this.name,
    required this.url,
    this.imagePath = '',
  });

  final String name;
  final String imagePath;
  final int id;
  final String url;
}
