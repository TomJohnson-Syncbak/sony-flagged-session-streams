-- noinspection SqlDialectInspectionForFile

-- noinspection SqlNoDataSourceInspectionForFile

CREATE OR REPLACE STREAM "DESTINATION_SQL_STREAM" ("sessionId" VARCHAR(64),
      "duration" BIGINT,
      "dma" INT,
      "siteId" INT,
      "mediaId" INT,
      "channelId" INT,
      "handlerName" VARCHAR(16),
      "handlerVersion" VARCHAR(8),
      "deviceType" INT,
      "deviceId" VARCHAR(64),
      "ips" VARCHAR (1024),
      "ipCount" INT,
      "rateLimited" BOOLEAN,
      "rateLimitEnforced" BOOLEAN,
      "sessionLogEventCount" INT,
      "flagReason" VARCHAR (32),
      "ts" BIGINT,
      "type" VARCHAR(16),
      "userId" VARCHAR(128),
      "count" INT,
      "averageDuration" INT,
      "flaggedCount" INT,
      "handler" VARCHAR(16));


CREATE OR REPLACE PUMP "STREAM_PUMP" AS
   INSERT INTO "DESTINATION_SQL_STREAM"
 SELECT "sessionId", "duration", "dma", "siteId" , "mediaId", "channelId", "handlerName", "handlerVersion", "deviceType", "deviceId",
      "ips" , "ipCount","rateLimited","rateLimitEnforced", "sessionLogEventCount", "flagReason", "ts", "type", "userId", "COL_count" AS "count", "averageDuration",
      "flaggedCount", "handler"
      FROM "SOURCE_SQL_STREAM_001";


      CREATE OR REPLACE STREAM "DESTINATION_SQL_STREAM_002" ("sessionId" VARCHAR(64),
      "duration" BIGINT,
      "dma" INT,
      "siteId" INT,
      "mediaId" INT,
      "channelId" INT,
      "handlerName" VARCHAR(16),
      "handlerVersion" VARCHAR(8),
      "deviceType" INT,
      "deviceId" VARCHAR(64),
      "ips" VARCHAR (1024),
      "ipCount" INT,
      "rateLimited" BOOLEAN,
      "rateLimitEnforced" BOOLEAN,
      "sessionLogEventCount" INT,
      "flagReason" VARCHAR (32),
      "ts" BIGINT,
      "type" VARCHAR(16),
      "userId" VARCHAR(128),
      "count" INT,
      "averageDuration" INT,
      "flaggedCount" INT,
      "handler" VARCHAR(16));


CREATE OR REPLACE PUMP "STREAM_PUMP2" AS
   INSERT INTO "DESTINATION_SQL_STREAM_002"
 SELECT "sessionId", "duration", "dma", "siteId" , "mediaId", "channelId", "handlerName", "handlerVersion", "deviceType", "deviceId",
      "ips" , "ipCount","rateLimited","rateLimitEnforced", "sessionLogEventCount", "flagReason", "ts", "type", "userId", "COL_count" AS "count", "averageDuration",
      "flaggedCount", "handler"
      FROM "SOURCE_SQL_STREAM_001";
