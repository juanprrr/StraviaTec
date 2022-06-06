import { TestBed } from '@angular/core/testing';

import { UsuarioSigueUsuarioService } from './usuario-sigue-usuario.service';

describe('UsuarioSigueUsuarioService', () => {
  let service: UsuarioSigueUsuarioService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(UsuarioSigueUsuarioService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
