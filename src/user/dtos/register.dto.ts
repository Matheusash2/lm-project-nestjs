import { IsString, Matches, MaxLength, MinLength } from 'class-validator';
import { UserMessagesHelper } from '../helpers/messages.helper';
import { User } from '../entities/user.entity';

export class RegisterUserDto extends User {

    @MinLength(4, { message: UserMessagesHelper.REGISTER_NAME_NOT_VALID })
    userName: string;

    @MinLength(4, { message: UserMessagesHelper.REGISTER_PASSWORD_NOT_VALID })
    @MaxLength(12, { message: UserMessagesHelper.REGISTER_PASSWORD_NOT_VALID })
    @Matches(/((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, { message: UserMessagesHelper.REGISTER_PASSWORD_NOT_VALID })
    password: string;

    @IsString()
    @MinLength(4, { message: UserMessagesHelper.REGISTER_NAME_NOT_VALID })
    name: string;
}
