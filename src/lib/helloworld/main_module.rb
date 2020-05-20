# frozen_string_literal: true

# License stuff
require 'yast'

Yast.import 'UI'
Yast.import 'Label'

# Simple Hello World! fully functioning example
# @note This module can be changed using the YaST development tool
#   "create-new-package"
module HelloWorld
  # Simple class for the MainDialog
  class MainDialog
    include Yast::UIShortcuts
    include Yast::I18n
    include Yast::Logger
    
    # Display the dialog
    def run
      textdomain 'hello_world'
      return unless create_dialog

      begin
        event_loop
      ensure
        Yast::UI.CloseDialog
      end
    end

    # Simple event loop
    def event_loop
      loop do
        input = Yast::UI.UserInput
        next unless input == :hello

        log.info "Received #{input}"
        # Break the loop
        break
      end
    end

    # Draws the dialog
    def create_dialog
      # Simple ycp-ui dialog box
      Yast::UI.OpenDialog(
        Opt(:decorated, :defaultsize),
        # ycp-ui VBox widget to hold more widgets
        VBox(
          # ycp-ui Heading widget
          Heading(_('New Module')),
          # ycp-ui Lable widget
          Label(_('Hello, World!')),
          # nested ycp-ui VBox widget
          VBox(
            # ycp-ui Frame widget just for example
            (Frame(_('Next steps'),
              # ycp-ui RichText widget
              RichText(
                "<p>1.  Look at the widget tree browser. <b>Ctrl-Shift-Alt-Y</b>
                </p>"+
                "<p>2.  On the command line run <b>rake -T</b></p>"+
                "<p>3.  On the command line run <b>rake check:doc</b>"+
                " Then look at the documents in the <i>doc/autodoc</i>"+
                " directory.</p><p>4. Change the <b>create_dialog</b>"+
                " definition in the <i>main_module.rb</i> file.</p>"+
                "See the examples on GitHub in the"+
                " <i>yast/yast-ycp-ui-bindings/examples</i> repository.</p>"+
                "<p>Look at the Readme.md in the <i>doc/</i> directory</p>"
              )
          ))),
          # finally the ycp-ui PushButton widget
          PushButton(Id(:hello), Yast::Label.QuitButton)
        )
      )
    end
  end
end
