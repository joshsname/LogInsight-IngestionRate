# LogInsight-IngestionRate

This script will grab the ingestion rate of a log insight instance via it's API for the last 5 minutes. It should be paired with a cronjob to run every 5 minutes from a remote server to log insight. The remote server should also be configured to log to vrli so that the information can be usable.

crontab example:
*/5 * * * * /home/josh/aggregateEvents.sh

You can read more here: https://joshs.place/my-solution-to-calculate-vrealize-log-insights-ingestion-rate/
