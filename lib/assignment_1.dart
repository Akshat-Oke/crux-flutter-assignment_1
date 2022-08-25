abstract class StackInterface<T> {
  void push(T);
  T pop();
  T top();
  bool get isEmpty;
  int get length;
}

/// actually the PlatesHandler but renamed
class Stack<T> implements StackInterface<T> {
  /// You can only use this list for implementing the methods
  final _plates = <T>[];
  @override
  bool get isEmpty => _plates.isEmpty;

  @override
  int get length => _plates.length;

  @override
  T pop() {
    // TODO: implement pop
    if(length == 0){
      throw Exception("Stack empty");
    }
    return _plates.removeLast();
  }

  @override
  void push(T) {
    _plates.add(T);
    // TODO: implement push
  }

  @override
  T top() {
    // TODO: implement top
    if(length == 0){
      throw Exception("Stack empty");
    }
    return _plates[length - 1];
  }
}

class Pancake {
  final double weight;
  final bool hasTopping;
  final int serialNumber;
  Pancake(this.weight, this.hasTopping, this.serialNumber);
  @override
  bool operator ==(Object other) {
    return (other is Pancake) && other.serialNumber == serialNumber;
  }

  @override
  int get hashCode => serialNumber;
}

// TODO: implement PancakeHandler class which extends Stack
class PancakeHandler extends Stack<Pancake> {
  // TODO: Override `pop` method
  @override
  Pancake pop([int n = 1]) {
    for(int i = 0; i<(n < length? n-1 : length-1); i++){
      super.pop();
    } //pops max available pancakes if n is greater than length
    return super.pop();
  }

  Pancake remove(int from, int to) {
    if(_plates[from -1].hasTopping || _plates[to].hasTopping){
      throw Exception("Robot can't handle this task");
    }
    for(int i = to; i>from; i--){
      _plates.removeAt(i);
    }
    return _plates.removeAt(from);
  }
}

extension ChefsPancakeHandler on PancakeHandler {
  int inspect(bool Function(Pancake) predicate) {
    // TODO: implement inspect
    var count = 0;
    for(int i = length-1; i >= 0; i--){
      if(!predicate(_plates[i])){
        _plates.removeAt(i);
        count++;
      }
    }
    return count;
  }
}
