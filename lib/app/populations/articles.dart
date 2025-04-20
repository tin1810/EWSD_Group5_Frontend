import 'dart:typed_data';
import 'package:university_magazine_project/app/model/article_vo.dart';
import 'package:university_magazine_project/app/model/comment_vo.dart';

Uint8List fakeBytes(String label) => Uint8List.fromList(label.codeUnits);

final List<ArticleVO> articles = [
  ArticleVO(
    id: 'a001',
    studentId: 's001',
    facultyId: 'eng001',
    title: 'Sustainable Energy in Modern Cities',
    wordBytes: fakeBytes('Energy Word Content'),
    imgBytes: fakeBytes('Energy Image'),
    comment: CommentVO(
      comment: 'Excellent research and very detailed.',
      coordinatorName: 'Dr. Jane Smith',
    ),
    date: '2025-04-10',
  ),
  ArticleVO(
    id: 'a002',
    studentId: 's002',
    facultyId: 'bus001',
    title: 'Global Market Trends 2025',
    wordBytes: fakeBytes('Market Word Content'),
    imgBytes: fakeBytes('Market Image'),
    comment: CommentVO(
      comment: 'Consider adding more graphs and visuals.',
      coordinatorName: 'Prof. Alan White',
    ),
    date: '2025-04-12',
  ),
  ArticleVO(
    id: 'a003',
    studentId: 's003',
    facultyId: 'art001',
    title: 'The Evolution of Postmodern Literature',
    wordBytes: fakeBytes('Literature Word Content'),
    imgBytes: fakeBytes('Literature Image'),
    comment: CommentVO(
      comment: 'Great perspective on modern texts.',
      coordinatorName: 'Dr. Emily Carter',
    ),
    date: '2025-04-13',
  ),
  ArticleVO(
    id: 'a004',
    studentId: 's004',
    facultyId: 'eng001',
    title: 'AI Integration in Civil Engineering',
    wordBytes: fakeBytes('AI Civil Word Content'),
    imgBytes: fakeBytes('AI Civil Image'),
    comment: CommentVO(
      comment: 'Impressive use of real-world examples.',
      coordinatorName: 'Dr. Brian Kim',
    ),
    date: '2025-04-15',
  ),
  ArticleVO(
    id: 'a005',
    studentId: 's005',
    facultyId: 'bus001',
    title: 'Ethics in Corporate Leadership',
    wordBytes: fakeBytes('Ethics Word Content'),
    imgBytes: fakeBytes('Ethics Image'),
    comment: CommentVO(
      comment: 'Please include more case studies.',
      coordinatorName: 'Prof. Rachel Lee',
    ),
    date: '2025-04-16',
  ),
  ArticleVO(
    id: 'a006',
    studentId: 's006',
    facultyId: 'art001',
    title: 'Visual Storytelling Through Photography',
    wordBytes: fakeBytes('Photography Word Content'),
    imgBytes: fakeBytes('Photography Image'),
    comment: CommentVO(
      comment: 'Stunning visual narrative!',
      coordinatorName: 'Dr. Mark Owen',
    ),
    date: '2025-04-18',
  ),
];
