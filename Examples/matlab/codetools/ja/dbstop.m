%DBSTOP  �u���[�N�|�C���g�̐ݒ�
%
%   �R�}���h DBSTOP �́AM-�t�@�C���֐��̎��s���ꎞ�I�ɒ�~����Ƃ��Ɏg���A
%   ���[�J���̃��[�N�X�y�[�X�̓��e�𒲂ׂ邱�Ƃ��ł��܂��B���̃R�}���h�ɂ́A
%   �������̌`��������܂��B�ȉ��̂悤�ɂȂ�܂��B
%
%   (1)  DBSTOP in MFILE at LINENO
%   (2)  DBSTOP in MFILE at LINENO@
%   (3)  DBSTOP in MFILE at LINENO@N
%   (4)  DBSTOP in MFILE at SUBFUN
%   (5)  DBSTOP in MFILE
%   (6)  DBSTOP in MFILE at LINENO if EXPRESSION
%   (7)  DBSTOP in MFILE at LINENO@ if EXPRESSION
%   (8)  DBSTOP in MFILE at LINENO@N if EXPRESSION
%   (9)  DBSTOP in MFILE at SUBFUN if EXPRESSION
%   (10) DBSTOP in MFILE if EXPRESSION
%   (11) DBSTOP if error
%   (12) DBSTOP if caught error
%   (13) DBSTOP if warning
%   (14) DBSTOP if naninf  or  DBSTOP if infnan
%   (15) DBSTOP if error IDENTIFIER
%   (16) DBSTOP if caught error IDENTIFIER
%   (17) DBSTOP if warning IDENTIFIER
%
%   MFILE �́AM-�t�@�C���̖��O�A�܂��� MATLABPATH ���Ε����p�X���łȂ����
%   �Ȃ�܂��� (�Q�� PARTIALPATH)�B�R�}���h�� -completenames �I�v�V�������܂݁A
%   MFILE �����S�C���q�t���̃t�@�C�����Ƃ��Ďw�肳��Ă���ꍇ�́AMFILE �̓p�X��
%   �ɂ���K�v�͂���܂���B(Windows �ł́A����́A�R������ \\ �܂��̓h���C�u��
%   �̌�ɑ����Ďn�܂�t�@�C�����ł��BUnix �ł́A����́A/ �܂��� ~ �Ŏn�܂�
%   �t�@�C�����ł��B)MFILE �́AM-�t�@�C�����̓���̃T�u�֐��A�܂��́A�l�X�g
%   �֐��ւ̃p�X���w�肷�� filemarker ���܂ނ��Ƃ��ł��܂��B
%
%   LINENO �́AMFILE ���̍s�ԍ��ŁAN �͂��̍s�ɂ��� N �Ԗڂ̖����֐����w�肷��
%   �����ŁASUBFUN �� MFILE ���̃T�u�֐��̖��O�ł��BEXPRESSION �́A���s�\��
%   ���������܂ޕ�����ł��BIDENTIFIER �́AMATLAB �̃��b�Z�[�W���ʎq�ł� 
%   (���b�Z�[�W���ʎq�̋L�q�� ERROR �̃w���v���Q��)�B�L�[���[�h AT, IN ��
%   �I�v�V�����ł��B
%
%   �`���́A�ȉ��̂悤�ɓ��삵�܂��B
%
%   (1)  MFILE ���̎w�肵���s�ԍ��Œ�~���܂��B
%   (2)  MFILE �̎w�肵���s�ԍ��ŁA�ŏ��̂���֐����Ăяo���ꂽ����ɒ�~���܂��B
%   (3)  (2) �Ɠ��l�ł����AN �Ԗڂ̂���֐����Ăяo���ꂽ����ɒ�~���܂��B
%   (4)  MFILE �̎w�肵���T�u�֐��Œ�~���܂��B
%   (5)  MFILE �̍ŏ��̎��s�\�ȍs�Œ�~���܂��B
%   (6-10) EXPRESSION �� true �ɕ]������ꍇ�̂ݒ�~���邱�Ƃ������A
%        (1)-(5) �Ɠ����ł��BEXPRESSION �́A�u���[�N�|�C���g�ɒB�����ꍇ�A
%        MFILE �̃��[�N�X�y�[�X���� (EVAL �̏ꍇ�̂悤��) �]������܂��B
%        ����́A�X�J���̘_���l (true �܂��� false) �ŕ]������Ȃ����
%        �Ȃ�܂���B
%   (11) TRY...CATCH �u���b�N���Ō��o����Ȃ����s���G���[���N���� M-�t�@�C��
%        �֐����Œ�~�������N�����܂��B
%        catch ����Ȃ��������s���G���[�̌�ɂ́AM-�t�@�C���̎��s���ĊJ�ł��܂���B
%   (12) TRY...CATCH �u���b�N���Ō��o���ꂽ���s���G���[�̌����ƂȂ� M-�t�@�C��
%        �֐��Œ�~���܂��B���s���G���[�� catch ������AM-�t�@�C���̎��s��
%        �ĊJ���邱�Ƃ��ł��܂��B
%   (13) ���s���x���̌����ƂȂ� M-�t�@�C���֐����Œ�~���܂��B
%   (14) ������ (Inf)�A�܂��́ANaN �����m���ꂽ�ʒu�ɑ��݂��� M-�t�@�C������
%        ��~���܂��B
%   (15-17) ���b�Z�[�W���ʎq�� IDENTIFIER �ł���G���[�܂��͌x���ɂ����āA
%        MATLAB ����~���邱�Ƃ������A(11)-(13) �Ɠ��l�ł��B(IDENTIFIER ��
%        ����̕����� 'all' �̏ꍇ�A�����́A(11)-(13) �Ɠ�������ɂȂ�܂��B)
%
%   MATLAB ���u���[�N�|�C���g�ɒB����ƁA�f�o�b�O���[�h�ɓ���܂��B����ƁA
%   �v�����v�g���AK>> �ɕς��A�f�o�b�O���j���[�� "�f�o�b�O���� M-�t�@�C����
%   �J��" �̐ݒ�ɂ���āA�f�o�b�K�E�B���h�E���A�N�e�B�u�ɂȂ�܂��B�C�ӂ� 
%   MATLAB �R�}���h���v�����v�g�ɓ��͂��邱�Ƃ��ł��܂��BM-�t�@�C���̎��s��
%   �ĊJ����ɂ́ADBCONT �܂��� DBSTEP ���g�p���Ă��������B�f�o�b�K����
%   �����o���ɂ́ADBQUIT ���g�p���Ă��������B
%
%   �Q�l DBCONT, DBSTEP, DBCLEAR, DBTYPE, DBSTACK, DBUP, DBDOWN, DBSTATUS,
%        DBQUIT, FILEMARKER, ERROR, EVAL, LOGICAL, PARTIALPATH, TRY,
%        WARNING.


%   Copyright 1984-2009 The MathWorks, Inc.
