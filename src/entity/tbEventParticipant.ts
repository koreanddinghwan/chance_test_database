import { Entity, ManyToOne, PrimaryColumn } from "typeorm";
import { tbUser } from "./tbUser";
import { tbEvent } from "./tbEvent";
/*
 * typeorm이 다:다 관계 생성을 지원해서 이 테이블이 필요가 없어짐...
 * 이 아니라 typeOrm은 두개 다 지원합니다!!
 *
 * 1. manyToMany로 user - event를 매핑할 수 있고,
 * 2. 이 테이블을 생성해 one to many, many to one으로 연결할수도 있습니다.
 * 아래 테이블을 사용하는 경우에는 tbEventParticipant가
 * tbUser와 tbEvent를 제외한 별도의 propert(column)을 가질때인데,
 * 별도의 프로퍼티가 필요하지 않기에 사용하지 않겠습니다.
 * */

@Entity()
export class tbEventParticipant {
  @PrimaryColumn({
    type: "int",
    primaryKeyConstraintName: "pk_tbEventParticipent",
    nullable: false,
  })
  eventId: number;

  @PrimaryColumn({
    type: "int",
    primaryKeyConstraintName: "pk_tbEventParticipent",
    nullable: false,
  })
  guestUserId: number;
}
