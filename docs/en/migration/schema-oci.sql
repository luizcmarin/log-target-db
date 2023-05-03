/**
 * Database schema required by yiisoft/log-target-db for Oracle.
 */
CREATE TABLE "log"
(
    "id" NUMBER(20) NOT NULL PRIMARY KEY,
    "level" VARCHAR2(16),
    "category" VARCHAR2(255),
    "log_time" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "message" CLOB
);

CREATE SEQUENCE "log_SEQ" START WITH 1 INCREMENT BY 1;
CREATE INDEX "IDX_log-category" ON "log" ("category");
CREATE INDEX "IDX_log-level" ON "log" ("level");
CREATE INDEX "IDX_log-log-time" ON "log" ("log-time");

CREATE TRIGGER "log_TRG" BEFORE INSERT ON "log" FOR EACH ROW BEGIN <<COLUMN_SEQUENCES>> BEGIN
  IF INSERTING AND :NEW."id" IS NULL THEN SELECT "log_SEQ".NEXTVAL INTO :NEW."id" FROM SYS.DUAL; END IF;
END COLUMN_SEQUENCES;
END;
/