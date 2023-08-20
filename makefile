run_db:
	docker run --name my-postgres -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -e PGUSER=postgres -d postgres

connect_db:
	docker exec --user postgres -it my-postgres psql

exit_db:
	docker stop my-postgres
	docker rm my-postgres

migrate_up:
	migrate -path database/migration/ -database "postgresql://postgres:mysecretpassword@localhost:5432/busbooking?sslmode=disable" -verbose up


migrate_down:
	migrate -path database/migration/ -database "postgresql://postgres:mysecretpassword@localhost:5432/busbooking?sslmode=disable" -verbose down

migration_fix:
	migrate -path database/migration/ -database "postgresql://username:secretkey@localhost:5432/database_name?sslmode=disable" force VERSION


build:
	go build -ldflags "-s -w"  -o dist/server main.go && chmod +x dist/server