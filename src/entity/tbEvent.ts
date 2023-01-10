import { Entity, Column, PrimaryColumn, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class tbEvent {
  @PrimaryGeneratedColumn()
  eventId: number;
}
