import { IsString, Matches, MaxLength, MinLength } from 'class-validator';
import { UserMessagesHelper } from '../helpers/messages.helper';
import { User } from '../entities/user.entity';
import { ApiProperty } from '@nestjs/swagger';

export class RegisterUserDto extends User {
  @ApiProperty({
    example: 'matheusAuxiliar',
    description:
      'O nome do usuário utilizado para fazer o login, pode se usar qualquer nome que preferir.',
  })
  @MinLength(4, { message: UserMessagesHelper.REGISTER_NAME_NOT_VALID })
  userName: string;

  @ApiProperty({
    example: 'Abc@123',
    description:
      'Senha de login do usuário, a senha deve ter de 4 a 12 caracteres e conter pelo menos um caractere maiúsculo, um minúsculo, um número e um caractere especial.',
  })
  @MinLength(4, { message: UserMessagesHelper.REGISTER_PASSWORD_NOT_VALID })
  @MaxLength(12, { message: UserMessagesHelper.REGISTER_PASSWORD_NOT_VALID })
  @Matches(/((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, {
    message: UserMessagesHelper.REGISTER_PASSWORD_NOT_VALID,
  })
  password: string;

  @ApiProperty({
    example: 'Matheus Santos',
    description: 'Nome completo do usuário.',
  })
  @IsString()
  @MinLength(4, { message: UserMessagesHelper.REGISTER_NAME_NOT_VALID })
  name: string;
}
