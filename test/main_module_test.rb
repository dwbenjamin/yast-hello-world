# frozen_string_literal: true.

# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

require_relative "spec_helper"
require "y2helloworld/main_module"

describe Y2HelloWorld::MainDialog do
  before(:all) do
    Yast.ui_component = "ncurses"
  end

  def mock_dialog(data)
    data[:input] ||= :hello
    ui = double("Yast::UI")
    stub_const("Yast::UI", ui)

    expect(ui).to receive(:OpenDialog).and_return(true)

    expect(ui).to receive(:CloseDialog).and_return(true)

    expect(ui).to receive(:UserInput).and_return(*data[:input])
  end

  it "return nil if user closes window" do
    mock_dialog input: :cancel
    expect(Y2HelloWorld::MainDialog.new.run).to eq nil
  end
end
