Tables and Models of Protospace
====

Contents of tables such as what columns are included and data types to those. Also, the associations between the models are explained.


## Tables
### Users Table
The columns and data types are the following.

|  nickname  |   profile   |    image     |    work      |
|:-----------|------------:|:------------:|:------------:|
|   string   |     text    |     text     |     text     |


### Prototypes Table
The columns and data types are the following.
|     name   |   user_id   |  catchcopy   |    concept   |
|:-----------|------------:|:------------:|:------------:|
|   string   |   integer   |     text     |     text     |

### Comments Table
The columns and data types are the following.

|    text    |   user_id   |prototypes_id |
|:-----------|------------:|:------------:|
|   text     |   integer   |   integer    |


### Likes Table
The columns and data types are the following.

| like_count |   user_id   |prototypes_id |
|:-----------|------------:|:------------:|
|   integer  |   integer   |   integer    |

## Models
## Associations
User has many prototypes, comments, and likes.

Protoype belongs to user.
Prototype has many comments and likes.

Comment belongs to user and prototype.

Like belongs to user and prototype.