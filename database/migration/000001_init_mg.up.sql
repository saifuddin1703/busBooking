CREATE TABLE "user" (
  "id" int PRIMARY KEY,
  "username" varchar,
  "phone_number" varchar
);

CREATE TABLE "location" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "lat" decimal,
  "lng" decimal
);

CREATE TABLE "bus" (
  "id" int PRIMARY KEY,
  "start_loc_id" int,
  "end_loc_id" int
);

CREATE TABLE "seat" (
  "id" int PRIMARY KEY,
  "number" int,
  "bus_id" int,
  "isbooked" boolean,
  "booked_by" int,
  "type" varchar
);

COMMENT ON COLUMN "seat"."type" IS 'upper/lower';

ALTER TABLE "bus" ADD FOREIGN KEY ("start_loc_id") REFERENCES "location" ("id");

ALTER TABLE "bus" ADD FOREIGN KEY ("end_loc_id") REFERENCES "location" ("id");

ALTER TABLE "seat" ADD FOREIGN KEY ("bus_id") REFERENCES "bus" ("id");

ALTER TABLE "seat" ADD FOREIGN KEY ("booked_by") REFERENCES "user" ("id");
