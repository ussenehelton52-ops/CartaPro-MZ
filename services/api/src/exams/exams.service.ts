import { BadRequestException, Injectable } from '@nestjs/common';
import { QuestionsService } from '../questions/questions.service';
import { DrivingCategory } from '../questions/question.model';

@Injectable()
export class ExamsService {
  constructor(private readonly questionsService: QuestionsService) {}

  create(category?: DrivingCategory, count = 10) {
    const questions = this.questionsService.getRandom(count, category);
    return {
      id: `exam-${Date.now()}`,
      mode: 'simulado',
      category: category ?? 'ligeiro',
      durationSeconds: 30 * 60,
      createdAt: new Date().toISOString(),
      questions: questions.map(({ correctOptionId: _answer, ...safeQuestion }) => safeQuestion),
    };
  }

  submit(questionId: string, optionId: string) {
    const question = this.questionsService.findById(questionId);
    const optionExists = question.options.some((option) => option.id === optionId);
    if (!optionExists) throw new BadRequestException('Alternativa inválida para esta questão');

    const correct = question.correctOptionId === optionId;
    return {
      questionId,
      optionId,
      correct,
      explanation: question.explanation,
      correctOptionId: question.correctOptionId,
    };
  }
}
