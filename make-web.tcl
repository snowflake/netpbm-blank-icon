# Generate a web page to show all the icons.


package require xmlgen
::xmlgen::declaretag html
::xmlgen::declaretag head
::xmlgen::declaretag link
::xmlgen::declaretag title
::xmlgen::declaretag body
::xmlgen::declaretag table
::xmlgen::declaretag tr
::xmlgen::declaretag th
::xmlgen::declaretag td
::xmlgen::declaretag img

# lookup the short name
set group [dict create heart-face hf smile sm square sq star st v-sign vs ]
	   
# lookup the short extension
set exts [dict create ico i png p]

# Get the list of files
set list [lsort [glob */*.ico]]

# puts $list


html xmlns=http://www.w3.org/1999/xhtml  xml:lang=en ! {
    head ! {
	link href=style1.css rel=stylesheet - 
	title - "List of icons"
    }
    body ! {
	table ! {
	    foreach element $list {
		# puts $element
		set res [ regexp {([a-z-]*)/tmp([0-9]*).([a-z]*)} \
			      $element all name id ext]
		#    puts "result $res"
		if $res {
		    set shortname [ dict get $group $name ]
		    set shortext  [ dict get $exts  $ext ]
		    #	puts "result $res $name $shortname $shortext $id $ext"
		    tr ! {
			td - $shortname-$id-$shortext
			td ! {
			    img src=$element -
			}
		    }
		}
	    }
	}
    }
}
