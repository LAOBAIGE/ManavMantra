%DBSTATUS  ���ׂẴu���[�N�|�C���g�̃��X�g
%
%   DBSTATUS �́AERROR, CAUGHT ERROR, WARNING, NANINF ���܂ރf�o�b�K��
%   �F�����邷�ׂẴu���[�N�|�C���g�̃��X�g��\�����܂��B
%
%   DBSTATUS MFILE �́A�w�肳�ꂽ M-�t�@�C�����Őݒ肳�ꂽ�u���[�N�|�C���g��
%   �\�����܂��BMFILE �́AM-�t�@�C���֐����A�܂��� MATLABPATH �̑��Ε����p�X����
%   �Ȃ���΂Ȃ�܂��� (PARTIALPATH ���Q��)�B
%
%   DBSTATUS('-completenames') �́A�e�֐��� "���S�Ȗ��O" ���o�͂��܂��B���S��
%   ���O�́A�u���[�N�|�C���g���ݒ肳��Ă���֐����l�X�g�����΃t�@�C������
%   �֐��̗�S�̂��܂݂܂��B
%
%   S = DBSTATUS(...) �́A�u���[�N�|�C���g�����ȉ��̃t�B�[���h������ 
%   M �s 1 ��̍\���̂ɕԂ��܂��B
%       name -- �֐����B
%       file -- �u���[�N�|�C���g���܂ރt�@�C���̊��S�Ȗ��O�B
%       line -- �u���[�N�|�C���g�̍s�ԍ��̃x�N�g���B
%       anonymous -- 'line' �t�B�[���h�̗v�f�ɑΉ�����e�v�f�̐����x�N�g���B
%                    ���ꂼ��̐��̗v�f�́A���̍s�̖����֐��̖{�̂ɂ���u���[�N
%                    �|�C���g��\���܂��B���Ƃ��΁A���̍s�� 2 �Ԗڂ̖����֐���
%                    �{�̂ɂ���u���[�N�|�C���g�́A���̃x�N�g���ɂ����Ēl 2 ��
%                    �Ȃ�܂��B�v�f�� 0 �̏ꍇ�A�u���[�N�|�C���g�͍s�̎n�܂�ɂ���A
%                    ���Ȃ킿�A�����֐��ɂ͂Ȃ����Ƃ��Ӗ����܂��B
%       expression -- 'line' �t�B�[���h�̍s�ɑ�������u���[�N�|�C���g�̏�������
%                    �Z���̃x�N�g���B
%       cond -- �����̕����� ('error', 'caught error', 'warning' �܂��� 'naninf')�B
%       identifier -- cond �� 'error', 'caught error' �܂��� 'warning' ��
%                    �����ꂩ�ł���ꍇ�A����� cond �̏�Ԃ�ݒ肷�� MATLAB 
%                    ���b�Z�[�W���ʎq������̃Z���̃x�N�g���B
%
%   �Q�l DBSTEP, DBSTOP, DBCONT, DBCLEAR, DBTYPE, DBSTACK, DBUP, DBDOWN,
%        DBQUIT, ERROR, PARTIALPATH, WARNING.


%   Copyright 1984-2009 The MathWorks, Inc.
