# Here is my attempt at a custom Liquid Tag
# It's supposed to be used like this {% tag_toggler datafile column %}
# Where you already have a Jekyll data available in `site.data.datafile`
# and a column named `column` in which you have a value or an array of comma-separated values

# lessons learned while getting args:
      # either you're not getting any help OR I missed the standard way of doing this.

# lessons learned while getting data:
      # transform variable name in data: not `evaluate`, not `find_variable`...
      # perhaps c.environments.first['a_tag_on_your_FrontMatter']

# TODO : add options, HTML options, and ability to sort by frequency OR alphabetical order

module Jekyll
  class RenderTagToggler < Liquid::Tag

    def initialize(tag_name, argstring, tokens)
      super

      # get args
      args = argstring.gsub(%Q['"], '').split(/[, ]/).map(&:strip)
      @data = args.first
      @method = args.last

      # options, if I get t ounderstand how I can do that later
      opts = {}
      @tag = opts[:tag] || 'a'
      @join = opts[:join] || ' '
      @class = opts[:class] || 'tag'
      @id = opts[:id] || 'tags'

      # now wait until it evaluates

    end

    def render(context)
      # get data from
      data =    context.environments.first['site']['data'][@data]
      raw = data.map{|d| d[@method] }

      # get the tags
      @tags = raw.map{|r| r.to_s.split(',') }.flatten.map(&:strip).uniq.reject{|x| x.size == 0}.sort

      # outputs HTML
      cloud = @tags.map{|t| %Q[<#{@tag} class="#{@class}">#{t}</#{@tag}>] }.join(@join)
      %Q[<div id="#{@id}">#{cloud}</div>]

    end
  end
end

Liquid::Template.register_tag('tag_toggler', Jekyll::RenderTagToggler)
