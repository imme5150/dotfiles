def c(string = IRB.CurrentContext.last_value)
  command = `echo $XDG_SESSION_TYPE` == "wayland\n" ? 'wl-copy' : 'xclip -sel clip'
  IO.popen(command, 'w') { |f| f << string.to_s }
  string
end

# Show big decimals as regular numbers in the console
require 'bigdecimal'
if defined?(BigDecimal)
  BigDecimal.class_eval do
    def inspect
      to_s
    end
  end
end
