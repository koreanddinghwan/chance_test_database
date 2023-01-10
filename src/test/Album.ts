import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToMany,
  JoinTable,
} from "typeorm";
import { Photo } from "./Photo";

@Entity()
export class Album {
  @PrimaryGeneratedColumn({ type: "int" })
  id: number;

  @Column({
    type: "text",
  })
  name: string;

  @ManyToMany(() => Photo, (photo) => photo.albums)
  @JoinTable()
  photos: Photo[];
}
