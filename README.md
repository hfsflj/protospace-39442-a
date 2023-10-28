DB
#users
 email (string,NOT NULL,unique: true)
 encrypted_password (string、NOT NULL)
 name (string,NOT NULL)
 profile (text,NOT NULL)
 occupation (text,NOT NULL)
 position (text,NOT NULL)

#comments
 content (text,NOT NULL)
 prototype (reference,NOT NULL,外部キー)
 user (references,NOT NULL,外部キー)