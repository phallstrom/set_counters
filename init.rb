# Include hook code here
require 'set_counters'
ActiveRecord::Base.class_eval { include SetCounters }
