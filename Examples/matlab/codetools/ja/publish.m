%PUBLISH  �Z�����܂� M-�t�@�C�����o�̓t�@�C���ɕϊ�
%
%   PUBLISH(FILE) �́A�x�[�X���[�N�X�y�[�X���̂��鎞�ԂŁAM-�t�@�C���� 1 ��
%   �Z�������s���܂��B�R�[�h�ƃR�����g�ƁA�������O������ HTML-�t�@�C���ւ̌��ʂ�
%   �ۑ����܂��BHTML-�t�@�C���́A���̃X�N���v�g�̃f�B���N�g���� "html" �T�u
%   �f�B���N�g�����ɁA���̃T�|�[�g�����o�̓t�@�C���Ƌ��Ɋi�[����܂��B
%
%   PUBLISH(FILE,FORMAT) �́A�w�肵���`���ŃX�N���v�g�����s�܂��B
%   FORMAT �́A�ȉ��̂����ꂩ�ɂȂ�܂��B
%
%      'html'  - HTML.
%      'doc'  - Microsoft Word (Microsoft Word ���K�v)�B
%      'ppt'  - Microsoft PowerPoint (Microsoft PowerPoint ���K�v)�B
%      'xml'  - XSLT �܂��͑��̃c�[���ŕϊ��\�� XML �t�@�C���B
%      'latex' - LaTeX.����ɁAfigureSnapMethod �� 'getframe' �łȂ�����A
%                �f�t�H���g�� imageFormat �� 'epsc2' �ɕύX���܂��B
%
%   PUBLISH(FILE,OPTIONS) �́A�ȉ��̃t�B�[���h�̂����ꂩ���܂ލ\���̂�^���܂��B
%   �t�B�[���h���w�肳��Ȃ��ꍇ�A���X�g�� 1 �Ԗڂ̑I�����g���܂��B
%
%       format: 'html' | 'doc' | 'ppt' | 'xml' | 'latex'
%       stylesheet: '' | XSL �t�@�C���� (format = html �܂��� xml �łȂ����薳��)
%       outputDir: '' (���̃t�@�C����艺�ʂ� html �T�u�t�H���_) | ��΃p�X
%       imageFormat: '' (format �Ɋ�Â��f�t�H���g)  | figureSnapMethod ��
%                    �ˑ����� PRINT �܂��� IMWRITE �ŃT�|�[�g��������
%       figureSnapMethod: 'entireGUIWindow'| 'print' | 'getframe' | 'entireFigureWindow'
%       useNewFigure: true | false
%       maxHeight: [] (�����Ȃ�) | ���̐��� (�s�N�Z��)
%       maxWidth: [] (�����Ȃ�) | ���̐��� (�s�N�Z��)
%       showCode: true | false
%       evalCode: true | false
%       catchError: true | false
%       createThumbnail: true | false
%       maxOutputLines: Inf | �񕉂̐���
%       codeToEvaluate: (�ϊ����� M-�t�@�C��) | �L���ȃR�[�h
%
%   HTML �ɕϊ�����ƁA�f�t�H���g�̃X�^�C���V�[�g�́A"showcode = false" ��
%   �ꍇ�ł��AHTML �R�����g�Ƃ��ăI���W�i���̃R�[�h��ۑ����܂��BGRABCODE ��
%   �g�p���Ē��o���Ă��������B
%
%   ��:
%
%       opts.outputDir = tempdir;
%       file = publish('intro',opts);
%       web(file)
%
%   �Q�l NOTEBOOK, GRABCODE.


% Copyright 1984-2009 The MathWorks, Inc.
