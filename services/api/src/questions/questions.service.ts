import { Injectable, NotFoundException } from '@nestjs/common';
import { DrivingCategory, Question, QuestionSummary, QuestionTopic } from './question.model';

@Injectable()
export class QuestionsService {
  private readonly questions: Question[] = [
    {
      id: 'q-001',
      category: 'ligeiro',
      topic: 'sinais',
      statement: 'O que deve fazer perante um sinal de cedência de passagem?',
      options: [
        { id: 'a', label: 'Aumentar a velocidade para passar primeiro' },
        { id: 'b', label: 'Reduzir a velocidade e ceder passagem quando necessário' },
        { id: 'c', label: 'Parar sempre durante 30 segundos' },
        { id: 'd', label: 'Ignorar o sinal se não houver peões' },
      ],
      correctOptionId: 'b',
      explanation: 'Deve aproximar-se com prudência, reduzir a velocidade e ceder passagem quando necessário.',
      source: 'Conteúdo oficial a validar pelo administrador',
      active: true,
    },
    {
      id: 'q-002',
      category: 'ligeiro',
      topic: 'circulacao',
      statement: 'Antes de mudar de direção, o condutor deve:',
      options: [
        { id: 'a', label: 'Sinalizar atempadamente e verificar se a manobra é segura' },
        { id: 'b', label: 'Travar bruscamente sem sinalizar' },
        { id: 'c', label: 'Usar apenas os quatro piscas' },
        { id: 'd', label: 'Acelerar e mudar imediatamente' },
      ],
      correctOptionId: 'a',
      explanation: 'A manobra deve ser sinalizada com antecedência e executada apenas quando for segura.',
      source: 'Conteúdo oficial a validar pelo administrador',
      active: true,
    },
    {
      id: 'q-003',
      category: 'profissional',
      topic: 'infracoes',
      statement: 'Ao conduzir, o uso do telemóvel na mão:',
      options: [
        { id: 'a', label: 'É permitido em baixa velocidade' },
        { id: 'b', label: 'É permitido apenas em estradas vazias' },
        { id: 'c', label: 'Prejudica a atenção e deve ser evitado' },
        { id: 'd', label: 'É obrigatório em emergências comuns' },
      ],
      correctOptionId: 'c',
      explanation: 'O telemóvel reduz a atenção do condutor. A regra legal aplicável deve ser confirmada na fonte oficial vigente.',
      source: 'Conteúdo oficial a validar pelo administrador',
      active: true,
    },
  ];

  list(category?: DrivingCategory, topic?: QuestionTopic): QuestionSummary[] {
    return this.questions
      .filter((question) => question.active)
      .filter((question) => !category || question.category === category)
      .filter((question) => !topic || question.topic === topic)
      .map(({ correctOptionId: _answer, ...summary }) => summary);
  }

  findById(id: string): Question {
    const question = this.questions.find((item) => item.id === id && item.active);
    if (!question) throw new NotFoundException(`Questão ${id} não encontrada`);
    return question;
  }

  getRandom(count: number, category?: DrivingCategory): Question[] {
    const pool = this.questions.filter((question) => question.active && (!category || question.category === category));
    return [...pool].sort(() => Math.random() - 0.5).slice(0, Math.max(1, Math.min(count, pool.length)));
  }
}
