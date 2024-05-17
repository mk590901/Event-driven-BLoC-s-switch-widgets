import 'i_transition_method.dart';

class OnNothing implements ITransitionMethod {
  @override
  void execute([var hashMap]) {
    print("@OnNothing $hashMap");
  }
}

class OnTrue implements ITransitionMethod {
  @override
  void execute([var data]) {
    print("@OnTrue $data");
  }
}

class OnFalse implements ITransitionMethod {
  @override
  void execute([var data]) {
    print("@OnFalse $data");
  }
}

class OnDown implements ITransitionMethod {
  @override
  void execute([var data]) {
    print("@OnDown $data");
  }
}

class OnUp implements ITransitionMethod {
  @override
  void execute([var data]) {
    print("@OnUp $data");
  }
}

class OnDisableOff implements ITransitionMethod {
  @override
  void execute([var data]) {
    print("@OnDisableOff $data");
  }
}

class OnDisableOn implements ITransitionMethod {
  @override
  void execute([var data]) {
    print("@OnDisableOn $data");
  }
}

class OnEnableOff implements ITransitionMethod {
  @override
  void execute([var data]) {
    print("@OnEnableOff $data");
  }
}

class OnEnableOn implements ITransitionMethod {
  @override
  void execute([var data]) {
    print("@OnEnableOn $data");
  }
}

