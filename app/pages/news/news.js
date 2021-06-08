// pages/news/news.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    newslist : ''
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/information',
      success: function(res) {
        that.setData({
          newslist : res.data.information
        })
      },
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    var that = this;
    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/information',
      success: function(res) {
        that.setData({
          newslist : res.data.information
        })
      },
    })
  },

  newslist(e){
    wx.navigateTo({
      url: '../newslist/newslist',
      success: (res) => {
        // 通过eventChannel向被打开页面传送数据
        res.eventChannel.emit('newslist', {
          data: this.data.newslist[e.currentTarget.dataset.index]
        })
      }
    })
  }
})