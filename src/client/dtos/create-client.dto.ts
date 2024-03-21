import { ApiProperty } from '@nestjs/swagger';
import { Client } from '../entities/client.entity';
import { IsString, MinLength } from 'class-validator';
import { ClientMessagesHelper } from '../helpers/messages.helper';

export class CreateClientDto extends Client {
  @ApiProperty({ example: 'Jose', description: 'Primeiro nome do cliente.' })
  @IsString()
  @MinLength(2, { message: ClientMessagesHelper.CLIENT_NAME_NOT_VALID })
  name: string;

  @ApiProperty({
    example: 'Silva Santos',
    description: 'Sobrenome do cliente.',
  })
  @IsString()
  @MinLength(2, { message: ClientMessagesHelper.CLIENT_LAST_NAME_NOT_VALID })
  lastName: string;

  @ApiProperty({
    example: '19900101',
    description: 'Data de nascimento do cliente.',
  })
  @IsString()
  @MinLength(8, {
    message: ClientMessagesHelper.CLIENT_DATE_OF_BIRTH_NOT_VALID,
  })
  dateOfBirth: string;

  @ApiProperty({
    example: '123.456.789-00',
    description: 'CPF do cliente.',
  })
  @IsString()
  @MinLength(11, { message: ClientMessagesHelper.CLIENT_CPF_NOT_VALID })
  cpf: string;

  @ApiProperty({
    example: '1234567890',
    description: 'RG do cliente.',
  })
  @IsString()
  @MinLength(5, { message: ClientMessagesHelper.CLIENT_RG_NOT_VALID })
  rg: string;
}
