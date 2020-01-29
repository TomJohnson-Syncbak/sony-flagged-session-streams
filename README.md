# Setup for data gathering for flagged Sony playlist sessions
This documents the infrastructure set up to gather information on playlist server sessions which are flagged for some reason, and which are restricted to Sony.

## Kinesis streams
* The Kinesis stream SonyPlaylistSessionEvents was created so that Sony could consume this event stream, consisting only of the data on flagged sessions
* The JSON configuration of this stream is stored in kinesis/SonyPlaylistSessionEvents.json

## Kinesis analytics applications
* The application PlaylistServerStatsFilterOnlyFlagged serves three purposes:
    * runs a Lambda to pass only flagged sessions with siteId == 124 (Sony)
    * sends output of the lambda to the Kinesis stream SonyPlaylistSessionEvents
    * sends output of the lambda to the Firehose stream PlaylistServerStats-FlaggedSony
* The SQL query (a passthrough, but is necessary) associated with this is stored in kinesis/PlaylistServerStatsFilterOnlyFlagged.SQL
* The Lambda function code associated with this is written in Python 2.7 and is store in kinesis/PreprocessForFlaggedSonySessions.py
* The JSON configuration of this application is stored in kinesis/PlaylistServerStatsFilterOnlyFlagged.json

## Firehose delivery streams
* The delivery stream PlaylistServerStats-FlaggedSony exists only to send data to Syncbak's Elasticsearch cluster playlist-flagged-sony-domain
* The JSON configuration of this stream is stored in firehose/PlaylistServerStats-FlaggedSony.json

## Elasticsearch clusters
* The cluster playlist-flagged-sony-domain was created so that Syncbak could observe the data that was being shipped to Sony
* The JSON configuration of this cluster is captured in elasticsearch/playlist-flagged-sony-domain.json

## Kibana saved objects
* All saved objects associated with the playlist-flagged-sony-domain cluster are stored in kibana/playlist-flagged-sony-domain-export.json