# Linked Lists implementation in Ruby - The Odin Project
---

### Project Tree:
```
├── lib
│   ├── linked-lists.rb
│   ├── node.rb
│   └── project-linked-lists.rb
└── README.md

1 directory, 4 files
```

### Output
```
#append('hello1')        => hello1
#append('hello2')        => hello2
#append('hello3')        => hello3
#append('hello4')        => hello4
#append('hello5')        => hello5
#to_s:
( hello1 ) -> ( hello2 ) -> ( hello3 ) -> ( hello4 ) -> ( hello5 )

#prepend('prepend1')     => prepend1
#prepend('prepend2')     => prepend2
#prepend('prepend3')     => prepend3
#to_s:
( prepend3 ) -> ( prepend2 ) -> ( prepend1 ) -> ( hello1 ) -> ( hello2 ) -> ( hello3 ) -> ( hello4 ) -> ( hello5 )

#tail                    => hello5
#head                    => prepend3
#size                    => 8
#at(4)                   => hello2
#contains?('hello5')     => true
#find('hello5')          => 7
#insert_at(7, 'test')    => test
#to_s:
( prepend3 ) -> ( prepend2 ) -> ( prepend1 ) -> ( hello1 ) -> ( hello2 ) -> ( hello3 ) -> ( hello4 ) -> ( test ) -> ( hello5 )

#remove_at(4)            => hello2
#to_s:
( prepend3 ) -> ( prepend2 ) -> ( prepend1 ) -> ( hello1 ) -> ( hello3 ) -> ( hello4 ) -> ( test ) -> ( hello5 )

#pop                     => hello5
#to_s:
( prepend3 ) -> ( prepend2 ) -> ( prepend1 ) -> ( hello1 ) -> ( hello3 ) -> ( hello4 ) -> ( test )

#size                    => 7
```
