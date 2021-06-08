var app = getApp()
var event = require('../../utils/event')
Page({
  data: {
    swiperImg: [
      "../../img/1.png",
      "../../img/2.png",
      "../../img/3.png",
    ],
    head: {
      currentCity: '',
      placestr: '找影院、找电影'
    },

    indexData: {},
    allmovie: [],
    counts: 10,
    start: 0,
    option1: [{
        text: '全部电影',
        value: 0
      },
      {
        text: '喜剧',
        value: 1
      },
      {
        text: '动画',
        value: 2
      },
      {
        text: '剧情',
        value: 3
      },
      {
        text: '恐怖',
        value: 4
      },
      {
        text: '惊悚',
        value: 5
      },
      {
        text: '科幻',
        value: 6
      },
      {
        text: '动作',
        value: 7
      },
      {
        text: '悬疑',
        value: 8
      },
      {
        text: '犯罪',
        value: 9
      },
      {
        text: '冒险',
        value: 10
      },
    ],
    value1: 0

  },
  onLoad: function () {
    var that = this;
    this.setData({
      'head.currentCity': app.globalData.currentCity
    })

  },
  onShow: function () {
    var that = this
    app.getpol(function (currentCity) {
      that.setData({
        'head.currentCity': currentCity
      })
    })
    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/indexmovie',
      success: (res) => {
        this.setData({
          indexData: res.data.data,
          allmovie: res.data.data,
          nearmovie: res.data.nearmovie
        })
      }
    })
  },

  buy: function () {
    wx.navigateTo({
      url: '../theaterList/theaterList'
    })
  },


  /**电影详情 */
  detail: function (e) {
    wx.navigateTo({
      url: '../movies/detail/detail',
      success: (res) => {
        // 通过eventChannel向被打开页面传送数据
        res.eventChannel.emit('detail', {
          data: this.data.indexData[e.currentTarget.dataset.index]
        })
      }
    })
  },


  /**预售电影详情 */
  detaill: function (e) {
    wx.navigateTo({
      url: '../movies/detail/detail',
      success: (res) => {
        // 通过eventChannel向被打开页面传送数据
        res.eventChannel.emit('detail', {
          data: this.data.nearmovie[e.currentTarget.dataset.index]
        })
      }
    })
  },

  onChange2: function (e) {
    var that = this;
    if (e.detail == 0) {
      this.setData({
        indexData: that.data.allmovie,
      })
    } else {
      wx.request({
        url: 'http://movie.vaiwan.com/index.php/api/v1/indexclassification',
        data: {
          searchvalue: that.data.option1[e.detail].text
        },
        success: (res) => {
          this.setData({
            indexData: res.data.movie,
          })
        }
      })
    }
  }

})