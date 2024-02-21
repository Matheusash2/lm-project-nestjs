import { IsNotEmpty } from 'class-validator';
import { MessagesHelper } from '../helpers/messages.helper';

export class LoginDto {
  @IsNotEmpty({ message: MessagesHelper.AUTH_LOGIN_NOT_FOUND })
  userName: string;

  @IsNotEmpty({ message: MessagesHelper.AUTH_PASSWORD_NOT_FOUND })
  password: string;
}
