INSERT INTO book_db.publisher (id, name) VALUES (1, "岩波書店");
INSERT INTO book_db.publisher (id, name) VALUES (2, "筑摩書房");


INSERT INTO book_db.book_collection (id, name, publisher_id)
    VALUES (1, "岩波文庫", 1);
INSERT INTO book_db.book_collection (id, name, publisher_id)
    VALUES (2, "ちくま学芸文庫", 2);


INSERT INTO book_db.price_unit (id, name) VALUES (1, "円");
INSERT INTO book_db.price_unit (id, name) VALUES (2, "USドル");
INSERT INTO book_db.price_unit (id, name) VALUES (3, "リラ");


INSERT INTO book_db.size_kind (id, name, width, height)
    VALUES (1, "文庫", 105, 148);


INSERT INTO book_db.book_shelf (id, name)
    VALUES (1, "1-1");

INSERT INTO book_db.book (id, name, isbn, price_wo_tax, price_w_tax,
    pages, publisher_id, book_collection_id, price_unit_id,
    size_kind_id, book_shelf_id)
    VALUES (1, "アレクサンドロス大王東征記　付インド誌　(上)",
        "9784003348314", 900, 945, 473, 1, 1, 1, 1, 1
);

INSERT INTO book_db.book (id, name, isbn, price_wo_tax, price_w_tax,
    pages, publisher_id, book_collection_id, price_unit_id,
    size_kind_id, book_shelf_id)
    VALUES (2, "アレクサンドロス大王東征記　付インド誌　(下)",
        "9784003348321", 1120, 1210, 508, 1, 1, 1, 1, 1
);

INSERT INTO book_db.book (id, name, isbn, price_wo_tax, price_w_tax,
    pages, publisher_id, book_collection_id, price_unit_id,
    size_kind_id, book_shelf_id)
    VALUES (3, "変容の象徴　精神分裂病の前駆症状　(上)",
        "9784480080097", 1456, 1500, 532, 2, 2, 1, 1, 1
);

INSERT INTO book_db.book (id, name, isbn, price_wo_tax, price_w_tax,
    pages, publisher_id, book_collection_id, price_unit_id,
    size_kind_id, book_shelf_id)
    VALUES (4, "変容の象徴　精神分裂病の前駆症状　(下)",
        "9784480080103", 1359, 1400, 400, 2, 2, 1, 1, 1
);

INSERT INTO book_db.book (id, name, isbn, price_wo_tax, price_w_tax,
    pages, publisher_id, book_collection_id, price_unit_id,
    size_kind_id, book_shelf_id)
    VALUES (5, "万葉集　(一)",
        "9784003000519", 1080, 1134, 531, 1, 1, 1, 1, 1
);

INSERT INTO book_db.person_kind (id, name) VALUES (1, "著");
INSERT INTO book_db.person_kind (id, name) VALUES (2, "訳");
INSERT INTO book_db.person_kind (id, name) VALUES (3, "校注");

INSERT INTO book_db.person (id, name) VALUES (1, "アッリアノス");
INSERT INTO book_db.person (id, name) VALUES (2, "大牟田　章");
INSERT INTO book_db.person (id, name) VALUES (3, "C.G.ユング");
INSERT INTO book_db.person (id, name) VALUES (4, "野村　美紀子");
INSERT INTO book_db.person (id, name) VALUES (5, "佐竹　昭広");
INSERT INTO book_db.person (id, name) VALUES (6, "山田　英雄");
INSERT INTO book_db.person (id, name) VALUES (7, "工藤　力男");
INSERT INTO book_db.person (id, name) VALUES (8, "大谷　雅夫");
INSERT INTO book_db.person (id, name) VALUES (9, "山崎　福之");

INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (1, 1, 1);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (1, 2, 2);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (2, 1, 1);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (2, 2, 2);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (3, 3, 1);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (3, 4, 2);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (4, 3, 1);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (4, 4, 2);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (5, 5, 3);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (5, 6, 3);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (5, 7, 3);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (5, 8, 3);
INSERT INTO book_db.book_person (book_id, person_id, person_kind_id)
    VALUES (5, 9, 3);
