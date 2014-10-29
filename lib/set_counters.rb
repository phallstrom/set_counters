require 'active_record'
require 'set_counters/version'

module SetCounters
  module Extensions
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      # A generic "counter setter" implementation, based on update_counters.
      # It simply does a direct SQL update for the record with the given ID,
      # setting the given hash of counters to the amount given by the
      # corresponding value:
      #
      # ==== Parameters
      #
      # * +id+ - The id of the object you wish to update a counter on.
      # * +counters+ - An Array of Hashes containing the names of the fields
      #   to update as keys and the amount to set the field to as values.
      #   Values will be forced to an integer value.
      #
      # ==== Examples
      #
      #   # For the Post with id of 5, set the comment_count to 1, and
      #   # set the action_count to 2
      #   Post.set_counters 5, :comment_count => 1, :action_count => 2
      #   # Executes the following SQL:
      #   # UPDATE posts
      #   #    SET comment_count = 1,
      #   #        action_count = 2
      #   #  WHERE id = 5
      def set_counters(id, counters)
        updates = counters.inject([]) { |list, (counter_name, value)|
          list << "#{connection.quote_column_name(counter_name)} = #{value.to_i}"
        }.join(", ")
        where(id: id).update_all(updates)
      end
    end

  end
end

ActiveRecord::Base.send :include, SetCounters::Extensions
