alter table "public"."runners" alter column "name" drop not null;
ALTER TABLE "public"."runners" ALTER COLUMN "name" drop default;
