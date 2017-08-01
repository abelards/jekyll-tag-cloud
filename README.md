# jekyll-tag-cloud
Displaying a Jekyll tag cloud with a Liquid Tag

## Caution
This is an experiment. I'm probably doing things wrong. 
This is also a Work In Progress. The goal is to have a self-filtering list.

## How to use
0. Use Jekyll
1. Add the `topics_tags.rb` file in your `_plugins` directory.
2. Have some data you want to tag:
  2a. say you have a file in `_data/books.csv`, with tags listed in a `topics` column (comma-separated)
  2b. you just want a tag cloud for your blog posts, and they all have a `category` field in the FrontMatter
3. In your view (post or layout), use `{% tag_toggler books topics %}` or `{% tag_toggler posts category %}`
4. You might want to use the JS file included to make these tags clickable and the list filterable

## TODO
- I want to add options management, and possibly HTML options
- ability to sort by frequency OR alphabetical order
- counts, perhaps

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
