// When we don't want to make direct object
// Contains a unimplemented(body-less) method

abstract class Human {
  void eating() {
    print('Eating');
  }

  void moving() {
    print('Moving');
  }

  void dressUp();
  
  void dummy() {
    print('implemented method');
  }
}

class Father extends Human {

  @override
  void dressUp() {
    print('Wearing shirt and pant');
  }
}

class Mother extends Human {
  @override
  void dressUp() {
    print('Wearing Saree');
  }
}

abstract class Son extends Human {

}

class ABC extends Son {
  @override
  void dressUp() {
    // TODO: implement dressUp
  }
}

class Unknown implements Human {
  @override
  void dressUp() {
    // TODO: implement dressUp
  }

  @override
  void eating() {
    // TODO: implement eating
  }

  @override
  void moving() {
    // TODO: implement moving
  }

  @override
  void dummy() {
    // TODO: implement dummy
  }
}