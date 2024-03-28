import { Address } from './address.entity';
import { Contact } from './contact.entity';
import { Identification } from './identification.entity';
import { RG } from './rg.entity';

export class Employee {
  id?: string;
  email?: string;
  dateOfBirth?: string;
  cpf?: string;
  rg?: RG;
  identification?: Identification;
  contact?: Contact[];
  address?: Address[];
  userId: string;
}
