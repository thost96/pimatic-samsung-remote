module.exports = {
  SamsungTvControl:
    title: "SamsungTvControl config options"
    type: "object"
    properties:
      ip:
        description: "ip address of your samsung tv"
        type: "string"
      buttons:
        description: "Buttons to display"
        type: "array"
        default: []
        format: "table"
        items:
          type: "object"
          properties:
            id:
              type: "string"
            text:
              type: "string"
}