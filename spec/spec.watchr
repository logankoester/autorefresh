watch( 'lib/(.*)\.rb' )  {|md| system("bacon spec/autorefresh_spec.rb") }
watch( 'spec/(.*)\.rb' ) {|md| system("bacon spec/autorefresh_spec.rb") }
