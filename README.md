# README

RailsジムのAPPです。


### Version
- Ruby 2.6.3
- Rails 6.0.3.2
- MySQL 5.7.22
- Nuxt.js 2.13.1
- Vuetify 1.11.2

### アプリ初期設定
```
$ make init
```

## 起動・終了

### 起動コマンド

以下のコマンドで起動します。

```
$ make up
```

### フロント側
http://localhost:3000/

### API側
http://localhost:8080/

### GraphQLの動作確認
http://localhost:8080/graphiql

## 開発用コマンド

Makefile に開発用のコマンドが並んでいます

利用例

`make lint-fix`
