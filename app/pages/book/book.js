Page({
  data: {},
  onLoad: function (options) {
    const eventChannel = this.getOpenerEventChannel()
    eventChannel.on('orderint', (res) => {
      this.setData({
        orderint: res.data
      })
    })
  },


  deleteorder: function () {
    var userid = wx.getStorageSync('id');
    var that = this;
    wx.showModal({
      title: '取消订单',
      content: '确认要取消该订单吗？',
      success: function (res) {
        if (res.confirm) {
          wx.request({
            url: 'http://movie.vaiwan.com/index.php/api/v1/deleteorder',
            data: {
              userid,
              orderid: that.data.orderint.id
            },
            success: (res) => {
              wx.reLaunch({
                url: '../order/order',
                success: (res) => {
                  wx.showToast({
                    title: '取消成功',
                    icon: 'success',
                    duration: 1500
                  })
                }
              })
            }
          })
        } else {}
      }
    })
  },



  onReady: function () {
    // 页面渲染完成
  },
  onShow: function () {


  },
  onHide: function () {
    // 页面隐藏
  },
  onUnload: function () {
    // 页面关闭
  }
})