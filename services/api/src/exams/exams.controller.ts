import { Body, Controller, Post, UsePipes, ValidationPipe } from '@nestjs/common';
import { CreateExamDto, SubmitAnswerDto } from './exam.dto';
import { ExamsService } from './exams.service';

@Controller('exams')
export class ExamsController {
  constructor(private readonly examsService: ExamsService) {}

  @Post()
  @UsePipes(new ValidationPipe({ transform: true, whitelist: true }))
  create(@Body() dto: CreateExamDto) {
    return this.examsService.create(dto.category, dto.count);
  }

  @Post('answers')
  @UsePipes(new ValidationPipe({ transform: true, whitelist: true }))
  submitAnswer(@Body() dto: SubmitAnswerDto) {
    return this.examsService.submit(dto.questionId, dto.optionId);
  }
}
