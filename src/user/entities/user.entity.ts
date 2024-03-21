import { Employee } from './employee.entity';

export class User {
  id?: string;
  userName: string;
  password: string;
  name: string;
  lastName: string;
  createdAt?: Date;
  employee?: Employee;
}
