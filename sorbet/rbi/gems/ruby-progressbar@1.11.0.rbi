# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `ruby-progressbar` gem.
# Please instead update this file by running `bin/tapioca gem ruby-progressbar`.

# source://ruby-progressbar//lib/ruby-progressbar/output.rb#1
class ProgressBar
  class << self
    # source://ruby-progressbar//lib/ruby-progressbar.rb#19
    def create(*args); end
  end
end

# source://ruby-progressbar//lib/ruby-progressbar/base.rb#4
class ProgressBar::Base
  extend ::Forwardable

  # @return [Base] a new instance of Base
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#16
  def initialize(options = T.unsafe(nil)); end

  def clear(*args, **_arg1, &block); end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#88
  def decrement; end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#44
  def finish; end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#80
  def finished?; end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#154
  def format(other); end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#154
  def format=(other); end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#92
  def increment; end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#150
  def inspect; end

  def log(*args, **_arg1, &block); end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#54
  def pause; end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#74
  def paused?; end

  def progress(*args, **_arg1, &block); end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#96
  def progress=(new_progress); end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#104
  def progress_mark=(mark); end

  def refresh(*args, **_arg1, &block); end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#108
  def remainder_mark=(mark); end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#66
  def reset; end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#62
  def resume; end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#39
  def start(options = T.unsafe(nil)); end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#84
  def started?; end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#58
  def stop; end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#74
  def stopped?; end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#112
  def title; end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#116
  def title=(title); end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#127
  def to_h; end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#120
  def to_s(new_format = T.unsafe(nil)); end

  def total(*args, **_arg1, &block); end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#100
  def total=(new_total); end

  protected

  # Returns the value of attribute autofinish.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def autofinish; end

  # Sets the attribute autofinish
  #
  # @param value the value to set the attribute autofinish to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def autofinish=(_arg0); end

  # Returns the value of attribute autostart.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def autostart; end

  # Sets the attribute autostart
  #
  # @param value the value to set the attribute autostart to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def autostart=(_arg0); end

  # Returns the value of attribute bar.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def bar; end

  # Sets the attribute bar
  #
  # @param value the value to set the attribute bar to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def bar=(_arg0); end

  # Returns the value of attribute finished.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def finished; end

  # Sets the attribute finished
  #
  # @param value the value to set the attribute finished to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def finished=(_arg0); end

  # Returns the value of attribute output.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def output; end

  # Sets the attribute output
  #
  # @param value the value to set the attribute output to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def output=(_arg0); end

  # Returns the value of attribute percentage.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def percentage; end

  # Sets the attribute percentage
  #
  # @param value the value to set the attribute percentage to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def percentage=(_arg0); end

  # Returns the value of attribute progressable.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def progressable; end

  # Sets the attribute progressable
  #
  # @param value the value to set the attribute progressable to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def progressable=(_arg0); end

  # Returns the value of attribute rate.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def rate; end

  # Sets the attribute rate
  #
  # @param value the value to set the attribute rate to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def rate=(_arg0); end

  # Returns the value of attribute time.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def time; end

  # Sets the attribute time
  #
  # @param value the value to set the attribute time to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def time=(_arg0); end

  # Returns the value of attribute timer.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def timer; end

  # Sets the attribute timer
  #
  # @param value the value to set the attribute timer to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def timer=(_arg0); end

  # Returns the value of attribute title_comp.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def title_comp; end

  # Sets the attribute title_comp
  #
  # @param value the value to set the attribute title_comp to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#164
  def title_comp=(_arg0); end

  # source://ruby-progressbar//lib/ruby-progressbar/base.rb#176
  def update_progress(*args); end
end

# source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#2
module ProgressBar::Calculators; end

# source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#3
class ProgressBar::Calculators::Length
  # @return [Length] a new instance of Length
  #
  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#8
  def initialize(options = T.unsafe(nil)); end

  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#25
  def calculate_length; end

  # Returns the value of attribute current_length.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#5
  def current_length; end

  # Sets the attribute current_length
  #
  # @param value the value to set the attribute current_length to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#5
  def current_length=(_arg0); end

  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#14
  def length; end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#18
  def length_changed?; end

  # Returns the value of attribute length_override.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#4
  def length_override; end

  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#33
  def length_override=(other); end

  # Returns the value of attribute output.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#5
  def output; end

  # Sets the attribute output
  #
  # @param value the value to set the attribute output to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#5
  def output=(_arg0); end

  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#29
  def reset_length; end

  private

  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#57
  def dynamic_width; end

  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#87
  def dynamic_width_stty; end

  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#91
  def dynamic_width_tput; end

  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#78
  def dynamic_width_via_io_object; end

  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#73
  def dynamic_width_via_output_stream_object; end

  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#83
  def dynamic_width_via_system_calls; end

  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#43
  def terminal_width; end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/calculators/length.rb#95
  def unix?; end
end

# source://ruby-progressbar//lib/ruby-progressbar/calculators/running_average.rb#3
class ProgressBar::Calculators::RunningAverage
  class << self
    # source://ruby-progressbar//lib/ruby-progressbar/calculators/running_average.rb#4
    def calculate(current_average, new_value_to_average, smoothing_factor); end
  end
end

# source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#5
module ProgressBar::Components; end

# source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#6
class ProgressBar::Components::Bar
  # @return [Bar] a new instance of Bar
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#17
  def initialize(options = T.unsafe(nil)); end

  # Returns the value of attribute length.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#11
  def length; end

  # Sets the attribute length
  #
  # @param value the value to set the attribute length to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#11
  def length=(_arg0); end

  # Returns the value of attribute progress.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#11
  def progress; end

  # Sets the attribute progress
  #
  # @param value the value to set the attribute progress to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#11
  def progress=(_arg0); end

  # Returns the value of attribute progress_mark.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#11
  def progress_mark; end

  # Sets the attribute progress_mark
  #
  # @param value the value to set the attribute progress_mark to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#11
  def progress_mark=(_arg0); end

  # Returns the value of attribute remainder_mark.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#11
  def remainder_mark; end

  # Sets the attribute remainder_mark
  #
  # @param value the value to set the attribute remainder_mark to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#11
  def remainder_mark=(_arg0); end

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#25
  def to_s(options = T.unsafe(nil)); end

  # Returns the value of attribute upa_steps.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#11
  def upa_steps; end

  # Sets the attribute upa_steps
  #
  # @param value the value to set the attribute upa_steps to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#11
  def upa_steps=(_arg0); end

  private

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#51
  def bar(length); end

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#85
  def bar_with_percentage(length); end

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#57
  def complete_bar(length); end

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#63
  def complete_bar_with_percentage(length); end

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#91
  def completed_length; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#75
  def incomplete_space(length); end

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#47
  def incomplete_string; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#37
  def integrated_percentage_complete_string; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#43
  def standard_complete_string; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#95
  def unknown_progress_frame; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#69
  def unknown_string; end
end

# source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#7
ProgressBar::Components::Bar::DEFAULT_PROGRESS_MARK = T.let(T.unsafe(nil), String)

# source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#8
ProgressBar::Components::Bar::DEFAULT_REMAINDER_MARK = T.let(T.unsafe(nil), String)

# source://ruby-progressbar//lib/ruby-progressbar/components/bar.rb#9
ProgressBar::Components::Bar::DEFAULT_UPA_STEPS = T.let(T.unsafe(nil), Array)

# source://ruby-progressbar//lib/ruby-progressbar/components/percentage.rb#3
class ProgressBar::Components::Percentage
  # @return [Percentage] a new instance of Percentage
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/percentage.rb#6
  def initialize(options = T.unsafe(nil)); end

  # Returns the value of attribute progress.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/percentage.rb#4
  def progress; end

  # Sets the attribute progress
  #
  # @param value the value to set the attribute progress to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/percentage.rb#4
  def progress=(_arg0); end

  private

  # source://ruby-progressbar//lib/ruby-progressbar/components/percentage.rb#16
  def justified_percentage; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/percentage.rb#24
  def justified_percentage_with_precision; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/percentage.rb#12
  def percentage; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/percentage.rb#20
  def percentage_with_precision; end
end

# source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#3
class ProgressBar::Components::Rate
  # @return [Rate] a new instance of Rate
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#10
  def initialize(options = T.unsafe(nil)); end

  # Returns the value of attribute progress.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#4
  def progress; end

  # Sets the attribute progress
  #
  # @param value the value to set the attribute progress to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#4
  def progress=(_arg0); end

  # Returns the value of attribute rate_scale.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#4
  def rate_scale; end

  # Sets the attribute rate_scale
  #
  # @param value the value to set the attribute rate_scale to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#4
  def rate_scale=(_arg0); end

  # Returns the value of attribute started_at.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#4
  def started_at; end

  # Sets the attribute started_at
  #
  # @param value the value to set the attribute started_at to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#4
  def started_at=(_arg0); end

  # Returns the value of attribute stopped_at.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#4
  def stopped_at; end

  # Sets the attribute stopped_at
  #
  # @param value the value to set the attribute stopped_at to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#4
  def stopped_at=(_arg0); end

  # Returns the value of attribute timer.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#4
  def timer; end

  # Sets the attribute timer
  #
  # @param value the value to set the attribute timer to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#4
  def timer=(_arg0); end

  private

  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#34
  def base_rate; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#38
  def elapsed_seconds; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#20
  def rate_of_change(format_string = T.unsafe(nil)); end

  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#26
  def rate_of_change_with_precision; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/rate.rb#30
  def scaled_rate; end
end

# source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#6
class ProgressBar::Components::Time
  # @return [Time] a new instance of Time
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#20
  def initialize(options = T.unsafe(nil)); end

  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#30
  def elapsed_with_label; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#26
  def estimated_with_label; end

  protected

  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#48
  def estimated_with_friendly_oob; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#36
  def estimated_with_no_oob; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#42
  def estimated_with_unknown_oob; end

  # Returns the value of attribute out_of_bounds_time_format.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#54
  def out_of_bounds_time_format; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#58
  def out_of_bounds_time_format=(format); end

  # Returns the value of attribute progress.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#55
  def progress; end

  # Sets the attribute progress
  #
  # @param value the value to set the attribute progress to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#55
  def progress=(_arg0); end

  # Returns the value of attribute timer.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#55
  def timer; end

  # Sets the attribute timer
  #
  # @param value the value to set the attribute timer to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#55
  def timer=(_arg0); end

  private

  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#82
  def elapsed; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#68
  def estimated; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#94
  def estimated_seconds_remaining; end

  # source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#90
  def estimated_with_elapsed_fallback; end
end

# source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#14
ProgressBar::Components::Time::ELAPSED_LABEL = T.let(T.unsafe(nil), String)

# source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#13
ProgressBar::Components::Time::ESTIMATED_LABEL = T.let(T.unsafe(nil), String)

# source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#12
ProgressBar::Components::Time::NO_TIME_ELAPSED_TEXT = T.let(T.unsafe(nil), String)

# source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#11
ProgressBar::Components::Time::OOB_FRIENDLY_TIME_TEXT = T.let(T.unsafe(nil), String)

# source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#9
ProgressBar::Components::Time::OOB_LIMIT_IN_HOURS = T.let(T.unsafe(nil), Integer)

# source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#15
ProgressBar::Components::Time::OOB_TEXT_TO_FORMAT = T.let(T.unsafe(nil), Hash)

# source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#8
ProgressBar::Components::Time::OOB_TIME_FORMATS = T.let(T.unsafe(nil), Array)

# source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#10
ProgressBar::Components::Time::OOB_UNKNOWN_TIME_TEXT = T.let(T.unsafe(nil), String)

# source://ruby-progressbar//lib/ruby-progressbar/components/time.rb#7
ProgressBar::Components::Time::TIME_FORMAT = T.let(T.unsafe(nil), String)

# source://ruby-progressbar//lib/ruby-progressbar/components/title.rb#3
class ProgressBar::Components::Title
  # @return [Title] a new instance of Title
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/title.rb#8
  def initialize(options = T.unsafe(nil)); end

  # Returns the value of attribute title.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/title.rb#6
  def title; end

  # Sets the attribute title
  #
  # @param value the value to set the attribute title to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/components/title.rb#6
  def title=(_arg0); end
end

# source://ruby-progressbar//lib/ruby-progressbar/components/title.rb#4
ProgressBar::Components::Title::DEFAULT_TITLE = T.let(T.unsafe(nil), String)

# source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#2
module ProgressBar::Format; end

# source://ruby-progressbar//lib/ruby-progressbar/format/formatter.rb#3
class ProgressBar::Format::Formatter
  class << self
    # source://ruby-progressbar//lib/ruby-progressbar/format/formatter.rb#4
    def process(format_string, max_length, bar); end
  end
end

# source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#3
class ProgressBar::Format::Molecule
  # @return [Molecule] a new instance of Molecule
  #
  # source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#32
  def initialize(letter); end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#37
  def bar_molecule?; end

  # source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#45
  def full_key; end

  # Returns the value of attribute key.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#29
  def key; end

  # Sets the attribute key
  #
  # @param value the value to set the attribute key to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#29
  def key=(_arg0); end

  # source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#49
  def lookup_value(environment, length = T.unsafe(nil)); end

  # Returns the value of attribute method_name.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#29
  def method_name; end

  # Sets the attribute method_name
  #
  # @param value the value to set the attribute method_name to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#29
  def method_name=(_arg0); end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#41
  def non_bar_molecule?; end
end

# source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#27
ProgressBar::Format::Molecule::BAR_MOLECULES = T.let(T.unsafe(nil), Array)

# source://ruby-progressbar//lib/ruby-progressbar/format/molecule.rb#4
ProgressBar::Format::Molecule::MOLECULES = T.let(T.unsafe(nil), Hash)

# source://ruby-progressbar//lib/ruby-progressbar/format/string.rb#3
class ProgressBar::Format::String < ::String
  # source://ruby-progressbar//lib/ruby-progressbar/format/string.rb#11
  def bar_molecule_placeholder_length; end

  # source://ruby-progressbar//lib/ruby-progressbar/format/string.rb#19
  def bar_molecules; end

  # source://ruby-progressbar//lib/ruby-progressbar/format/string.rb#7
  def displayable_length; end

  # source://ruby-progressbar//lib/ruby-progressbar/format/string.rb#23
  def molecules; end

  # source://ruby-progressbar//lib/ruby-progressbar/format/string.rb#15
  def non_bar_molecules; end
end

# source://ruby-progressbar//lib/ruby-progressbar/format/string.rb#5
ProgressBar::Format::String::ANSI_SGR_PATTERN = T.let(T.unsafe(nil), Regexp)

# source://ruby-progressbar//lib/ruby-progressbar/format/string.rb#4
ProgressBar::Format::String::MOLECULE_PATTERN = T.let(T.unsafe(nil), Regexp)

# source://ruby-progressbar//lib/ruby-progressbar/errors/invalid_progress_error.rb#2
class ProgressBar::InvalidProgressError < ::RuntimeError; end

# source://ruby-progressbar//lib/ruby-progressbar/output.rb#2
class ProgressBar::Output
  # @return [Output] a new instance of Output
  #
  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#7
  def initialize(options = T.unsafe(nil)); end

  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#34
  def clear_string; end

  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#38
  def length; end

  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#27
  def log(string); end

  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#47
  def refresh(options = T.unsafe(nil)); end

  # Returns the value of attribute stream.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#5
  def stream; end

  # Sets the attribute stream
  #
  # @param value the value to set the attribute stream to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#5
  def stream=(_arg0); end

  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#42
  def with_refresh; end

  protected

  # Returns the value of attribute bar.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#57
  def bar; end

  # Sets the attribute bar
  #
  # @param value the value to set the attribute bar to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#57
  def bar=(_arg0); end

  # Returns the value of attribute length_calculator.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#57
  def length_calculator; end

  # Sets the attribute length_calculator
  #
  # @param value the value to set the attribute length_calculator to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#57
  def length_calculator=(_arg0); end

  # Returns the value of attribute throttle.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#57
  def throttle; end

  # Sets the attribute throttle
  #
  # @param value the value to set the attribute throttle to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#57
  def throttle=(_arg0); end

  private

  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#63
  def print_and_flush; end

  class << self
    # source://ruby-progressbar//lib/ruby-progressbar/output.rb#17
    def detect(options = T.unsafe(nil)); end
  end
end

# source://ruby-progressbar//lib/ruby-progressbar/output.rb#3
ProgressBar::Output::DEFAULT_OUTPUT_STREAM = T.let(T.unsafe(nil), IO)

# source://ruby-progressbar//lib/ruby-progressbar/outputs/tty.rb#4
module ProgressBar::Outputs; end

# source://ruby-progressbar//lib/ruby-progressbar/outputs/non_tty.rb#5
class ProgressBar::Outputs::NonTty < ::ProgressBar::Output
  # source://ruby-progressbar//lib/ruby-progressbar/outputs/non_tty.rb#18
  def bar_update_string; end

  # source://ruby-progressbar//lib/ruby-progressbar/outputs/non_tty.rb#8
  def clear; end

  # source://ruby-progressbar//lib/ruby-progressbar/outputs/non_tty.rb#28
  def default_format; end

  # source://ruby-progressbar//lib/ruby-progressbar/outputs/non_tty.rb#38
  def eol; end

  # source://ruby-progressbar//lib/ruby-progressbar/outputs/non_tty.rb#14
  def last_update_length; end

  # source://ruby-progressbar//lib/ruby-progressbar/outputs/non_tty.rb#36
  def refresh_with_format_change(*_arg0); end

  # source://ruby-progressbar//lib/ruby-progressbar/outputs/non_tty.rb#32
  def resolve_format(*_arg0); end

  protected

  # Sets the attribute last_update_length
  #
  # @param value the value to set the attribute last_update_length to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/outputs/non_tty.rb#44
  def last_update_length=(_arg0); end
end

# source://ruby-progressbar//lib/ruby-progressbar/outputs/non_tty.rb#6
ProgressBar::Outputs::NonTty::DEFAULT_FORMAT_STRING = T.let(T.unsafe(nil), String)

# source://ruby-progressbar//lib/ruby-progressbar/outputs/tty.rb#5
class ProgressBar::Outputs::Tty < ::ProgressBar::Output
  # source://ruby-progressbar//lib/ruby-progressbar/outputs/tty.rb#15
  def bar_update_string; end

  # source://ruby-progressbar//lib/ruby-progressbar/outputs/tty.rb#10
  def clear; end

  # source://ruby-progressbar//lib/ruby-progressbar/outputs/tty.rb#19
  def default_format; end

  # source://ruby-progressbar//lib/ruby-progressbar/outputs/tty.rb#27
  def eol; end

  # source://ruby-progressbar//lib/ruby-progressbar/output.rb#42
  def refresh_with_format_change; end

  # source://ruby-progressbar//lib/ruby-progressbar/outputs/tty.rb#23
  def resolve_format(other_format); end
end

# source://ruby-progressbar//lib/ruby-progressbar/outputs/tty.rb#6
ProgressBar::Outputs::Tty::DEFAULT_FORMAT_STRING = T.let(T.unsafe(nil), String)

# source://ruby-progressbar//lib/ruby-progressbar/progress.rb#4
class ProgressBar::Progress
  # @return [Progress] a new instance of Progress
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#16
  def initialize(options = T.unsafe(nil)); end

  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#114
  def absolute; end

  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#47
  def decrement; end

  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#29
  def finish; end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#33
  def finished?; end

  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#37
  def increment; end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#95
  def none?; end

  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#83
  def percentage_completed; end

  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#107
  def percentage_completed_with_precision; end

  # Returns the value of attribute progress.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#9
  def progress; end

  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#61
  def progress=(new_progress); end

  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#57
  def reset; end

  # Returns the value of attribute running_average.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#12
  def running_average; end

  # Sets the attribute running_average
  #
  # @param value the value to set the attribute running_average to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#12
  def running_average=(_arg0); end

  # Returns the value of attribute smoothing.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#12
  def smoothing; end

  # Sets the attribute smoothing
  #
  # @param value the value to set the attribute smoothing to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#12
  def smoothing=(_arg0); end

  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#23
  def start(options = T.unsafe(nil)); end

  # Returns the value of attribute starting_position.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#12
  def starting_position; end

  # Sets the attribute starting_position
  #
  # @param value the value to set the attribute starting_position to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#12
  def starting_position=(_arg0); end

  # Returns the value of attribute total.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#9
  def total; end

  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#74
  def total=(new_total); end

  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#103
  def total_with_unknown_indicator; end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/progress.rb#99
  def unknown?; end
end

# source://ruby-progressbar//lib/ruby-progressbar/progress.rb#6
ProgressBar::Progress::DEFAULT_BEGINNING_POSITION = T.let(T.unsafe(nil), Integer)

# source://ruby-progressbar//lib/ruby-progressbar/progress.rb#7
ProgressBar::Progress::DEFAULT_SMOOTHING = T.let(T.unsafe(nil), Float)

# source://ruby-progressbar//lib/ruby-progressbar/progress.rb#5
ProgressBar::Progress::DEFAULT_TOTAL = T.let(T.unsafe(nil), Integer)

# source://ruby-progressbar//lib/ruby-progressbar/refinements/enumerator.rb#2
module ProgressBar::Refinements; end

# source://ruby-progressbar//lib/ruby-progressbar/refinements/enumerator.rb#3
module ProgressBar::Refinements::Enumerator; end

# source://ruby-progressbar//lib/ruby-progressbar/throttle.rb#2
class ProgressBar::Throttle
  # @return [Throttle] a new instance of Throttle
  #
  # source://ruby-progressbar//lib/ruby-progressbar/throttle.rb#8
  def initialize(options = T.unsafe(nil)); end

  # source://ruby-progressbar//lib/ruby-progressbar/throttle.rb#15
  def choke(options = T.unsafe(nil)); end

  # Returns the value of attribute rate.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/throttle.rb#3
  def rate; end

  # Sets the attribute rate
  #
  # @param value the value to set the attribute rate to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/throttle.rb#3
  def rate=(_arg0); end

  # Returns the value of attribute started_at.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/throttle.rb#3
  def started_at; end

  # Sets the attribute started_at
  #
  # @param value the value to set the attribute started_at to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/throttle.rb#3
  def started_at=(_arg0); end

  # Returns the value of attribute stopped_at.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/throttle.rb#3
  def stopped_at; end

  # Sets the attribute stopped_at
  #
  # @param value the value to set the attribute stopped_at to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/throttle.rb#3
  def stopped_at=(_arg0); end

  # Returns the value of attribute timer.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/throttle.rb#3
  def timer; end

  # Sets the attribute timer
  #
  # @param value the value to set the attribute timer to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/throttle.rb#3
  def timer=(_arg0); end
end

# source://ruby-progressbar//lib/ruby-progressbar/time.rb#3
class ProgressBar::Time
  # @return [Time] a new instance of Time
  #
  # source://ruby-progressbar//lib/ruby-progressbar/time.rb#11
  def initialize(time = T.unsafe(nil)); end

  # source://ruby-progressbar//lib/ruby-progressbar/time.rb#15
  def now; end

  # source://ruby-progressbar//lib/ruby-progressbar/time.rb#19
  def unmocked_time_method; end

  protected

  # Returns the value of attribute time.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/time.rb#29
  def time; end

  # Sets the attribute time
  #
  # @param value the value to set the attribute time to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/time.rb#29
  def time=(_arg0); end
end

# source://ruby-progressbar//lib/ruby-progressbar/time.rb#4
ProgressBar::Time::TIME_MOCKING_LIBRARY_METHODS = T.let(T.unsafe(nil), Array)

# source://ruby-progressbar//lib/ruby-progressbar/timer.rb#4
class ProgressBar::Timer
  # @return [Timer] a new instance of Timer
  #
  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#8
  def initialize(options = T.unsafe(nil)); end

  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#61
  def divide_seconds(seconds); end

  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#53
  def elapsed_seconds; end

  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#57
  def elapsed_whole_seconds; end

  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#23
  def pause; end

  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#39
  def reset; end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#44
  def reset?; end

  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#48
  def restart; end

  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#27
  def resume; end

  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#12
  def start; end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#31
  def started?; end

  # Returns the value of attribute started_at.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#5
  def started_at; end

  # Sets the attribute started_at
  #
  # @param value the value to set the attribute started_at to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#5
  def started_at=(_arg0); end

  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#17
  def stop; end

  # @return [Boolean]
  #
  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#35
  def stopped?; end

  # Returns the value of attribute stopped_at.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#5
  def stopped_at; end

  # Sets the attribute stopped_at
  #
  # @param value the value to set the attribute stopped_at to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#5
  def stopped_at=(_arg0); end

  protected

  # Returns the value of attribute time.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#70
  def time; end

  # Sets the attribute time
  #
  # @param value the value to set the attribute time to.
  #
  # source://ruby-progressbar//lib/ruby-progressbar/timer.rb#70
  def time=(_arg0); end
end
