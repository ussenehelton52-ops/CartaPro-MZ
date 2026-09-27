import { Controller, Get, Param, Query } from '@nestjs/common';
import { DrivingCategory, QuestionTopic } from './question.model';
import { QuestionsService } from './questions.service';

@Controller('questions')
export class QuestionsController {
  constructor(private readonly questionsService: QuestionsService) {}

  @Get()
  list(
    @Query('category') category?: DrivingCategory,
    @Query('topic') topic?: QuestionTopic,
  ) {
    return this.questionsService.list(category, topic);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    const question = this.questionsService.findById(id);
    const { correctOptionId: _answer, ...safeQuestion } = question;
    return safeQuestion;
  }
}
