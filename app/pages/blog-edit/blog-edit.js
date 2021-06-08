// pages/blog-edit/blog-edit.js
var util = require('../../utils/util.js');
let content = ""
Page({

  /**
   * 页面的初始数据
   */
  data: {

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function () {
    const eventChannel = this.getOpenerEventChannel()
    eventChannel.on('movieid', (res) => {
      this.setData({
        movieid: res.movieid
      })
    })
  },
  submit() {
    wx.showLoading({
      title: '发布中',
      mask: true
    });
    var time = util.formatTime(new Date());
    var userid = wx.getStorageSync('id');
    this.setData({
      time: time
    });
    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/indexmessage',
      data: {
        userid: userid,
        movieid: this.data.movieid,
        datas: JSON.stringify({
          content: content,
          time: time,
        })
      },
      success: function (res) {
        wx.showToast({
          title: '发布成功',
        })
      }
    })
    wx.navigateBack()
    //返回也页面
    let page = getCurrentPages()
    //获取所有的页面
    let prepage = page[page.length - 2]
    //获取上一级页面
    prepage.onPullDownRefresh()
    //调用上一级页面的刷新方法
  },
  finput(e) {
    content = e.detail.value
  },

})