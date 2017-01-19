#Simple RSS reader
####El Trece TV

This is a concept reader using a live RSS feed from the Argentine news conglomerate "Canal 13" ruled by "Grupo Clarin" it's parent company.

* Within the ARFeedManager.h there is a constant FEED_URL which mandates the source for the information, by just replacing this for a feed of your choice it should automatically display content from such feed.
* RSS parsing handled by external pod dependency, with support for (limited) xpath querying.
* Every record of the feed is shown horizontaly as if it belonged to a different news section. If the node category was provided by the feed we could enhance the transition effect by consuming that value.


===2017 Changes

* Support for AppTransportSecurity by using the https version of the feed.