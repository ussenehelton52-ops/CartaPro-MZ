import { Controller, Get } from '@nestjs/common';

@Controller()
export class HealthController {
  @Get('/health')
  health() {
    return {
      status: 'ok',
      service: 'CartaPro MZ API',
      timestamp: new Date().toISOString(),
    };
  }
}
