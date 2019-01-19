typedef void EventCallback(arg);

class EventBus {

  //私有构造函数
  EventBus._internal();

  //保存单例
  static EventBus _singleton = EventBus._internal();

  //工厂构造函数
  factory EventBus() => _singleton;

  //保存事件订阅者队列，key：事件名id，value：对应事件的订阅者队列
  var _emap = Map<Object, List<EventCallback>>();

  //添加订阅者
  void on(Object eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= List<EventCallback>();
    _emap[eventName].add(f);
  }

  //移除订阅者
  void off(Object eventName, [EventCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后所有订阅者都会被调用
  void emit(Object eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    for (var i = len;i > -1;--i) {
      list[i](arg);
    }
  }
}

var bus = EventBus();