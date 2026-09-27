import { IsIn, IsInt, IsOptional, IsString, Max, Min } from 'class-validator';
import { DrivingCategory } from '../questions/question.model';

export class CreateExamDto {
  @IsOptional()
  @IsIn(['ligeiro', 'pesado', 'profissional'])
  category?: DrivingCategory;

  @IsOptional()
  @IsInt()
  @Min(1)
  @Max(30)
  count?: number;
}

export class SubmitAnswerDto {
  @IsString()
  questionId!: string;

  @IsString()
  optionId!: string;
}
