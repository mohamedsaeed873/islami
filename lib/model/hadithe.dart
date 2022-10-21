class Hadith{
  String? key;
  String? nameHadith;
  String? textHadith;
  String? explanationHadith;
  String? translateNarrator;
  String? audioHadith;

  Hadith(
      {this.key,
      this.nameHadith,
      this.textHadith,
      this.explanationHadith,
      this.translateNarrator,
      this.audioHadith});

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      key: json["key"],
      nameHadith: json["nameHadith"],
      textHadith: json["textHadith"],
      explanationHadith: json["explanationHadith"],
      translateNarrator: json["translateNarrator"],
      audioHadith: json["audioHadith"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "key": this.key,
      "nameHadith": this.nameHadith,
      "textHadith": this.textHadith,
      "explanationHadith": this.explanationHadith,
      "translateNarrator": this.translateNarrator,
      "audioHadith": this.audioHadith,
    };
  }
}