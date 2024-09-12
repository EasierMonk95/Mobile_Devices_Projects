class User{
  var _name;
  var _email;
  var _password;
  var _genre;
  var _isActionFavorite;
  var _isAdventureFavorite;
  var _isComedyFavorite;
  var _isHorrorFavorite;
  var _isRomanceFavorite;
  var _isFantasyFavorite;
  var _bornDate;

  get name => _name;

  set name(value) {
    _name = value;
  }

  get email => _email;

  get bornDate => _bornDate;

  set bornDate(value) {
    _bornDate = value;
  }

  get isFantasyFavorite => _isFantasyFavorite;

  set isFantasyFavorite(value) {
    _isFantasyFavorite = value;
  }

  get isRomanceFavorite => _isRomanceFavorite;

  set isRomanceFavorite(value) {
    _isRomanceFavorite = value;
  }

  get isHorrorFavorite => _isHorrorFavorite;

  set isHorrorFavorite(value) {
    _isHorrorFavorite = value;
  }

  get isComedyFavorite => _isComedyFavorite;

  set isComedyFavorite(value) {
    _isComedyFavorite = value;
  }

  get isAdventureFavorite => _isAdventureFavorite;

  set isAdventureFavorite(value) {
    _isAdventureFavorite = value;
  }

  get isActionFavorite => _isActionFavorite;

  set isActionFavorite(value) {
    _isActionFavorite = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  set email(value) {
    _email = value;
  }

  User(
      this._name,
      this._email,
      this._password,
      this._genre,
      this._isActionFavorite,
      this._isAdventureFavorite,
      this._isComedyFavorite,
      this._isHorrorFavorite,
      this._isRomanceFavorite,
      this._isFantasyFavorite,
      this._bornDate);
}