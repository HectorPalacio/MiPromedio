class MateriaModel {
  int idMateria;
  String nombreMateria;
  int idActividad;
  double primerCorte;
  double segundoCorte;
  double tecerCorte;
  double definitiva;

  MateriaModel({
    this.idMateria,
    this.nombreMateria,
    this.primerCorte,
    this.segundoCorte,
    this.tecerCorte,
    this.idActividad,
    this.definitiva,
  });

  factory MateriaModel.fromJson(Map<String, dynamic> json) => new MateriaModel(
        idMateria: json["idMateria"],
        nombreMateria: json["nombreMateria"],
        primerCorte: json["primerCorte"],
        segundoCorte: json["segundoCorte"],
        tecerCorte: json["tecerCorte"],
        idActividad: json["idActividad"],
        definitiva: json["definitiva"],
      );

  Map<String, dynamic> toJson() => {
        "idMateria": idMateria,
        "nombreMateria": nombreMateria,
        "primerCorte": primerCorte,
        "segundoCorte": segundoCorte,
        "tecerCorte": tecerCorte,
        "idActividad": idActividad,
        "definitiva": definitiva,
      };
}
