class LicenseeNotFoundException implements Exception {
  final String _searchCriteria;
  LicenseeNotFoundException(this._searchCriteria);

  String errMsg() => 'Licensee not found with criteria $_searchCriteria';
}
