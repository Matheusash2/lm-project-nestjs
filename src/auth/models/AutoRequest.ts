import { Request } from 'express';
import { User } from 'src/user/entities/user.entity';

export interface AutoRequest extends Request {
  user: User;
}
