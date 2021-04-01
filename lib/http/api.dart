class Api {
  static const String BASE_URL = "http://api.pingcc.cn/";
  static const String GET_NOVEL = "fiction/search/title/"; //小说搜索    全职高手/1/10
  static const String GET_NOVEL_CHAPTER = "fictionChapter/search/"; //获取章节
  static const String GET_CHAPTER_CONTENT = "fictionContent/search/"; //获取章节

  static const String GET_CARTOON = "cartoon/search/title/"; //漫画搜索
  static const String GET_CARTOON_CHAPTER = "cartoonChapter/search/"; //漫画列表
  static const String GET_CARTOON_CONTENT = "cartoonContent/search/"; //漫画内容

  static const String GET_VIDEO = "video/search/title/"; //视频搜索
  static const String GET_VIDEO_CHAPTER = "videoChapter/search/"; //视频章节
}
