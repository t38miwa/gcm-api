# 概要
connect-rpcを利用し、api実装を行いました。

# /gen内の生成されたファイルの役割
## pb.go
リクエストやリスポンスの構造体を定義している。

## grpc.pb.go
rpcを使用した通信を担っている。サービスごとにインターフェースを定義し、RegisterMemoServiceServerでメモに関する処理をサーバーに登録している。
その後MemoService_ListMemos_Handlerのような関数でデシリアライゼーション（protocol bufferというPRCのバイナリをjson.Unmarshalのように変換すること）を行なってリクエストをgo構造体に変換、その後インターセプタの有無によって処理を分岐する。その後、ビジネスロジックの実行結果を返す。またここではルーティングも設定されている。