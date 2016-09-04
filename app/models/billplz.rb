class Billplz
  def self.create_bill_for(order)
    order = order
    HTTParty.post("https://www.billplz.com/api/v3/bills/".to_str,
    headers: {'Content-Type' => 'application/json','Accept => 'applicaiton/json },
    body: {
      collection_id:      "6xaolp9e",
      email:              order.user.email,
      name:               "test user",
      amount:             order.total*100,
      callback_url:       "http://localhost:3000/webhooks/payment-callback",
      description:        'Evil Commerce',
      due_at:             order.due_at,
      redirect_url:       "http://localhost:3000/orders/#{order.id}",
      deliver:            'false',
      reference_1_label:  'Order Booking Ref'
      reference_1:        order.id
    }.to_json,
    basic_auth: { username: "f236efbc-8665-4599-a1c2-5327082504dc"}
    )
  end

  def self.check_status(order_id)
    order = order.find(order_id)
    url = "https://www.billplz.com/api/v3/bills" + order.bill_id
    arguments = { headers: {'Content-Type' => 'application/json', 'Accept' => 'application/json'},
                  basic_auth: { username: "f236efbc-8665-4599-a1c2-5327082504dc"}
                  }
    HTTParty.get(url, arguments)
  end
end
