alter table "public"."segments" add column "current_time" text
 not null default '00:00:00.000000';
