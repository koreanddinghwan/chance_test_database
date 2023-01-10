import * as dotenv from "dotenv";

let path: any;

switch (process.env.NODE_ENV) {
  case "prod":
    path = `${__dirname}/../.env.prod`;
    break;
  case "dev":
    path = `${__dirname}/../.env.dev`;
    break;
  default:
    path = `${__dirname}/../.env.dev`;
}
console.log(path);

dotenv.config({ path: path });
