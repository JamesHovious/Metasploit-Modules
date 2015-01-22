#Metasploit
require 'msf/core'
class Metasploit3 < Msf::Auxiliary
  include Msf::Exploit::Remote::Tcp # Import TCP functionality from the framework
  include Msf::Auxiliary::Scanner # Required for all scanners
  def initialize
    super(
        'Name'        => 'Example TCP scan',
        'Version'     => '$Revision: 1 $',
        'Description' => 'Sample description',
        'Author'      => 'James Hovious',
        'License'     => MSF_LICENSE
    )
    register_options(
        [
            Opt::RPORT(123456) # Default port of 123456
        ], self.class
    )
  end

  def run_host(ip)
    connect()
    sock.puts('Hello Server') # Upon connecting send this message
    data = sock.recv(1024)
    print_status("Received: #{data} from #{ip}") # Receive reply and print to screen
    disconnect()
  end
end
