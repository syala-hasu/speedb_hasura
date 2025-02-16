alter table "public"."runs" drop constraint "runs_game_uid_fkey",
  add constraint "runs_game_uid_fkey"
  foreign key ("game_uid")
  references "public"."games"
  ("uid") on update restrict on delete restrict;
