# username/euler

MoonBit で Project Euler を解くための作業用モジュールです。

## 実行

各問題は `cmd/pXXXX` パッケージとして個別に実行できます。

```bash
moon run cmd/p0001
moon run cmd/p0002
```

`cmd/main` は既定で Problem 1 を実行します。

```bash
moon run cmd/main
```

## 構成

- `euler.mbt`: 共通ヘルパーと問題ごとの関数
- `cmd/pXXXX`: 問題ごとの実行エントリ
- `scripts/new_problem.sh`: 新しい問題のひな形を追加する補助スクリプト

## 新しい問題の追加

```bash
./scripts/new_problem.sh 3
```

これで次の 2 つが生成されます。

- `cmd/p0003/main.mbt`
- `cmd/p0003/moon.pkg`

その後、`euler.mbt` に `pub fn problem_0003()` を追加してください。
`render_answer` は `String` を受け取るので、`Int` や `Int64` の場合は `.to_string()` して渡します。

## チェック

```bash
moon test
moon info
moon fmt
```
