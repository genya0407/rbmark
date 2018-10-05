## テスト

### コードを書く

*~~~ruby* と *~~~* でコードを囲むと、そのブロックが評価される。

~~~ruby
array = [1,2,3,4]
converted = array.map { |e| e * 100 }

converted # 最後の行が出力される
~~~

### ブロックは全部同じスコープ

先程定義した変数`converted`が以下でも使える。

~~~ruby
converted.map { |e| e / 100 }
~~~

### ライブラリを使う

もちろん外部のライブラリをロードすることもできる。

~~~ruby
require 'matrix'

Matrix.identity(10)
~~~

### to_htmlを実装する

`to_html` メソッドを実装すると、その結果が出力される。

`to_html` が存在しない場合、`to_s`と`inspect`を試す。

~~~ruby
class Matrix # オープンクラス
  def to_html
    rows = self.to_a.map do |row|
      elems = row.map do |elem|
        "<td>#{elem}</td>"
      end
      "<tr>#{elems}</tr>"
    end
    "<table>#{rows.join}</table>"
  end
end

Matrix.identity(10)
~~~
