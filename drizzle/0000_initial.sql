CREATE TABLE `card` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`user_id` integer NOT NULL,
	`cardtype_id` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`cardtype_id`) REFERENCES `cardtype`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `cardrarity` (
	`id` integer PRIMARY KEY NOT NULL,
	`value` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `cardtype` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`set_id` integer NOT NULL,
	`name` text NOT NULL,
	`image_path` text NOT NULL,
	`rarity_id` integer NOT NULL,
	`illustrator` text NOT NULL,
	FOREIGN KEY (`set_id`) REFERENCES `set`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`rarity_id`) REFERENCES `cardrarity`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `pack` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`user_id` integer NOT NULL,
	`set_id` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`set_id`) REFERENCES `set`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `set` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text NOT NULL,
	`image_path` text NOT NULL,
	`packs_remaining` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `user` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text NOT NULL,
	`discordSnowflake` text NOT NULL,
	`packVouchers` integer NOT NULL,
	`lastFreeVoucher` integer NOT NULL,
	`lastFishin` integer NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `user_discordSnowflake_unique` ON `user` (`discordSnowflake`);