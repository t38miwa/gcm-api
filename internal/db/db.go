// db.go
// このファイルは、データベース接続を初期化するための関数を提供します。

package db

import (
	"github.com/gocraft/dbr/v2" // dbrライブラリをインポート
	_ "github.com/lib/pq"       // PostgreSQLドライバをインポート（実際には使用しないが、dbrが内部で使用するため必要）
)

// NewDB はデータベース接続を初期化します。
// dataSourceName はデータベース接続文字列です。
// 戻り値は、dbr.Connection 型のデータベース接続と、エラーが発生した場合のエラーです。
func NewDB(dataSourceName string) (*dbr.Connection, error) {
	// データベース接続を開く
	conn, err := dbr.Open("postgres", dataSourceName, nil)
	if (err != nil) {
		return nil, err // エラーが発生した場合、nilとエラーを返す
	}
	// 接続が成功した場合、接続を返す
	return conn, nil
}