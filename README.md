Tables and Models of Protospace
====

Contents of tables such as what columns are included and data types to those. Also, the associations between the models are explained.


## Tables
###### Users Table
The columns and data types are the following.

|  nickname  |   profile   |    image     |    work      |   group    |
|:----------:|:-----------:|:------------:|:------------:|:----------:|
|   string   |     string  |     string   |      string  |   string   |


###### Prototypes Table
The columns and data types are the following.

|     name   |   user_id   |  catchcopy   |    concept   | like_count | image |
|:----------:|:-----------:|:------------:|:------------:|:----------:|:------:|
|   string   |   integer   |     text     |     text     | integer    |  text  |

###### Comments Table
The columns and data types are the following.

|    text    |   user_id     | prototype_id|
|:-----------:|:------------:|:------------:|
|   string     |   integer   |   integer    |


###### Likes Table
The columns and data types are the following.

|   user_id   | prototype_id |
|:-----------:|:------------:|
|   integer  |   integer    |

####### Images Table
The columns and data types are the following.

|    Image   | prototype_id |  status     |
|:----------:|:------------:|:-----------:|
|   string   |     integer   |  integer   |


## Models
###### Associations
User has many prototypes, comments, and likes.

Protoype belongs to user.
Prototype has many comments, likes, and images.

Comment belongs to user and prototype.

Like belongs to user and prototype.

Image belongs to prototype.