import { int, sqliteTable, text } from "drizzle-orm/sqlite-core";
import { relations } from "drizzle-orm";

export const userTable = sqliteTable("user", {
  id: int().primaryKey({ autoIncrement: true }),
  name: text().notNull(),
  discordSnowflake: text().notNull().unique(),
  packVouchers: int().notNull(),
  lastFreeVoucher: int().notNull(),
  lastFishin: int().notNull(),
});

export const setTable = sqliteTable("set", {
  id: int().primaryKey({ autoIncrement: true }),
  name: text().notNull(),
  image_path: text().notNull(),
  packs_remaining: int().notNull(),
});

export const cardrarityTable = sqliteTable("cardrarity", {
  id: int().primaryKey(),
  value: int().notNull(),
});

export const cardtypeTable = sqliteTable("cardtype", {
  id: int().primaryKey({ autoIncrement: true }),
  set_id: int()
    .notNull()
    .references(() => setTable.id),
  name: text().notNull(),
  image_path: text().notNull(),
  rarity_id: int()
    .notNull()
    .references(() => cardrarityTable.id),
  illustrator: text().notNull(),
});

export const packTable = sqliteTable("pack", {
  id: int().primaryKey({ autoIncrement: true }),
  user_id: int()
    .notNull()
    .references(() => userTable.id),
  set_id: int()
    .notNull()
    .references(() => setTable.id),
});

export const packRelations = relations(packTable, ({ one }) => ({
  user: one(userTable, {
    fields: [packTable.user_id],
    references: [userTable.id],
  }),
}));

export const cardTable = sqliteTable("card", {
  id: int().primaryKey({ autoIncrement: true }),
  user_id: int()
    .notNull()
    .references(() => userTable.id),
  cardtype_id: int()
    .notNull()
    .references(() => cardtypeTable.id),
});
