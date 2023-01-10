import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from "typeorm";
import { Photo } from "./Photo";

@Entity()
export class Author {
  @PrimaryGeneratedColumn({
    type: "int",
  })
  id: number;

  @Column({
    type: "text",
  })
  name: string;

  @OneToMany(() => Photo, (photo) => photo.author) // note: we will create author property in the Photo class below
  photos: Photo[];
}
