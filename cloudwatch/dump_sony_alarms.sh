#!/bin/bash

aws cloudwatch describe-alarms --alarm-names "ESFlaggedSonyStatsRed" "ESFlaggedSonyStatsYellow" "ESFlaggedSonyStatsFreeStorageLow" \
 "ESFlaggedSonyStatsWritesBlocked" "ESFlaggedSonyStatsFailedNodes"  "ESFlaggedSonyStatsSnapshotFailure" \
 "ESFlaggedSonyStatsHighCPUUsage"   "ESFlaggedSonyStatsHighMemoryPressure"   "ESFlaggedSonyStatsHighMasterCPUUsage" \
 "ESFlaggedSonyStatsHighMasterMemoryPressure"   "FirehosePlaylistFlaggedSonyDeliveryToESFailure"  \
 "FirehosePlaylistFlaggedSonyDeliverytoESFreshness"   "FirehosePlaylistFlaggedSonyDeliveryToS3Bytes" \
 "FirehosePlaylistFlaggedSonyThrottledGetRecords"   "FirehosePlaylistFlaggedSonyKinesisMillisBehind" \
 "SonyPlaylistServerEventsGetRecordsIteratorAge" "SonyPlaylistServerEventsGetRecordsLatency" "SonyPlaylistServerEventsGetRecordsSuccess" \
 "SonyPlaylistServerEventsPutRecordsAverageLatency" "SonyPlaylistServerEventsPutRecordsSuccess" "SonyPlaylistServerEventsReadThroughputExceeded" \
 "SonyPlaylistServerEventsWriteThroughputExceeded" "SonyFlaggedRecordsInputRecordsSum" "SonyFlaggedRecordsOutputRecordsSum" 

