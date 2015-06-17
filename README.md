# jekyll-tag-cloud
Displaying a Jekyll tag cloud with a Liquid Tag

## Caution
This is an experiment. I'm probably doing things wrong.
This is also a Work In Progress. The goal is to have a self-filtering list.

## How to use
0. Use Jekyll
1. Have some data you want to tag. Say, `books.csv` has a column `topics` with tags (comma-separated)
2. Add the `topics_tags.rb` file in your `_plugins` directory.
3. In your view (post or layout), use `{% tag_toggler books topics %}`

## TODO
- I will probably do a (vanilla) JS to toggle tags for a search
- I will then have to bundle example code for the list, the JS and the tag cloud
- ability to sort by frequency OR alphabetical order
- counts, perhaps
- I want to add options management, and possibly HTML options

## Lessons learned
### Getting args:
Either you're not getting any help OR I missed the standard way of doing this.
I've seen a few Liquid projects with helper code to extract the meaning of variables but... ?
Anyway my version is ugly.

### Getting data:
Same as above, PLUS I tried to transform variable name in data: not `evaluate`, not `find_variable`...
Perhaps `context.environments.first['a_tag_on_your_FrontMatter']` would help.
That would turn my tag generator into another thing.
Probably useless, but I thought that was worth a try when I was lost.
