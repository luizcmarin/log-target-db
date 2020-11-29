/**
 * Database schema required by \Yiisoft\Log\Target\Db.
 *
 * The indexes declared are not required. They are mainly used to improve the performance
 * of some queries about message levels and categories. Depending on your actual needs, you may
 * want to create additional indexes (e.g. index on `log_time`).
 */

drop table if exists "log";

create table "log"
(
   "id"          bigserial NOT NULL PRIMARY KEY,
   "level"       integer,
   "category"    varchar(255),
   "log_time"    double precision,
   "message"     text
);

create index "idx_log_level" on "log" ("level");
create index "idx_log_category" on "log" ("category");