{$IfNDef evDefine}
 {$Define evDefine}
{ ���������� "�������" }
{ �����: ����� �.�. �  }
{ ������: evDefine.inc - ���� ���������� �������� ���������� ���������� }
{ �����: 11.12.1996    }
{ $Id: evDefine.inc,v 1.177 2016/07/01 13:13:35 dinishev Exp $ }

// $Log: evDefine.inc,v $
// Revision 1.177  2016/07/01 13:13:35  dinishev
// {Requestlink:623484518}
//
// Revision 1.176  2015/04/24 14:34:26  lulin
// - ���������� define.
//
// Revision 1.175  2015/04/24 14:32:00  lulin
// - ���������� define.
//
// Revision 1.174  2014/08/29 12:24:43  lulin
// - �������� �������� ���������.
//
// Revision 1.173  2014/04/08 12:35:09  lulin
// - ��������� �� ����������� � ��������.
//
// Revision 1.172  2014/03/11 11:37:09  lulin
// - ������ ���.
//
// Revision 1.171  2014/02/25 16:20:00  lulin
// - �������� ��������.
//
// Revision 1.170  2014/02/20 15:55:57  lulin
// - �������������� ���� ����� � �������� ��������.
//
// Revision 1.169  2014/02/14 15:33:32  lulin
// - ����������� �� ������ ���������.
//
// Revision 1.168  2013/12/25 15:35:18  lulin
// {RequestLink:509706011}
// - ����������� ������.
//
// Revision 1.167  2013/10/21 17:30:59  lulin
// - ���������� ����������� �� ������������� ��������������� ����� �����.
//
// Revision 1.166  2013/10/21 15:42:58  lulin
// - ���������� ����������� �� ������������� ��������������� ����� �����.
//
// Revision 1.165  2013/10/16 15:38:55  lulin
// {RequestLink:493855747}.
//
// Revision 1.164  2013/08/20 17:30:00  lulin
// - �������� �������� ������� �������.
//
// Revision 1.163  2013/03/26 15:54:55  lulin
// - ��������� ������������� ��-�� ����������� ������ ��������.
//
// Revision 1.162  2012/10/29 13:28:57  lulin
// - �������� ��������� ����� ���������.
//
// Revision 1.161  2012/10/26 19:11:44  lulin
// - �������� ��������� ����� ���������.
//
// Revision 1.160  2012/06/05 13:10:43  voba
// no message
//
// Revision 1.159  2012/02/03 17:09:11  lulin
// {RequestLink:333548940}
// - ������ ��������� ���� �� ������.
//
// Revision 1.158  2012/02/03 11:45:43  lulin
// - ������ �������������� ��� �������.
//
// Revision 1.157  2011/07/07 19:53:40  lulin
// {RequestLink:228688745}.
//
// Revision 1.156  2011/06/08 10:18:32  lulin
// {RequestLink:250088031}.
//
// Revision 1.155  2011/05/06 14:28:02  lulin
// - ������ IfDef'�.
//
// Revision 1.154  2011/04/27 12:16:26  dinishev
// [$233013514]. ���������� "�������".
//
// Revision 1.153  2011/04/18 14:47:28  lulin
// {RequestLink:233013514}.
//
// Revision 1.152  2011/04/07 16:00:43  lulin
// {RequestLink:259894465}.
//
// Revision 1.151  2011/02/25 14:12:26  lulin
// {RequestLink:254354849}.
//
// Revision 1.150  2011/02/18 12:11:56  lulin
// - ��������� ����������� ��� ���������.
//
// Revision 1.149  2010/12/21 09:29:04  lulin
// {RequestLink:248189760}.
//
// Revision 1.148  2010/06/29 14:47:24  lulin
// {RequestLink:165512428}.
// - �������� ����.
//
// Revision 1.147  2010/01/22 17:39:37  lulin
// - ������ ���� ��� "�����".
//
// Revision 1.146  2009/08/19 07:38:05  lulin
// [$159362598].
//
// Revision 1.145  2009/08/18 08:47:31  lulin
// {ReqestLink:158795592}. �2.
//
// Revision 1.144  2009/08/14 15:23:42  lulin
// - ������ ���.
//
// Revision 1.143  2009/07/23 17:28:50  lulin
// - ������� �������� ������ ����������.
// - ������ ������������ � SomeDataContainer.
//
// Revision 1.142  2009/07/20 16:44:04  lulin
// - ������� �� ��������� ��������� ���������� �������� ���� ����������� ����, ������ ����� "������" ��� ������ ��� ���� ���� ��� ������.
//
// Revision 1.141  2009/04/16 14:42:02  lulin
// [$143396720]. �7.
//
// Revision 1.140  2009/04/13 12:32:48  lulin
// [$142613919].
//
// Revision 1.139  2008/10/09 13:37:33  lulin
// - <K>: 121145547.
//
// Revision 1.138  2008/10/03 15:24:31  lulin
// - �������� �������� ���.
//
// Revision 1.137  2008/05/29 12:56:28  lulin
// - �������������.
//
// Revision 1.136  2008/05/26 14:45:54  narry
// - _evNSRCPlus �� ��������� ��������
//
// Revision 1.135  2008/05/26 14:34:44  lulin
// - ��������� ������� �����������.
//
// Revision 1.134  2008/05/23 16:04:38  lulin
// - <K>: 91848978.
//
// Revision 1.133  2008/05/21 14:33:59  lulin
// - <K>: 90450132.
//
// Revision 1.132  2008/05/04 14:57:44  lulin
// - �� ������� �������� ������ �� ��������.
//
// Revision 1.131  2008/04/16 12:17:39  lulin
// - �������� ����� ��� ������� �������� ������� � ������ ����������.
//
// Revision 1.130  2008/04/02 14:51:07  lulin
// - ����� ��� ��������� �������� � ����������.
//
// Revision 1.129  2008/04/02 14:22:01  lulin
// - cleanup.
//
// Revision 1.128  2008/03/31 05:21:35  lulin
// - cleanup.
//
// Revision 1.127  2007/12/07 07:42:33  lulin
// - ���������, ������������ ������ ������� �����, ���������� � ���������� ����.
//
// Revision 1.126  2007/12/05 18:15:06  lulin
// - ������ �������� ���.
//
// Revision 1.125  2007/12/04 12:47:00  lulin
// - ������������� ����� � HEAD.
//
// Revision 1.121.2.22  2007/09/25 15:20:33  lulin
// - cleanup.
//
// Revision 1.121.2.21  2007/09/05 11:57:46  lulin
// - ������� ����������� ���������� ��������� ��������� � ���������� ���������� �����.
//
// Revision 1.121.2.20  2007/08/30 13:20:53  lulin
// - cleanup.
//
// Revision 1.121.2.19  2007/08/30 10:09:19  lulin
// - ������� �������� ������� ������.
//
// Revision 1.121.2.18  2007/08/28 17:29:46  lulin
// - ��������� ���������� "�������" ����������.
//
// Revision 1.121.2.17  2007/08/28 17:07:05  lulin
// - ������������ �������� �����.
//
// Revision 1.121.2.16  2006/12/18 09:40:24  lulin
// - cleanup.
//
// Revision 1.121.2.15  2006/12/15 13:48:46  lulin
// - cleanup.
//
// Revision 1.121.2.14  2006/11/03 11:00:04  lulin
// - ��������� � ������ 6.4.
//
// Revision 1.121.2.13.8.2  2006/10/24 12:45:09  lulin
// - ��� ��������� ���������� ������� �����, � �� �����.
//
// Revision 1.121.2.13.8.1  2006/10/20 09:59:35  lulin
// - cleanup.
//
// Revision 1.121.2.13  2006/06/23 14:36:21  lulin
// - ��� �������� ��������� ����������� ������ (CQ OIT5-21105).
//
// Revision 1.121.2.12  2006/06/02 12:45:53  lulin
// - cleanup.
//
// Revision 1.121.2.11  2006/05/05 08:33:38  lulin
// - cleanup: ������� "������" ���������� ���������.
//
// Revision 1.121.2.10  2006/02/08 17:11:07  lulin
// - ���� ����������� ������� ������� Archi � ��������� �� �����.
//
// Revision 1.121.2.9  2005/08/30 12:40:06  lulin
// - cleanup: ������� �������� ����������, ��������� � ����������� ��������������.
//
// Revision 1.121.2.8  2005/07/21 13:00:34  lulin
// - �������� ������� EVD �������� � ����� EVD.
//
// Revision 1.121.2.7  2005/07/11 14:23:33  mmorozov
// new: ������������� ��������� ���������� "_evMakeTableOfContents";
//
// Revision 1.121.2.6  2005/06/23 10:26:05  lulin
// - ��������� ����� ������.
//
// Revision 1.121.2.5  2005/06/22 17:14:51  lulin
// - cleanup.
//
// Revision 1.121.2.4  2005/06/11 11:13:19  lulin
// - ��������� �� ������������� "����������" �����������.
//
// Revision 1.121.2.3  2005/05/26 16:29:54  lulin
// - ���������, ������������� ����� ������ ���������� � ���������� L3.
//
// Revision 1.121.2.2  2005/05/24 14:50:01  lulin
// - ������� ������ evGraph � �������� � L3.
//
// Revision 1.121.2.1  2005/05/18 12:42:46  lulin
// - ����� ����� �����.
//
// Revision 1.113.2.8  2005/05/18 12:32:08  lulin
// - ��������� ��� ��������� ����� � HEAD.
//
// Revision 1.113.2.7  2005/04/28 09:18:28  lulin
// - ��������� � ������ B_Tag_Box.
//
// Revision 1.113.2.6  2005/04/19 12:51:37  lulin
// - ������� ��� ������������.
//
// Revision 1.113.2.5  2005/04/19 11:56:41  lulin
// - ������� ��� ������������.
//
// Revision 1.113.2.4  2005/04/10 11:27:35  lulin
// - �������� evNeedFilterContents ��� �����.
//
// Revision 1.113.2.3  2005/04/09 12:19:37  lulin
// - ��� �������� �������� ��������� _evFormatOnDraw (� �����).
//
// Revision 1.113.2.2  2005/04/08 18:59:59  lulin
// - new behavior: ��� ����������������� ������� ���������� �������� ���������� �� ������������������� ��� ������ ��������� �� ���� �������� ����������.
//
// Revision 1.113.2.1  2005/04/08 18:10:36  lulin
// - ������ ����������� � ����������� �������������� ����� ���������. �� ����������, �� ������������ ������ ����.
//
// Revision 1.115.2.2  2005/04/26 16:05:43  lulin
// - ��� �������� ������� ������� ��� ��������������.
//
// Revision 1.115.2.1  2005/04/25 09:03:33  lulin
// - ��������� � HEAD.
//
// Revision 1.117  2005/04/22 12:52:42  vaso
//
// Revision 1.115  2005/04/19 10:19:35  lulin
// - ��� �������� ���������� ��� Define _nsTest ��������� "����������" ��������� ����������.
//
// Revision 1.114  2005/04/15 08:59:52  lulin
// - ������ ������ ������ �� ���, � �� ���������� ���.
//
// Revision 1.121  2005/05/17 13:55:16  lulin
// - new define: _nsTool.
//
// Revision 1.120  2005/05/13 13:49:57  lulin
// - new behavior: ����������� ����������������� ��������� ��� ��������� - � ���������� ����� ���������� ��������� ����� ������ (CQ OIT5-13427).
//
// Revision 1.119  2005/05/12 09:44:26  lulin
// - �������� ��� �������������� - �.�. �� ������-�� �������� � ��� ����������.
//
// Revision 1.118  2005/04/28 15:03:37  lulin
// - ��������� ����� B_Tag_Box � HEAD.
//
// Revision 1.117  2005/04/22 12:52:42  vaso
//
// Revision 1.115.2.2  2005/04/26 16:05:43  lulin
// - ��� �������� ������� ������� ��� ��������������.
//
// Revision 1.115.2.1  2005/04/25 09:03:33  lulin
// - ��������� � HEAD.
//
// Revision 1.117  2005/04/22 12:52:42  vaso
//
// Revision 1.115  2005/04/19 10:19:35  lulin
// - ��� �������� ���������� ��� Define _nsTest ��������� "����������" ��������� ����������.
//
// Revision 1.114  2005/04/15 08:59:52  lulin
// - ������ ������ ������ �� ���, � �� ���������� ���.
//
// Revision 1.113  2005/04/07 14:32:48  lulin
// - remove proc: evGetTopPara.
//
// Revision 1.112  2005/04/07 11:37:54  lulin
// - new define: _evFormatOnDraw.
//
// Revision 1.111  2005/04/07 10:27:45  lulin
// - ������ ������������ �������� �� ������������� ����������� ��������� ��� ����� ������.
//
// Revision 1.110  2005/03/29 18:44:20  lulin
// - ������ ��� ��������� ��������� _evNeedPreAddParas �� ��� �����������.
//
// Revision 1.109  2005/03/16 08:35:46  lulin
// - ��������� ������ �������������� �� ���� - �.�. ��� ��������� �� ��������, � ������ (���������) ��������.
//
// Revision 1.108  2005/02/25 09:18:33  dinishev
// ��������� ��������� ����������� ��������, ����� �� � ���� �� ��������� ��������.
//
// Revision 1.107  2005/02/25 07:10:10  dinishev
// no message
//
// Revision 1.106  2005/02/18 19:10:55  lulin
// - ��������� ������� ��������� � �����.
//
// Revision 1.105  2005/02/18 13:06:20  lulin
// - Painter'� ��������� �� _Ik2Tag.
//
// Revision 1.104  2005/01/28 14:46:13  lulin
// - new behavior: ��� �������� ��-����������� ����� �������������� ��������� �� ����.
//
// Revision 1.103  2005/01/27 16:45:27  lulin
// - optimization: ������ ��������������� �������� �� ���� ����� ������� ��������� ������.
//
// Revision 1.102  2004/12/23 07:56:41  lulin
// - new define: evCommentParaHasPlus (������ ��������).
//
// Revision 1.101  2004/12/10 12:41:02  lulin
// - ������� ����������� ���������� Print-_preview ��� ������ �� ��������� ����.
//
// Revision 1.100  2004/11/30 13:31:07  mmorozov
// change: �������� ��������� l3NeedTabbedText;
//
// Revision 1.99  2004/11/26 15:06:10  lulin
// - bug fix: �������� �� Clipboard'� �� �������������� � �����������.
//
// Revision 1.98  2004/11/16 10:50:43  lulin
// - new behavior: ��� �������� �������� ����������� �������������� ����� ����� ������, ��� ������ ����.
//
// Revision 1.97  2004/11/12 12:37:11  lulin
// - ������� ����� TevDocumentContainer._InsertSubIntoContents.
//
// Revision 1.96  2004/11/04 15:22:04  lulin
// - bug fix: �� ��������������� ���������� Print Engine.
//
// Revision 1.95  2004/11/03 14:21:09  lulin
// - ����������� ������ Il3Bitmap.Assign � _AssignTo.
//
// Revision 1.94  2004/11/02 13:34:16  lulin
// - new define: evGetFormattingFromCache (���� ��� ���� ��������).
//
// Revision 1.93  2004/11/02 12:42:10  lulin
// - �� ��������� ������� ��������� ���� Formula.
//
// Revision 1.92  2004/09/20 14:22:26  lulin
// - ��� �������� �� ��������� ����������, ��������� ����� � ������ ContentLevel (����� �������� �� ��������� � 2.5 ��� �� 2.0 ���).
//
// Revision 1.91  2004/09/16 09:24:59  lulin
// - bug fix: ���������� �� evCtrl ��������� � DesignTime ������������ �������.
//
// Revision 1.90  2004/08/03 07:52:35  voba
// - add ARCHI define
//
// Revision 1.89  2004/08/02 09:36:59  law
// - bug fix: �� �������� "������" ��� ������� ������������, ��������� � ����� ������ �� ����� �� ������ (CQ OIT5-8343).
//
// Revision 1.88  2004/07/29 14:27:48  law
// - �������� �������� define evCanReleaseBitmapStream - �.�. ������ � ��� �� �������� �������/����� � ����� ������.
//
// Revision 1.87  2004/07/29 11:30:40  law
// - new define: evRenderDirectly.
//
// Revision 1.86  2004/07/29 10:43:25  law
// - ������� ����������� ����� ��������� ����� � ���������.
//
// Revision 1.85  2004/07/29 09:35:52  law
// - �� ������ ������ (�����) ����� ������������ �������� � ������.
//
// Revision 1.84  2004/07/26 14:19:21  law
// - new behavior: ��� ��������� �������� ���������� ������� �� ImageEn.
//
// Revision 1.83  2004/07/21 07:37:58  law
// - new behavior: ��� �������� ����� ��������� ��������� ��������� ����������� ������ (CQ OIT5-5826).
//
// Revision 1.82  2004/07/15 09:38:36  law
// - new behavior: ��������� ��� �������� ������ ����� �������� � �������� (��� �������� �� �������������� ������������).
//
// Revision 1.81  2004/07/06 12:46:21  law
// - new behavior: ��� �������� ��������� ��������� evNeedMarkers.
//
// Revision 1.80  2004/07/06 12:08:02  law
// - new behavior: ��� �������� �������� ���� ���������� � ����� � ������.
//
// Revision 1.79  2004/06/10 09:32:09  law
// - bug fix: ����������� ������������ ��������� � �������� ���� � ����������������� ���������.
//
// Revision 1.78  2004/06/01 08:04:05  law
// - ����������� define'� ��� _ALCU.
//
// Revision 1.77  2004/05/31 10:42:22  law
// - ��� ���������� ��������� l3BoxedBitArray ��������� ��������� evNeedAddMask (�������� evNotNeedAddMask).
//
// Revision 1.76  2004/05/31 10:14:52  law
// - define ��������� � ���������� ����� (evDefine.inc).
//
// Revision 1.75  2004/05/24 13:00:10  law
// - ������� ����� � ������������� ��� ��������.
//
// Revision 1.74  2004/04/28 13:55:36  law
// - new define: evChangeTableByMouse - �������� ��� ��������.
//
// Revision 1.73  2004/03/26 14:41:39  law
// - new behavior: ��� �������� ���������� ID ����� ������, ���� ��� �� ����.
//
// Revision 1.72  2004/03/25 16:58:23  law
// - new define: evChangeSegmentByMouse - �������� ��� ��������.
//
// Revision 1.71  2004/03/25 16:15:19  law
// - new define: _evSearchToolIsComponent - �������� ��� ��������.
//
// Revision 1.70  2004/03/25 14:16:19  law
// - new behavior: ��� �������� ���������� ����� ���������� ���������.
//
// Revision 1.69  2004/03/03 14:07:13  nikitin75
// + ��������� OvcController;
//
// Revision 1.68  2004/01/15 15:59:10  law
// - new define: evRealPaint. ������� ��� ��� _Nemesis. ������ �������� ������ CQ OIT5-5860, �� ����� �������������� ��������� ������ � ��������� (� ���� �� ��������������).
//
// Revision 1.67  2003/12/27 18:29:35  law
// - new directive: l3NeedTabbedText - ��� �������� ���������, �.�. ��� �� ���� �� ������ ��������� � ����������.
//
// Revision 1.66  2003/10/09 11:38:33  law
// - ������ �������� ��� ��������� ������� ������ ������������ �������.
//
// Revision 1.65  2003/07/24 13:33:28  law
// - ��� �������� (�������) ������� ����������� ��������� � ������.
//
// Revision 1.64  2003/07/08 18:05:17  law
// - change: ������� �������������� ��� _Nemesis ��������.
//
// Revision 1.63  2003/07/07 13:01:41  law
// - change: ������� �������������� ��� _Nemesis �������� ���������, ��� ��� �� �� ����� ��������.
//
// Revision 1.62  2003/07/04 19:39:45  law
// - ����������� ������������������ ������ � ������� ������ (�� ����� �� ��������, �� ������� ����� ����).
//
// Revision 1.61  2003/04/29 16:08:20  law
// - bug fix: �������� �������� ��������� ��� ������ - �������� ������������� �����.
//
// Revision 1.60  2003/04/23 13:11:12  narry
// - change: ��� ������ ���������� AllArchiComponents
//
// Revision 1.59  2003/04/19 12:48:16  law
// - new directive: _evForEEGen.
//
// Revision 1.58  2003/04/19 12:30:39  law
// - new file: ddDefine.inc.
//
// Revision 1.57  2003/04/19 12:10:16  law
// no message
//
// Revision 1.56  2003/04/19 11:24:47  law
// - new file: vtDefine.inc.
//
// Revision 1.55  2003/03/19 10:47:33  law
// - new directives: evForEE, _evNeedDisp, _evNotNeedDisp.
//
// Revision 1.54  2003/02/18 14:31:40  law
// - new methods: IeeNode.Remove, IeeNode.RemoveChildren (��� ������ �� ������� 6 ������� �������� ����� �� ������ �123).
//
// Revision 1.53  2003/02/14 13:40:15  law
// - bug fix: ��������� ClipboardSpy ��� ������ �� ������ 6 (ee.dll) (�117).
//
// Revision 1.52  2003/01/09 14:18:18  law
// - new directive: evSmartTablePaste.
// - new behavior: ����� �� ����� ���������������� ������� ������ ������ ������.
//
// Revision 1.51  2002/12/26 17:13:54  law
// - optimiztion: � ������ evOnlyForPrinting ��������� ��������� evUseOleClipboard.
//
// Revision 1.50  2002/12/26 16:42:42  law
// - new directive: evNeedDefaultEvdReader, evNeedDefaultEvdWriter.
//
// Revision 1.49  2002/12/26 16:03:15  law
// - new directive: evNeedEditableCursors.
//
// Revision 1.48  2002/12/26 15:46:35  law
// - new directive: evNeedMarkers.
//
// Revision 1.47  2002/12/26 15:11:32  law
// - new dll: ������� ����� ������ ������ dll-������.
//
// Revision 1.46  2002/12/26 14:35:23  law
// - new dll: ������� ����� ������ ������ dll-������.
//
// Revision 1.45  2002/12/26 14:19:40  law
// - new dll: ������� ����� ������ ������ dll-������.
//
// Revision 1.44  2002/10/02 11:32:59  law
// - new interface: IeeFormats.
//
// Revision 1.43  2002/09/17 13:03:03  law
// - new standard action: ev_ccWebStyle.
//
// Revision 1.42  2002/08/26 13:05:16  law
// - new directive: evNotUseWindowsWindowOrg.
//
// Revision 1.41  2002/08/02 08:32:13  law
// no message
//
// Revision 1.40  2002/07/31 08:54:47  law
//
// Revision 1.39  2002/07/25 17:18:46  law
// - new directive: l3UseWindowsWindowOrg.
//
// Revision 1.38  2002/07/25 11:21:41  law
// - change: ��������� � ������ SubAttrNode.
//
// Revision 1.37.2.1  2002/07/23 14:47:18  law
// - new behavior: �������� �������� �������������� ������� ����������.
//
// Revision 1.37  2002/07/23 12:12:48  law
// - new directive: _evAutoInsertSubNodes.
//
// Revision 1.36  2002/07/08 15:15:08  law
// no message
//
// Revision 1.35  2002/07/08 15:12:21  law
// - new directive: _evAutoInsertContents.
//
// Revision 1.34  2002/07/08 12:10:21  law
//
// Revision 1.33  2002/07/08 09:46:45  law
// - new directive: evNotNeedNormalWordSearcher.
//
// Revision 1.32  2002/04/18 10:41:45  law
// no message
//
// Revision 1.31  2002/03/18 13:12:51  law
// - new directive: _k2NotForEditor.
//
// Revision 1.30  2002/01/29 12:50:21  law
// - new behavior: �������� ���������� ������.
//
// Revision 1.29  2002/01/24 16:30:24  law
// - new behavior: ������ ������ �� ������� � ��������� ���������.
//
// Revision 1.28  2002/01/08 12:44:11  law
// - new behavior: ������� ���������� ������ � cf_EverestTxt ��� _EverestLite.
//
// Revision 1.27  2002/01/08 12:16:35  law
// - new behavior: ������� ���������� ������� ����������������� ��������� ��� _EverestLite.
//
// Revision 1.26  2002/01/05 11:00:43  law
// - some cosmetics.
//
// Revision 1.25  2002/01/03 14:19:02  law
// - some cosmetics.
//
// Revision 1.24  2001/12/28 15:20:59  law
// no message
//
// Revision 1.23  2001/12/24 13:20:39  law
// - cleanup.
//
// Revision 1.22  2001/12/03 08:39:33  law
// - bug fix: �� ������� ������ �� ����������� �����.
//
// Revision 1.21  2001/11/29 15:46:14  law
// - bug fix: ���������� ������������ ��������� ����������� ����� ������������� ������������� �������. ��������� �����. ���� �� ��������.
//
// Revision 1.20  2001/11/21 16:32:36  law
// - bug fix: ���������� ���������� ������� �� SBS (��. ������ �1387, _TestSet\Table\SBS\1.evd).
//
// Revision 1.19  2001/11/20 14:29:40  law
// - new unit: m3ParaIndexBuilder.
//
// Revision 1.18  2001/11/16 15:23:32  law
// - bug fix: GPF ��� �������� ������ ������� (��. ������ 1344, _TestSet\ComplexTable\7.evd).
//
// Revision 1.17  2001/11/02 15:11:18  law
// - change.
//
// Revision 1.16  2001/10/12 17:51:59  law
// - new behavior: ������ � ������� ������ ����� _OleSetClipboard.
//
// Revision 1.15  2001/07/03 09:09:18  law
// - new behavior: �������� ������: "������� ������� ������ � ������ ������ � ������" (�539).
//
// Revision 1.14  2001/04/04 17:03:05  law
// - new behavior: ������ ������ ��� ���������� ����� ��������� ���������� IDropTarget.
//
// Revision 1.13  2000/12/15 15:10:34  law
// - ��������� ��������� Log.
//

{$Include evdDefine.inc}

{$IfDef l3UseOleClipboard}
 {$Define evUseOleClipboard}
{$EndIf l3UseOleClipboard}

{.$Define evUseIStorage}

{$IfDef EverestRelease}
 {$Undef evUseIStorage}
{$EndIf EverestRelease}

{$IfDef EverestLite}
 {$Undef evUseIStorage}
{$EndIf EverestLite}

{$IfDef l3Requires_m0}
 {.$Define evSpellChecker}
 {$Define evNeedNormalWordSearcher}
{$EndIf l3Requires_m0}

{$IfDef evMyEditor}
 {$Undef  evNeedNormalWordSearcher}
 {$Undef  evUseIStorage}
 {$Define evExternalProduct}
 {$Define evRunTime}
 {$Define evNotArchi}
 {$Define EverestRelease}
 {$Define vtStandardOpenChip}
{$EndIf evMyEditor}

{$IfDef evNotNeedNormalWordSearcher}
 {$Undef  evNeedNormalWordSearcher}
{$EndIf evNotNeedNormalWordSearcher}

{$IfDef evNotUseIStorage}
 {$Undef  evUseIStorage}
{$EndIf evNotUseIStorage}

{$IfDef evUseIStorage}
 {.$Define evUseIndexBuilder}
{$EndIf evUseIStorage}

{$IfDef EverestRelease}
 {$Undef evUseIndexBuilder}
{$EndIf EverestRelease}

{$IfDef evMyEditor}
 {$Undef evUseIndexBuilder}
{$EndIf evMyEditor}

{$IfDef EverestLite}
 {$Undef evUseIndexBuilder}
{$EndIf EverestLite}

{$IfDef evNotUseIndexBuilder}
 {$Undef evUseIndexBuilder}
{$EndIf evNotUseIndexBuilder}

{$IfDef Delphi3}
 {$Define evUseDeadCursor}
{$EndIf Delphi3}

{$Define evNeedPainters}
{$Define evUseVisibleCursors}
{$Define evNeedEditableCursors}
{$Define evNeedDefaultEvdReader}
{$Define evNeedDefaultEvdWriter}
{$Define evNeedHotSpot}
{$Define evNeedMarkers}
{$Define evNeedFormatters}
{$Define evNeedClipboardSpy}
{$Define evNeedDisp}
{$Define evSearchToolIsComponent}
{$Define evChangeSegmentByMouse}
{$Define evChangeTableByMouse}

{$If Defined(nsTest) AND not Defined(InsiderTest)}
 {$Undef evUseIStorage}
{$IfEnd}

{$IfDef nsTool}
 {$Undef evUseIStorage}
{$EndIf nsTool}

{$If Defined(evForEE) OR Defined(Nemesis)}
 {$Undef  evUseIndexBuilder}
 {$Undef  evUseIStorage}
 {$If not Defined(nsTest) OR Defined(InsiderTest)}
  {$Undef  evNeedNormalWordSearcher}
 {$IfEnd}

 {$Define evNotArchi}
 {$IfNDef DesignTimeLibrary}
  {$Define evRunTime}
  {$If not Defined(nsTest) OR Defined(InsiderTest)}
   {$Define evExternalProduct}
  {$IfEnd}
 {$EndIf  DesignTimeLibrary}
 {$Define NotNeedGarDoc}
 {$Define evNotNeedDisp}
 {$Define evNotNeedClipboardSpy}
 {$Define vtStandardOpenChip}

 {$IfNDef Nemesis}
  {$Define evNotNeedScrollToBlockFrame}
  {$Undef evNeedMarkers}
  {$Undef evNeedGetBlockFont}
 {$EndIf  Nemesis}
 
 {$IfDef Nemesis}
  {$Undef evSearchToolIsComponent}
  {$Undef evChangeSegmentByMouse}
  {.$Undef evChangeTableByMouse}
  {$Define evMakeHyperlinkID}
  {$Define evNeedPreAddParas}
  {$Define evSmartHyperlinkCont}
  {$Define evRenderDirectly}
  {$Define evKillMarksFromClipboard}
  {.$Undef evNeedMarkers}
 {$EndIf Nemesis}
 {$Undef evNeedGetBlockStyle}
{$IfEnd evForEE}

{$If Defined(nsTest) AND not Defined(InsiderTest)}
 {$Undef  evUseIndexBuilder}
 {$Undef  evUseIStorage}
{$IfEnd}

{$IfDef ARM}
  {$Undef evMakeHyperlinkID}
  {$Undef evNeedPreAddParas}
  {$Undef evSmartHyperlinkCont}
{$EndIf ARM}

{$IfDef DesignTimeLibrary}
 {$Undef evNeedGetBlockFont}
 {$Undef evNeedGetBlockStyle}
{$EndIf DesignTimeLibrary}

{$If Defined(l3ConsoleApp) OR Defined(k2NotForEditor)}
 {$Undef evNeedFormatters}
 {$Undef evNeedHotSpot}
 {$Undef evNeedMarkers}
 {$Undef evNeedEditableCursors}
 {$Undef evNeedPainters}
 {$Undef evUseVisibleCursors}
 {$Undef evUseDeadCursor}
 {$Undef evNeedDeltaP}
 {$Undef evNeedClipboardSpy}
 {$Undef evNeedDisp}
{$IfEnd}

{$IfDef k2ForEditor}
 {$IfNDef evUseVisibleCursors}
  !!! - ���������� ������������� ��� �������� 
 {$EndIf  evUseVisibleCursors}
{$EndIf k2ForEditor}

{$Define evNeedGetBlockFont}
{$Define evNeedGetBlockStyle}

{$IfDef evOnlyForPrinting}
 {$Undef evNeedHotSpot}
 {$Undef evNeedMarkers}
 {$Undef evNeedEditableCursors}
 {$Undef evUseDeadCursor}
 {$Undef k2NeedPropertySpy}
 {$Undef evNeedDefaultEvdReader}
 {$Undef evNeedDefaultEvdWriter}
 {$Undef evUseOleClipboard}
 {$Undef evUseIStorage}
 {$Undef evUseIndexBuilder}
 {$Undef evNeedClipboardSpy}
 {$Undef evNeedDisp}
 {$Undef evNeedGetBlockFont}
 {$Undef evNeedGetBlockStyle}
{$EndIf evOnlyForPrinting}

{$Define evSmartTablePaste}
{$Define evNeedScrollToBlockFrame}

{$IfDef evNotNeedClipboardSpy}
 {$Undef evNeedClipboardSpy}
{$EndIf evNotNeedClipboardSpy}

{$IfDef evNotNeedScrollToBlockFrame}
 {$Undef evNeedScrollToBlockFrame}
{$EndIf evNotNeedScrollToBlockFrame}

{$IfDef evNotNeedDisp}
 {$Undef evNeedDisp}
{$EndIf evNotNeedDisp}

{$IfDef DesignTimeLibrary}
 {$Define NotNeedGarDoc}
{$EndIf DesignTimeLibrary}

{$IfNDef evNotNeedOvc}
 {$Define evNeedOvc}
{$EndIf  evNotNeedOvc}

{.$Define evCommentParaHasPlus}
{$IfNDef Nemesis}
  {$Define evNeedCollapseBlocks}
{$EndIf  Nemesis}

{$IfDef Archi}
 {$Undef evNeedClipboardSpy}
 {.$I ArchiDefine.inc}
{$Else  Archi}
 {$Define evNeedPreAddParas}
 {$IfDef ItsLAW}
  {$Define evNeedPreAddParas}
 {$EndIf ItsLAW}
{$EndIf Archi}

//{$IfNDef DesignTimeLibrary}
//{$IfNDef Nemesis}
//{$IfNDef Archi}
// {$Define ScriptsSupport} 
//{$EndIf Archi} 
//{$EndIf Nemesis}
//{$EndIf DesignTimeLibrary} 

{$IfDef Nemesis}
 {$DEFINE evSingleHyperlinkClick}
{$EndIf Nemesis}

{$Define evStoreSubsIndex} // - ���������� ������ �����

{$IfDef UseProjectDefine}
 {$I ProjectDefine.inc}
{$EndIf UseProjectDefine}

{$IfNDef vcmDefine}
 {$IfNDef NoVCM}
  {$Include vcmDefine.inc}
 {$EndIf  NoVCM} 
{$EndIf  vcmDefine}

{.$Define evCollapseAllVersionComments} 
// http://mdp.garant.ru/pages/viewpage.action?pageId=254354849
// http://mdp.garant.ru/pages/viewpage.action?pageId=228688745

{.$Define evReqGroupNeedsRadio} 

{$EndIf evDefine}
