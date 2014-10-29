require 'spec_helper'

describe SetCounters do
  before do
    @w1 = Widget.create!(x: 0, y: 0)
    @w2 = Widget.create!(x: 0, y: 0)
  end

  specify { expect(@w1.x).to eq 0 }
  specify { expect(@w1.y).to eq 0 }
  specify { expect(@w2.x).to eq 0 }
  specify { expect(@w2.y).to eq 0 }

  describe "after setting counters" do
    before do
      Widget.set_counters(@w2.id, x: 1, y: 2)
      @w2.reload
    end

    specify { expect(@w1.x).to eq 0 }
    specify { expect(@w1.y).to eq 0 }
    specify { expect(@w2.x).to eq 1 }
    specify { expect(@w2.y).to eq 2 }

  end

end
