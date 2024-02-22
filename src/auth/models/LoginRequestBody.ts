import { IsNotEmpty, IsString } from 'class-validator';
import { MessagesHelper } from '../helpers/messages.helper';

export class LoginRequestBody {
  @IsNotEmpty({ message: MessagesHelper.AUTH_PASSWORD_OR_LOGIN_INVALID })
  @IsString({ message: MessagesHelper.AUTH_PASSWORD_OR_LOGIN_INVALID })
  userName: string;

  @IsNotEmpty({ message: MessagesHelper.AUTH_PASSWORD_OR_LOGIN_INVALID })
  @IsString({ message: MessagesHelper.AUTH_PASSWORD_OR_LOGIN_INVALID })
  password: string;
}