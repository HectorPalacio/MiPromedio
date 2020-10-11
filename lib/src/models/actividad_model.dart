class ActividadModel {
  int idActividad;
  String nombreActividad;
  double notaActividad;
  int porcentaje;
  int numeroCorte;

  ActividadModel({
    this.idActividad,
    this.nombreActividad,
    this.notaActividad,
    this.porcentaje,
    this.numeroCorte,
  });

  factory ActividadModel.fromJson(Map<String, dynamic> json) =>
      new ActividadModel(
        idActividad: json["idActividad"],
        nombreActividad: json["nombreActividad"],
        notaActividad: json["notaActividad"],
        porcentaje: json["porcentaje"],
        numeroCorte: json["numeroCorte"],
      );

  Map<String, dynamic> toJson() => {
        "idActividad": idActividad,
        "nombreActividad": nombreActividad,
        "notaActividad": notaActividad,
        "porcentaje": porcentaje,
        "numeroCorte": numeroCorte,
      };
}
