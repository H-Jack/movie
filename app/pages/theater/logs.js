var event = require('../../utils/event')
var app = getApp()

Page({
  data: {
    head: {
      currentCity: '',
      placestr: '找影院、找电影'
    },
    theater: []
  },
  onLoad: function () {
    var that = this;
    this.setData({
      'head.currentCity': app.globalData.currentCity
    })
    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/indexaddress',
      success: function (res) {
        that.setData({
          theater: res.data.data
        })
      }
    })

  },

  onShow: function () {
    var that = this;
    this.setData({
      'head.currentCity': app.globalData.currentCity
    })
    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/indexaddress',
      success: function (res) {
        that.setData({
          theater: res.data.data
        })
      }
    })
  },

  shop: function (e) {
    wx.navigateTo({
      url: '../shop/shop',
      success: (res) => {
        //   通过eventChannel向被打开页面传送数据
        res.eventChannel.emit('administratorsid', {
          data: {
            administratorsid: e.currentTarget.id,
            cinemaname: this.data.theater[e.currentTarget.dataset.index].cinemaname,
            cinemaaddress: this.data.theater[e.currentTarget.dataset.index].cinemaaddress
          }
        })
      }
    })
  }

})