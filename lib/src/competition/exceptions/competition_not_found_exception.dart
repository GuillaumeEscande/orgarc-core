class CompetitionNotFoundException implements Exception {
  final String _id;
  CompetitionNotFoundException(this._id);

  String errMsg() => 'Competition not found with id $_id';
}
