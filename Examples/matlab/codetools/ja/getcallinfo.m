% GETCALLINFO  �Ăяo���ꂽ�֐��Ƃ��̍ŏ��̍ŏ��ƍŌ�̍s���o��
%
%   STRUCT = GETCALLINFO(FILENAME,OPTION,FILELIST)
%   �o�͂̍\���� STRUCT �́A���̌`�����Ƃ�܂��B
%      type:       [ �X�N���v�g | �֐� | �T�u�֐� | �l�X�g�֐�]
%      name:       �X�N���v�g���A�֐����A�܂��́A�T�u�֐���
%      firstline:  �X�N���v�g�A�֐��A�܂��́A�T�u�֐��̍ŏ��̍s
%      lastline:   �X�N���v�g�A�֐��A�܂��̓T�u�֐��̍Ō�̍s
%      linemask:   flist �̃t�@�C���Ɠ����s�����܂݂܂��B
%                  linemask �́A�X�R�[�v���̊֐��̂��ׂĂ̍s��1�ł��B
%      calls:      �X�N���v�g�A�֐��A�܂��́A�T�u�֐��ɂ��Ăяo��
%      calllines:  ��L�̌Ăяo�����s����s
%
%   OPTION = [ 'normal' | 'flat' ]
%   �f�t�H���g�ł́AOPTION �́A'normal' �ɐݒ肳��܂��B
%   
%   OPTION = 'flat' �́A�X�N���v�g�A�T�u�֐��̂Ȃ��֐��A�܂��́A�T�u�֐���
%   ����֐��ł��邩�ǂ����Ɋւ�炸�A�t�@�C���S�̂�1�̍\���̂��o�͂��܂��B
%   �T�u�֐��̂���t�@�C���ɑ΂��āA�t�@�C���ɑ΂���Ăяo���́A�T�u�֐���
%   ��邷�ׂĂ̊O���Ăяo�����܂݂܂��B
%
%   OPTION = 'normal' �́A�\���̂̔z���Ԃ��܂��B�ŏ��͂��ׂẴT�u�֐���
%   �������C���֐��ł��B���̃I�v�V�����́A�X�N���v�g��1�̊֐��t�@�C����
%   �΂��� 'flat' �Ɠ������ʂ�Ԃ��܂��B


%   Copyright 1984-2006 The MathWorks, Inc.
