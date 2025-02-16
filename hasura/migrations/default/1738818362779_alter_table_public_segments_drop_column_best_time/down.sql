alter table "public"."segments" alter column "best_time" drop not null;
alter table "public"."segments" add column "best_time" interval;
