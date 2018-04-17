PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- soil type
CREATE TABLE sel_soil_type (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- terrain type 
CREATE TABLE sel_terrain_type (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- terrain type 
CREATE TABLE sel_crop_establishment_method (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- variety infested 
CREATE TABLE sel_variety_infested (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- pesticide dose
CREATE TABLE sel_pesticide_dose (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- pesticide type
CREATE TABLE sel_pesticide_type (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- source type
CREATE TABLE sel_source_type (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- economic zone
CREATE TABLE sel_economic_zone (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- fertilizer type
CREATE TABLE sel_fertilizer_type (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- white flies
CREATE TABLE sel_white_flies (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- mites
CREATE TABLE sel_mites (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- mealy bugs
CREATE TABLE sel_mealy_bugs (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- witches broom symptoms
CREATE TABLE sel_witches_broom_symp (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- disease
CREATE TABLE sel_disease (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- degree infestation
CREATE TABLE sel_degree_infestation (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

-- harvesting method
CREATE TABLE sel_harvesting_method (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

COMMIT;