# はじめに
未経験からエンジニアを目指しております。
「誰かのために」なるアプリケーションを開発できるために、個人アプリを制作し、学習しております。
お手数ですが、ご覧頂けますと幸いです。

# TasK i n g

### :memo: 概要
- タスクの管理アプリ
- 個人タスクの「見える化」
- チーム内でのタスクが「見える化」

### :memo: 本番環境
- デプロイ方法：AWS
- [ご覧頂けますと幸いです！](http://18.180.219.121/)
- かんたんログインボタン（後述の画像）から簡単にログインできます。

### :memo: 開発背景
- 前職のタスク管理方法に疑問があった。
  - 個人タスクの管理方法は自分次第。エクセルシートに書き出す人や紙に書き出す人がいた。私は後者。
  - チーム制の職場だが、情報共有は電話で直接会話もしくはエクセルシートに書き出し。
- 情報共有等の簡易化、どれだけ楽ができるのかを意識して開発致しました。

### :memo: 機能紹介
- ユーザー（個人）: ユーザーの新規登録、編集、削除機能、かんたんログイン機能
- グループ : グループの新規作成、編集機能
- タスク   : 個人、グループでのタスクの新規作成、編集、削除機能、MarkDown記法可能
- コメント : 投稿、編集、削除機能、Drag＆Drop機能、MarkDown記法可能

### :memo:工夫した所
- 2種類のタスク（user、group)を作成する必要があり、コントローラー内で条件分岐を行った。
- 3つの条件分岐
  - 1.group_idを含んだ場合とそうでない場合の条件分岐
  - 2.グループのタスク作成時group_idを含んだparamsを作成する条件分岐
  - 3.group_idを含んでいない場合（user_idのみ）のparamsを作成する条件分岐

### :memo: DEMO
##### ログイン画面
![login](https://user-images.githubusercontent.com/60562723/76696933-2a7a9d00-66d4-11ea-9694-882023401c75.jpg)

##### 新規登録画面
![new](https://user-images.githubusercontent.com/60562723/76697038-6a8e4f80-66d5-11ea-95b2-92fd8d7805af.jpg)

##### トップ画面
![top](https://user-images.githubusercontent.com/60562723/76697042-6f530380-66d5-11ea-941b-84fe5a929be8.jpg)

##### タスク作成画面
![newtask1](https://user-images.githubusercontent.com/60562723/76697280-a4ad2080-66d8-11ea-93fb-b748f7fe31fc.gif)
![newtask2](https://user-images.githubusercontent.com/60562723/76697314-3452cf00-66d9-11ea-8ff2-53a1fa4be725.gif)

##### グループ作成
![newgroup1](https://user-images.githubusercontent.com/60562723/76697401-18036200-66da-11ea-8158-cc38e89ee9fb.gif)
![newgroup2](https://user-images.githubusercontent.com/60562723/76697442-98c25e00-66da-11ea-93b0-192531442c2f.gif)

##### グループの共有タスク作成
![grouptask1](https://user-images.githubusercontent.com/60562723/76697475-0cfd0180-66db-11ea-9d42-a0af6927ee33.gif)
![grouptask2](https://user-images.githubusercontent.com/60562723/76697549-e9868680-66db-11ea-8048-b1c9748428e3.gif)

##### タスクへのコメント画面
![grouptaskcomment1](https://user-images.githubusercontent.com/60562723/76697612-aaa50080-66dc-11ea-85da-85b91cdc3a3d.gif)

##### タスク内コメントの移動
![grouptaskcomment2](https://user-images.githubusercontent.com/60562723/76697679-50f10600-66dd-11ea-8372-5535ff29855d.gif)


### :memo: 開発環境等
##### 開発環境
 - macOS Catalina バージョン10.15.3
 - Visual Studio Code バージョン1.42.1
##### 言語、フレームワーク 
 - ruby 2.6.3	
 - Rails 5.2.4.1	 
 - jQuery	
 - HTML
 - sass
 ##### Gem（抜粋）
 - devise	
 - bootstrap	
 - jquery-rails	
 - jquery-ui-rails	
 - pry-rails	
 - ranked-model	
 - redcarpet


### :memo: ER図（開発開始時作成）
<img width="846" alt="ERD2 final" src="https://user-images.githubusercontent.com/60562723/76698084-f6a67400-66e1-11ea-813f-a256157ada7a.png">

### :memo: 実装したい機能
- タスク間のコメント移動機能
- Ajaxで個人画面（トップ画面）からグループ画面への遷移を可能とする。
- グループ作成画面のメンバーをインクリメンタルサーチ機能を用いて出力する。

### さいごに
ご覧頂きありがとうございました。
もし宜しければ、Qiitaでアウトプット学習もしております。https://qiita.com/raigakun
ご助言等頂けますと幸いです。
