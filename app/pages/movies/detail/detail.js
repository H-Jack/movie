Page({
  data: {
    des: {},
    flexed: false
  },
  onLoad: function (param) {
    var token = wx.getStorageSync('key');
    if (token) {
      
    }else{
      wx.reLaunch({
        url: '../../login/login',
      })
    }

    const eventChannel = this.getOpenerEventChannel()
    eventChannel.on('detail', (res) => {
      this.setData({
        detail: res.data
      })
    })
    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/indexmovieactor',
      data:{
        movieid:this.data.detail.id
      },
      success: (res) => {
        this.setData({
          movieactor: res.data.data[0],
          message:res.data.data[1]
        })
      }
    })
  },
  flex: function () {
    var that = this
    this.setData({
      flexed: !that.data.flexed
    })
  },

  blogedit: function(){
    wx.navigateTo({
      url: '../../blog-edit/blog-edit',
      success: (res) => {
        // 通过eventChannel向被打开页面传送数据
        res.eventChannel.emit('movieid', {
          movieid: this.data.detail.id
        })
      }
    })
  },

  nearmovie:function(){
    wx.navigateTo({
      url: '../../shop/nearseat/nearseat',
    })
  },

  onPullDownRefresh: function () {
    this.onLoad();
  },

})