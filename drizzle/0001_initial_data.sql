INSERT INTO cardrarity (id, value) VALUES
    (0, 100),
    (1, 30),
    (2, 5);
--> statement-breakpoint
INSERT INTO "set" (name, image_path, packs_remaining) VALUES
    ('Aquatic Beginnings', 'images/guppy.png', 100),
    ('Rock Paper Scissors', 'images/rock.png', 100);
--> statement-breakpoint
INSERT INTO cardtype (
    set_id,
    name,
    image_path,
    rarity_id,
    illustrator
) VALUES
    (1, 'guppy', 'images/guppy.png', 0, 'Andrew L'),
    (1, 'jeff', 'images/jeff.png', 0, 'Andrew L'),
    (1, 'sammy', 'images/sammy.png', 0, 'Andrew L'),
    (1, 'equi', 'images/equi.png', 1, 'Andrew L'),
    (1, 'ort', 'images/ort.png', 1, 'Andrew L'),
    (1, 'annabelle', 'images/annabelle.png', 2, 'Andrew L'),
    (1, 'globby', 'images/globby.png', 2, 'Andrew L'),
    (2, 'rock', 'images/rock.png', 0, 'Andrew L'),
    (2, 'paper', 'images/paper.png', 1, 'Andrew L'),
    (2, 'scissors', 'images/scissors.png', 2, 'Andrew L');