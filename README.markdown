BASE DATA
-----------------------------------
A simple Rails web app that eases the access to Google Base Data API as well as allows saving data.
This application can be used to collect and store information about products, jobs, houses, etc. 


Data Feeds
==========
- Snippets Feed: The snippets feed is available to anyone without a need for authentication. The snippets feed provides access to all content in Google Base, but may return items with a shortened description. Snippets feed entries do not include private attributes.
- Items Feed (next in line): The items feed contains a customer-specific subset of Google Base data. The items feed requires authentication.
- Media Feed (for the future): The media feeds differ from the other Google Base feeds in that there is one media feed defined per Google Base item (rather than one global feed, as with the other feeds.)  Each item's media feed manages binary attachments for that item.

Metadata Feeds
==============
- Itemtypes Feed: The itemtypes feed contains a complete description of Google Base structures and allows you to query for different types of metadata. It provides a list of attributes associated with each of the Google Base item types.
- Attributes Feed: The attibutes feed provides statistics about how an item type has been used and lists what values have been used frequently for its attributes. This feed can also show you how others have defined the item in existing entries. This information can be very helpful as you define new items to upload.
- Locales Feed: The locales feed defines the permitted locales for Google Base. The locale value identifies the language, currency, and date formats used in a feed.

Notes
=====
- Built for Ruby 1.8.7 and Rails 2.3.5
- Requires simple-rss