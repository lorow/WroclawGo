class eventModel {
  int _id;

  set id(int value) {
    _id = value;
  }

  int get id  => _id;

  eventModel (int id){
    this._id = id;
  }
}