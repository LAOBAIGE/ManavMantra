%MLINT  �l��������ɑ΂��� M-�t�@�C���̃`�F�b�N
%
%   MLINT(FILENAME) �́AFILENAME �Ɋւ��� M-Lint �̏���\�����܂��B
%   FILENAME ���Z���z��̏ꍇ�A���̓Z�����Ƃɕ\������܂��B
%   MLINT(F1,F2,F3,...) �ł́A�e���͕͂����z��ŁA�e���͂̃t�@�C������
%   �ւ������\�����܂��B�t�@�C�����̃Z���z��ƕ����z���A�����邱�Ƃ�
%   �ł��܂���B
%
%   INFO = MLINT(...,'-struct') �́A�\���̔z��� M-Lint �̏���Ԃ��܂��B
%   ���̒����͖�肪���肻���ȍ\���̐��ł��B���̍\���̂ɂ́A�ȉ��̃t�B�[���h��
%   ����܂��B
%       line    : ���b�Z�[�W���Q�Ƃ���s�ԍ��̃x�N�g��
%       column  : �e�s�ɑ΂��ă��b�Z�[�W���K�p����������� 2 ��̔z��
%       message : M-Lint �����o������肪���肻���ȍ\����������郁�b�Z�[�W
%   �����̃t�@�C���������͂����A���邢�́A�Z���z�񂪓��͂����ꍇ�A
%   INFO �́A�\���̂̃Z���z�񂪊܂܂�܂��B
%
%   MSG = MLINT(...,'-string') �́A�ϐ� MSG �ɑ΂��镶����Ƃ��� M-Lint ���
%   ��Ԃ��܂��B�����̃t�@�C���������͂����ꍇ�A�܂��̓Z���z�񂪓��͂����
%   �ꍇ�AMSG �́A�e�t�@�C���̏�� 10 �� "=" �����A�󔒁A�t�@�C�����A�󔒁A
%   ����сA10 �� "=" �����ŋ�؂�ꂽ�����񂪊܂܂�܂��B
%
%   -struct �܂��� -string �������ȗ�����A�o�͈������w�肳���ꍇ�A�f�t�H���g
%   �̓���� '-struct' �ɂȂ�܂��B�������ȗ������ꍇ�A�o�͈����͂���܂���B
%   �f�t�H���g�̓���́A�R�}���h���C���ɏ���\�����邱�Ƃł��B
%
%   [INFO,FILEPATHS] = MLINT(...) �́A����ɁAFILEPATHS ��Ԃ��܂��B����́A
%   �t�@�C�����̐�΃p�X�ŁA���͂��ꂽ�����Ɠ����ɂȂ�܂��B
%
%   [...] = MLINT(...,'-id') �́A���l�ɁAM-Lint ���� message ID ��v�����܂��B
%   �\���̂ɕԂ����ꍇ�A�o�͂ɂ͈ȉ��̒ǉ��̃t�B�[���h������܂��B
%       id       : ���b�Z�[�W�Ɋ֘A���� ID
%
%   [...] = MLINT(...,'-fullpath') �́A���͂̃t�@�C��������΃p�X�ł����
%   ���肷�邽�߁AMLINT �͂����̃t�@�C���̌������s���܂���B
%
%   �s�̍Ō�� %#ok ���g�p���邱�ƂŁAM-Lint �̓R�[�h�s�𖳎����܂��B
%   ���̃^�O�ɂ́A�R�����g�𑱂��邱�Ƃ��ł��܂��B���Ƃ��΁A
%       unsuppressed1 = 10   % ���̃��C���́Acatch ����܂�
%       suppressed2 = 20     %#ok  ���� 2 �s�́Acatch ����܂���
%       suppressed3 = 30     %#ok
%   [...] = MLINT(...,'-notok') �́A%#ok �^�O�𖳌��ɂ��܂��B
%
%   [...] = MLINT(...,'-cyc') �́A�t�@�C�����̊e�֐��� McCabe �̕��G�x 
%   (�z�I���G�x) ��\�����܂� �B
%
%   [...] = MLINT(...,'-config=<file>') �́A�f�t�H���g�̐ݒ�t�@�C����
%   �I�[�o�[���C�h���A"<file>" �Ŏw�肳�ꂽ�t�@�C�������Ɏg�p���܂��B
%   �t�@�C���������̏ꍇ�AM-Lint �́A�J������ǂݍ��񂾂�ł��Ȃ����Ƃ�
%   �������b�Z�[�W��Ԃ��܂��B���̏ꍇ�AM-Lint �͏o�׎��̐ݒ���g�p���܂��B
%
%   [...] = MLINT(...,'-config=factory') �́A���ׂĂ̐ݒ�t�@�C���𖳎�����
%   �o�׎��̐ݒ���g�p���܂��B
%
%   ��:
%       % "lengthofline.m" �́A��肪���肻���� M-Lint �̍\�������� 
%       % M-�t�@�C���̗�ł��B����́AMATLAB �f���̓ǂݎ���p�t�@�C��
%       % �Ƃ��Ē񋟂���Ă��܂��B
%       cd(fullfile(docroot, 'techdoc', 'matlab_env', 'examples'));
%       mlint lengthofline                    % �R�}���h���C���ɕ\��
%       info=mlint('lengthofline','-struct')  % ID �����\���̂ɕۑ�
%
%   �Q�l MLINTRPT.


%   Copyright 1984-2009 The MathWorks, Inc.
