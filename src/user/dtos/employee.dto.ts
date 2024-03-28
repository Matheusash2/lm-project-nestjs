import { IsEmail, IsString } from 'class-validator';
import { Employee } from '../entities/employee.entity';
import { ApiProperty } from '@nestjs/swagger';

export class EmployeeDto extends Employee {
  @ApiProperty({
    example: 'example@example.com',
    description: 'E-mail do funcionário.',
  })
  @IsString()
  @IsEmail()
  email?: string;

  @ApiProperty({
    example: '10-10-2024',
    description: 'Data de nascimento do funcionário.',
  })
  @IsString()
  dateOfBirth?: string;

  @ApiProperty({
    example: '123.456.789-00',
    description: 'CPF do funcionário.',
  })
  @IsString()
  cpf?: string;

  @ApiProperty({
    example: 'kd5555kksksk55555',
    description: 'O id do usuário do funcionário.',
  })
  @IsString()
  userId: string;
}
