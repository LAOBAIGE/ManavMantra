%DBCLEAR  �u���[�N�|�C���g�̃N���A
%
%   DBCLEAR �R�}���h�́A�Ή����� DBSTOP �Őݒ肳�ꂽ�u���[�N�|�C���g��
%   �폜���܂��B���̃R�}���h�ɂ́A�������̌`��������܂��B
%   �ȉ��̂悤�ɂȂ�܂��B
%
%   (1)  DBCLEAR in MFILE at LINENO
%   (2)  DBCLEAR in MFILE at LINENO@
%   (3)  DBCLEAR in MFILE at LINENO@N
%   (4)  DBCLEAR in MFILE at SUBFUN
%   (5)  DBCLEAR in MFILE
%   (6)  DBCLEAR if ERROR
%   (7)  DBCLEAR if CAUGHT ERROR
%   (8)  DBCLEAR if WARNING
%   (9)  DBCLEAR if NANINF  or  DBCLEAR if INFNAN
%   (10) DBCLEAR if ERROR IDENTIFIER
%   (11) DBCLEAR if CAUGHT ERROR IDENTIFIER
%   (12) DBCLEAR if WARNING IDENTIFIER
%   (13) DBCLEAR ALL
%
%   MFILE �́AM-�t�@�C���̖��O�A�܂��� MATLABPATH ���Ε����p�X���łȂ����
%   �Ȃ�܂��� (�Q�� PARTIALPATH)�B�R�}���h�� -completenames �I�v�V�������܂݁A
%   MFILE �����S�C���q�t���̃t�@�C�����Ƃ��Ďw�肳��Ă���ꍇ�́AMFILE �̓p�X��
%   �ɂ���K�v�͂���܂���B(Windows �ł́A����́A�R������ \\ �܂��̓h���C�u��
%   �̌�ɑ����Ďn�܂�t�@�C�����ł��BUnix �ł́A����́A/ �܂��� ~ �Ŏn�܂�
%   �t�@�C�����ł��B) MFILE �́AM-�t�@�C�����̓���̃T�u�֐��A�܂��́A�l�X�g
%   �֐��ւ̃p�X���w�肷�� filemarker ���܂ނ��Ƃ��ł��܂��B
%
%   LINENO �́AMFILE ���̍s�ԍ��ŁAN �͂��̍s�ɂ��� N �Ԗڂ̖����֐����w��
%   ���鐮���ŁASUBFUN �� MFILE ���̃T�u�֐��̖��O�ł��BIDENTIFIER �́A
%   MATLAB �̃��b�Z�[�W���ʎq�ł� (���b�Z�[�W���ʎq�̋L�q�� ERROR �̃w���v���Q��)�B
%   �L�[���[�h AT, IN �̓I�v�V�����ł��B
%
%   �������̌`���́A�ȉ��̂悤�ɓ��삵�܂��B
%
%   (1)  MFILE �̍s LINENO �̃u���[�N�|�C���g���폜���܂��B
%   (2)  MFILE �̍s LINENO �̍ŏ��̖����֐��̃u���[�N�|�C���g���폜���܂��B
%   (3)  MFILE ���̍s LINENO �� N �Ԗڂ̖����֐��̃u���[�N�|�C���g���폜���܂��B
%        (�����s��ɕ����̖����֐�������ꍇ�Ɏg�p���܂��B)
%   (4)  MFILE �̎w�肵���T�u�֐����̂��ׂẴu���[�N�|�C���g���폜���܂��B
%   (5)  MFILE ���̂��ׂẴu���[�N�|�C���g���폜���܂��B
%   (6)  DBSTOP IF ERROR �X�e�[�g�����g�ƔC�ӂ� DBSTOP IF ERROR IDENTIFIER 
%        �X�e�[�g�����g���ݒ肳��Ă���ꍇ�A�N���A���܂��B
%   (7)  DBSTOP IF CAUGHT ERROR �X�e�[�g�����g�� DBSTOP IF CAUGHT ERROR IDENTIFIER 
%        �X�e�[�g�����g���ݒ肳��Ă���ꍇ�A�N���A���܂��B
%   (8)  DBSTOP IF WARNING �X�e�[�g�����g�� DBSTOP IF WARNING IDENTIFIER 
%        �X�e�[�g�����g���ݒ肳��Ă���ꍇ�A�N���A���܂�
%   (9)  ������ �� NaN ��DBSTOP ��ݒ肳��Ă���ꍇ�A�N���A���܂��B
%   (10) �w�肵��IDENTIFIER �ɑ΂��� DBSTOP IF ERROR IDENTIFIER �X�e�[�g�����g��
%        �N���A���܂��BDBSTOP IF ERROR �܂��� DBSTOP IF ERROR ALL ���ݒ肳���
%        ����ꍇ�A�w�肵�����ʎq�̂��̐ݒ���N���A����ƁA�G���[�ɂȂ�܂��B
%   (11) �w�肵��IDENTIFIER �ɑ΂��� DBSTOP IF CAUGHT ERROR IDENTIFIER 
%        �X�e�[�g�����g���N���A���܂��BDBSTOP IF CAUGHT ERROR �܂��� 
%        DBSTOP IF CAUGHT ERROR ALL ���ݒ肳��Ă���ꍇ�A�w�肵�����ʎq��
%        ���̐ݒ���N���A����ƁA�G���[�ɂȂ�܂��B
%   (12) �w�肳�ꂽ IDENTIFIER �ɑ΂��� DBSTOP IF WARNING IDENTIFIER 
%        �X�e�[�g�����g���N���A���܂��BDBSTOP IF WARNING �܂��� 
%        DBSTOP IF WARNING ALL ���ݒ肳��Ă���ꍇ�A�w�肵�����ʎq��
%        ���̐ݒ���N���A����ƃG���[�ɂȂ�܂��B
%   (13) ��L�� (6)-(9) �ɏq�ׂ��悤�ɁA���ׂĂ� M-�t�@�C���̃u���[�N�|�C���g
%        ���N���A���܂��B
%
%   �Q�l DBSTEP, DBSTOP, DBCONT, DBTYPE, DBSTACK, DBUP, DBDOWN, DBSTATUS,
%        DBQUIT, FILEMARKER, ERROR, PARTIALPATH, TRY, WARNING.


%   Copyright 1984-2009 The MathWorks, Inc.
