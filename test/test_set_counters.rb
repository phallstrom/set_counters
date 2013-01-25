require 'test/unit'
require 'rubygems'
require 'active_record'
require 'set_counters'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

def setup_db
  silence_stream(STDOUT) do
    ActiveRecord::Schema.define(:version => 1) do
      create_table :widgets do |t|
        t.column :x, :integer
        t.column :y, :integer
      end
    end
  end
end

def teardown_db
  silence_stream(STDOUT) do
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.drop_table(table)
    end
  end
end

class Widget < ActiveRecord::Base
  def self.table_name() "widgets" end
end

class SetCountersTest < Test::Unit::TestCase

  def setup
    setup_db
    @w1 = Widget.create!(:x => 0, :y => 0)
    @w2 = Widget.create!(:x => 0, :y => 0)
  end

  def teardown
    teardown_db
  end

  def test_set_counters
    assert_equal 0, @w1.x
    assert_equal 0, @w1.y
    assert_equal 0, @w2.x
    assert_equal 0, @w2.y
    Widget.set_counters(@w2.id, :x => 1, :y => 2)
    assert_equal 0, @w1.x
    assert_equal 0, @w1.y
    assert_equal 1, Widget.find(@w2.id).x
    assert_equal 2, Widget.find(@w2.id).y
  end

end
