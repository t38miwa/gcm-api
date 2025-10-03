-- usersテーブルを作成します
-- schema.sql
-- このファイルは、データベースのスキーマを定義します。
-- ここでは、usersテーブル、memosテーブル、api_logsテーブルを作成します。

-- usersテーブルを作成します
CREATE TABLE users (
  id UUID PRIMARY KEY,                -- ユーザーID（UUID形式、主キー）
  username TEXT NOT NULL UNIQUE,      -- ユーザー名（テキスト形式、NULL不可、一意制約）
  password TEXT NOT NULL,             -- パスワード（テキスト形式、NULL不可）
  created_at TIMESTAMP NOT NULL       -- 作成日時（タイムスタンプ形式、NULL不可）
);

-- memosテーブルを作成します
CREATE TABLE memos (
  id UUID PRIMARY KEY,                -- メモID（UUID形式、主キー）
  user_id UUID NOT NULL REFERENCES users(id),  -- ユーザーID（UUID形式、NULL不可、usersテーブルのidを参照）
  content TEXT NOT NULL,              -- メモの内容（テキスト形式、NULL不可）
  created_at TIMESTAMP NOT NULL       -- 作成日時（タイムスタンプ形式、NULL不可）
);

-- api_logsテーブルを作成します
CREATE TABLE api_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(), -- ログID（UUID形式、主キー、デフォルトでランダムなUUIDを生成）
  endpoint TEXT NOT NULL,                        -- エンドポイント（テキスト形式、NULL不可）
  request_body TEXT NOT NULL,                    -- リクエストボディ（テキスト形式、NULL不可）
  response_body TEXT NOT NULL,                   -- レスポンスボディ（テキスト形式、NULL不可）
  status_code INTEGER NOT NULL,                  -- ステータスコード（整数形式、NULL不可）
  created_at TIMESTAMP NOT NULL DEFAULT NOW()    -- 作成日時（タイムスタンプ形式、NULL不可、デフォルトで現在の日時）
);