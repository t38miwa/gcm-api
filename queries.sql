-- name: CreateUser :exec
INSERT INTO users (id, username, password, created_at) VALUES ($1, $2, $3, $4);

-- name: GetUserByUsername :one
SELECT id, username, password, created_at FROM users WHERE username = $1;

-- name: ListMemos :many
SELECT id, user_id, content, created_at FROM memos WHERE user_id = $1;

-- name: GetMemo :one
SELECT id, user_id, content, created_at FROM memos WHERE user_id = $1 AND id = $2;

-- name: CreateMemo :exec
INSERT INTO memos (id, user_id, content, created_at) VALUES ($1, $2, $3, $4);

-- name: CreateAPILog :exec
INSERT INTO api_logs (endpoint, request_body, response_body, status_code) 
VALUES ($1, $2, $3, $4);