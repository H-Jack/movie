var event = require('../../utils/event')
var util = require('../../utils/util')
var threedays = util.getWeek(3)
Page({
  data: {
    activeindex: 2,
    shop: {},
    imgUrl: '',
    activemovie: {},
    threedays: threedays,
    theday: 0,
    jiaz:0
  },
  onLoad: function (options) {
    const eventChannel = this.getOpenerEventChannel()
    eventChannel.on('administratorsid', (res) => {
      this.setData({
        administratorsid: res.data.administratorsid,
        cinemaname: res.data.cinemaname,
        cinemaaddress: res.data.cinemaaddress
      })
    })

    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/indexallmovie',
      data: {
        administratorsid: this.data.administratorsid,
      },
      success: (res) => {
        let moviesinginlist = res.data.data[1];
        moviesinginlist.forEach((item) => {
          item.start = item.time.substring(0, 5); //要截取时间的字符串
        })
        moviesinginlist.forEach((item) => {
          item.end = item.time.substring(6, 11); //要截取时间的字符串
        })
        var todaysingin = [];
        for (var a = 0; a < moviesinginlist.length; a++) {
          if (moviesinginlist[a].status == 0) {
            todaysingin.push(moviesinginlist[a]);
          }
        }
        this.setData({
          allmovie: res.data.data[0],
          imgUrl: res.data.data[0][2][0].logo,
          activemovie: res.data.data[0][2],
          moviesingin: res.data.data[1],
          todaysingin: todaysingin,
        })
      }
    })
  },


  onShow: function () {

  },


  openMap: function () {
    var that = this
    wx.openLocation({
      latitude: 31, // 纬度，范围为-90~90，负数表示南纬
      longitude: 14, // 经度，范围为-180~180，负数表示西经
      scale: 28, // 缩放比例
      // name: '我家', // 位置名
      // address: '洼的地方', // 地址的详细说明
      success: function (res) {
        // success
      },
      fail: function () {
        // fail
      },
      complete: function () {
        // complete
      }
    })
  },
  tapselect: function (e) {
    var that = this
    var activeindex = Number(e.currentTarget.id)
    this.setData({
      theday: 0,
      imgUrl: that.data.allmovie[activeindex][0].logo,
      activeindex: activeindex,
      activemovie: that.data.allmovie[activeindex],
      jiaz:11,
      moviesingin: '',
          todaysingin: ''
    })
    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/indexallsingin',
      data: {
        administratorsid: this.data.administratorsid,
        movieid: this.data.activemovie[0].id
      },
      success: (res) => {
        let moviesinginlist = res.data.data;
        moviesinginlist.forEach((item) => {
          item.start = item.time.substring(0, 5); //要截取时间的字符串
        })
        moviesinginlist.forEach((item) => {
          item.end = item.time.substring(6, 11); //要截取时间的字符串
        })
        var todaysingin = [];
        for (var a = 0; a < moviesinginlist.length; a++) {
          if (moviesinginlist[a].status == 0) {
            todaysingin.push(moviesinginlist[a]);
          }
        }
        this.setData({
          moviesingin: moviesinginlist,
          todaysingin: todaysingin,
          jiaz:0
        })
      }
    })
  },
  selectDate: function (e) {
    var moviesinginlist = this.data.moviesingin;
    var todaysingin = [];
    for (var a = 0; a < moviesinginlist.length; a++) {
      if (moviesinginlist[a].status == e.currentTarget.id) {
        todaysingin.push(moviesinginlist[a]);
      }
    }
    var theday = e.currentTarget.id
    this.setData({
      theday: theday,
      todaysingin: todaysingin
    })
  },


  seat:function(e){
    let that = this;
    wx.navigateTo({
      url: './seat/seat',
      success: (res) => {
        // 通过eventChannel向被打开页面传送数据
        res.eventChannel.emit('list', {
          movie: that.data.activemovie[0],
          cinemaname: that.data.cinemaname,
          cinemaaddress: that.data.cinemaaddress,
          todaysingin: that.data.todaysingin[e.currentTarget.dataset.index],
          week:that.data.threedays[that.data.theday]
        })
      }
    })
  }
})