alter table "public"."segments" alter column "split_time" drop not null;
alter table "public"."segments" add column "split_time" interval;
