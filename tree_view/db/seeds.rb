Apparel.create! :name => 'Prislusenstvo'
Apparel.create! :name => 'Rukavice'

a = Apparel.create! :name => 'Oblecenie'
a.children.create! :name => 'Nohavice'
t = a.children.create! :name => 'Tricka'
t.children.create! :name => 'Nike'
t.children.create! :name => 'Reebook'

a = Apparel.create! :name => 'Topanky'
t = a.children.create! :name => 'Tenisky'
t.children.create! :name => 'ten 1'
t.children.create! :name => 'ten 2'
a.children.create! :name => 'Papuce'