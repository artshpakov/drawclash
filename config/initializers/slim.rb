Slim::Engine.set_options format: :html
Slim::Engine.set_options attr_list_delims: { '[' => ']' }
Slim::Engine.set_options shortcut: {'.' => {:attr => 'class'}, '#' => {:attr => 'id'}, '@' => { attr: 'role' }}
