> # Hi, Welcome to Mitul's Experimental Website!!!

```Markdown
```

```Markdown
# Great! You found me on the Internet! 
```

```Markdown
Issue #1: To call a method of Parent class fom it's Child class (Ok you probably say, use callbacks, Right!).<br>
So, how to do this in reverce manner (i.e. from parent to child)?<br> 
Using parrern like callback, I don't want to instantiate child in parent.<br>
Because, child is not ready yet (: not constructed) - think in terms of laying out.<br>
See, below example:<br>
```
```Dart
// Parent
class Parent {
  const Parent({this.num});

  final int num;

  void display() {
    print('Number is: ${num}');
  }
  
  void toggle() {
    // here call toggle from child
    // Again, no instance
  }
}

// Child
class Child {
  const Child({this.flag});
  
  bool flag;
  
  void toggle() {
    flag = !flag;
  }
}
```
