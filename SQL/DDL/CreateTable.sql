CREATE TABLE book_db.publisher (
    id INT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE uk_publisher_name (name)
);

CREATE TABLE book_db.book_collection (
    id INT,
    name VARCHAR(100) NOT NULL,
    publisher_id INT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE uk_book_collection_name (name),
    FOREIGN KEY fk_book_collection_publisher_id (publisher_id)
        REFERENCES book_db.publisher (id)
);

CREATE TABLE book_db.price_unit (
    id INT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE uk_price_unit_name (name)
);

CREATE TABLE book_db.size_kind (
    id INT,
    name VARCHAR(100) NOT NULL,
    width INT NOT NULL,
    height INT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE uk_size_kind_name (name)
);

CREATE TABLE book_db.book_shelf (
    id INT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE uk_book_shelf_name (name)
);

CREATE TABLE book_db.book (
    id INT,
    name VARCHAR(200) NOT NULL,
    isbn VARCHAR(13) NOT NULL,
    price_wo_tax INT NOT NULL,
    price_w_tax INT NOT NULL,
    publisher_id INT NOT NULL,
    book_collection_id INT,
    price_unit_id INT NOT NULL,
    size_kind_id INT NOT NULL,
    book_shelf_id INT,
    PRIMARY KEY (id),
    UNIQUE uk_book_isbn (isbn),
    FOREIGN KEY fk_book_publisher_id (publisher_id)
        REFERENCES book_db.publisher (id),
    FOREIGN KEY fk_book_book_collection_id (book_collection_id)
        REFERENCES book_db.book_collection (id),
    FOREIGN KEY fk_book_price_unit_id (price_unit_id)
        REFERENCES book_db.price_unit (id),
    FOREIGN KEY fk_book_size_kind_id (size_kind_id)
        REFERENCES book_db.size_kind (id),
    FOREIGN KEY fk_book_book_shelf_id (book_shelf_id)
        REFERENCES book_db.book_shelf (id)
);

CREATE TABLE book_db.person_kind (
    id INT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE uk_person_kind_name (name)
);

CREATE TABLE book_db.person (
    id INT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE book_db.book_person (
    book_id INT NOT NULL,
    person_id INT NOT NULL,
    person_kind_id INT NOT NULL,
    PRIMARY KEY (book_id, person_id, person_kind_id),
    FOREIGN KEY fk_book_person_book_id (book_id)
        REFERENCES book_db.book (id),
    FOREIGN KEY fk_book_person_person_id (person_id)
        REFERENCES book_db.person (id),
    FOREIGN KEY fk_book_person_person_kind_id (person_kind_id)
        REFERENCES book_db.person_kind (id)
);

