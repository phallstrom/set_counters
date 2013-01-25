# SetCounters

[![Gem Version](https://badge.fury.io/rb/set_counters.png)](http://badge.fury.io/rb/set_counters)

Similar to ARModel.update\_counters, ARModel.set\_counters simply sets multiple
fields to their integer values. No adding/substracting, just setting.
Yes, this could be done using update\_all, but this seems nicer to me.

## Installation

Add this line to your application's Gemfile:

    gem 'set_counters'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install set_counters

## Usage

    # For the Post with id of 5, set the comment_count to 1, and
    # set the action_count to 2

    Post.set_counters 5, :comment_count => 1, :action_count => 2

    # Executes the following SQL:
    # UPDATE posts
    #    SET comment_count = 1,
    #        action_count = 2
    #  WHERE id = 5

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
