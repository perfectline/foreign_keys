Foreign Keys 
===================

Add foreign key functionality for Rails migrations and schema dumps.
MySQL and PostgreSQL adapters supported.

Installation
------------

As Rails gem (from GemCutter)

    sudo gem install foreign_keys

As Rails plugin

    script/plugin install git://github.com/perfectline/foreign_keys.git

Quickstart
-------------------

Just place the FK statements in your migrations.  The simplest example is:

    add_foreign_key :albums, :user_id

The referenced table and column are decidec by using rails conventions, i.e this
example would result in a foreign key from 'albums.user_id' to 'users.id' column.

You can additionally provide multiple options for cases where the association information cannot
be decided by conventions.

    add_foreign_key :albums, :author_id, :references => :users, :keys => :user_id, :name => "my_special_fk"

Removing foreign keys is just as easy.
You can remove them either by providing the constraint name or column(s).

    remove_foreign_key :albums, :user_id
    remove_foreign_key :albums, :name => "my_special_fk"

Note: MySQL creates an index on the FK column automatically. Removing a FK will remove that index also.

Options
-------------------

* **references**: name of the references table
* **keys**: column name(s) on the references table
* **on_delete**: on delete hook with a value of `:restrict`, `:set_null`, `:cascade`
* **on_update**: on update hook with a value of `:restrict`, `:set_null`, `:cascade`
* **name**: foreign key constraint name

Schema Dump
---------------

The usual rake targets for `db:schema:dump`, `db:schema:load`, and `db:reset`
should all work as desired.

Authors
---------------

**Tanel Suurhans** - tanel.suurhans_at_perfectline_d0t_ee
**Tarmo Lehtpuu** - tarmo.lehtpuu_at_perfectline_d0t_ee

License
--------------
Copyright 2009 by PerfectLine LLC (<http://www.perfectline.co.uk>) and is released under the MIT license.