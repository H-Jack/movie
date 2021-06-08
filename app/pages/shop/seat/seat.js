var seatmap = require('../../../utils/seatmap');
var limt = 0

function formatNumber(n) {
  n = n.toString()
  return n[1] ? n : '0' + n
}
Page({
  data: {
    shop: {},
    map: [],
    seats: [],
    willChange: false,
    hasSelected: false,
    columnArr: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
    map: [
      [0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [0, 0, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 3, 1, 1],
      [0, 0, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1],
      [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1],
    ],
    time: ''
  },
  onLoad: function (options) {
    console.log(typeof this.data.week);

    var token = wx.getStorageSync('key');
    if (token) {

    } else {
      wx.reLaunch({
        url: '../../login/login',
      })
    }
    const eventChannel = this.getOpenerEventChannel()
    eventChannel.on('list', (res) => {
      this.setData({
        movie: res.movie,
        cinemaname: res.cinemaname,
        cinemaaddress: res.cinemaaddress,
        todaysingin: res.todaysingin,
        week: res.week
      })
    })
  },
  onReady: function () {

  },
  onShow: function () {},
  scrollstart: function (ev) {
    this.sX = ev.changedTouches[0].clientX
    this.sY = ev.changedTouches[0].clientY
    this.setData({
      willChange: true
    })
  },
  scrollmove: function (ev) {
    var mX = ev.changedTouches[0].clientX
    var mY = ev.changedTouches[0].clientY
    var deltaX = (mX - this.sX) / 2
    var deltaY = (mY - this.sY) / 2
    this.setData({
      deltaX: deltaX,
      deltaY: deltaY
    })
  },
  scrollend: function (ev) {
    var eX = ev.changedTouches[0].clientX
    var eY = ev.changedTouches[0].clientY
    this.setData({
      willChange: false
    })
  },
  selectSeat: function (ev) {
    var ver = ev.currentTarget.dataset.ver
    var hor = ev.currentTarget.dataset.hor
    var map = this.data.map
    var a = this.data.seats
    var seats = []
    var cStr = ''
    limt++
    if (a.length > 3) {
      wx.showToast({
        title: '最多选4个座位',
        icon: 'success',
        duration: 2000
      })

    } else {
      map[ver][hor] = 2
      for (var i = 0; i < map.length; i++) {
        for (var j = 0; j < map[i].length; j++) {
          if (map[i][j] === 2) {
            cStr = formatNumber(i + 1) + '排' + (j + 1) + '座'
            seats.push(cStr)
          }
        }
      }
      this.setData({
        map: map,
        seats: seats
      })
    }
  },
  cancelSeat: function (ev) {
    var ver = ev.currentTarget.dataset.ver
    var hor = ev.currentTarget.dataset.hor
    var cStr = ''
    var seats = []
    limt--
    var map = this.data.map
    map[ver][hor] = 1
    for (var i = 0; i < map.length; i++) {
      for (var j = 0; j < map[i].length; j++) {
        if (map[i][j] === 2) {
          cStr = formatNumber(i + 1) + '排' + (j + 1) + '座'
          seats.push(cStr)
        }
      }
    }
    this.setData({
      map: map,
      seats: seats
    })

  },
  randomString: function (e) {
    e = e || 32;
    var t = "12345678915641512345647856445",
      a = t.length,
      n = "";
    for (var i = 0; i < e; i++) n += t.charAt(Math.floor(Math.random() * a));
    return n
  },

  book: function () {
    var seats = this.data.seats;
    var str = seats.join(',');
    var dataList = this.data.week;
    this.setData({
      time: dataList.substring(2, 8)
    })
    var ordernumber = this.randomString(18);
    var userid = wx.getStorageSync('id');
    var userinfo = wx.getStorageSync('userinfo');
    var that = this;
    wx.showModal({
      title: '微信支付',
      content: '确认要支付该场次吗？',
      success: function (res) {
        if (res.confirm) {
          wx.request({
            url: 'http://movie.vaiwan.com/index.php/api/v1/indexorderadd',
            data: {
              movieid: that.data.movie.id,
              moviename: that.data.movie.name,
              logo: that.data.movie.logo,
              sessions: that.data.todaysingin.time,
              room: that.data.movie.room,
              userid: userid,
              username: userinfo.nickName,
              cinemaname: that.data.cinemaname,
              cinemaaddress: that.data.cinemaaddress,
              seats: that.data.seats,
              money: that.data.movie.money * that.data.seats.length,
              ordernumber: ordernumber,
              time: that.data.time,
              seat: str
            },
          })
          wx.reLaunch({
            url: '../../order/order',
            success: (res) => {
              wx.showToast({
                title: '购票成功',
                icon: 'success',
                duration: 1500
              })
            }
          })
        } else {

        }
      }
    })
  },
})