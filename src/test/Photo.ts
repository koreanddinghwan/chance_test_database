import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToOne,
  Relation,
  ManyToOne,
} from "typeorm";
import { Author } from "./Author";
import { PhotoMetadata } from "./PhotoMetaData";

@Entity()
export class Photo {
  @PrimaryGeneratedColumn()
  id: number;
  @Column({
    type: "char",
    length: 100,
  })
  name: string;

  @Column({
    type: "char",
    length: 100,
  })
  filename: string;

  @Column("double")
  views: number;

  @Column({
    type: "boolean",
  })
  isPublished: boolean;

  @OneToOne(() => PhotoMetadata, (photoMetadata) => photoMetadata.photo)
  metadata: Relation<PhotoMetadata>;

  @ManyToOne(() => Author, (author) => author.photos)
  author: Author;
}
