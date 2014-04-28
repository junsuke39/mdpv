# 見出し

# h1
## h2
### h3
#### h4
##### h5
###### h6

# 強調

イタリック体は *こう* する。
イタリック体は _こう_ する。
太字は **こう** する。
太字は __こう__ する。

# 打ち消し線

打ち消し線は ~~こう~~ する。

# リスト

* りんご
* ゴリラ
* ラッパ

*の代わりに+ - も可。

1. いち
2. にっ
3. さーん

# 引用

> これは引用文です。
> 引用は良いですが剽窃はいけません。
> 気をつけましょう。

# 水平線

***
* * *
---
- - -

# リンク

[Yahoo](http://www.yahoo.co.jp/ "Yahoo")
[Yahoo](http://www.yahoo.co.jp/)

[Google]:http://www.google.co.jp/
[グーグル][Google]

# 画像

![Sample](http://mdpv.herokuapp.com.s3-website-ap-northeast-1.amazonaws.com/sample.jpg "Sample")

# テーブル

| Left align | Right align | Center align |
|:-----------|------------:|:------------:|
| This       |        This |     This     |
| column     |      column |    column    |
| will       |        will |     will     |
| be         |          be |      be      |
| left       |       right |    center    |
| aligned    |     aligned |   aligned    |

# コードブロック

文章の途中を``コード化``する。

```
ABC
```

```ruby
class Hoge < Hage
  def foo
    print "bar"
  end
end
```

```js:/foo/bar/hoge.js
$(function(){
  function foo(){
    alert('bar');
  }
});
```

```html:/foo/bar/hoge.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sample</title>
</head>
<body>
  <div>Hello</div>
</body>
</html>
```

```erb:/foo/bar/hoge.html.erb
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sample</title>
</head>
<body>
  <div><%= "Hello" %></div>
</body>
</html>
```

```css:/foo/bar/hoge.css
div.hoge {
  border: solid 1px #666;
}
```

```sql:/foo/bar/hoge.sql
SELECT *
FROM foo f
LEFT OUTER JOIN bar b ON b.foo_id = f.id
WHERE b.hoge = 'hage'
ORDER BY f.id
LIMIT 100 OFFSET 100
```

```java:/foo/bar/hoge.java
public class Hoge extends Hage<String, Integer> {
  private String foo;

  public Object getBar(String baz) {
    if(baz.equals("baz")) {
      return "yeah";
    }
    return null;
  }
}
```

