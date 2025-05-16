///首页导航选中监听
mixin NavigationListener {
  void onSelected(NavigationController controller, int pre, int position) {}

  void onUnSelected() {}
}

//控制导航选中
mixin NavigationController {
  void toPrevious();
  void toNext();
  void changeIndex(int position);
}
