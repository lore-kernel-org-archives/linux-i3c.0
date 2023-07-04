Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA52DEB64DD
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Jul 2023 06:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teHoxxm6Sgz8mJGtRhLer8h1bhiaDEIsjA0cdU91RXk=; b=3qG/0KCt6zIlyE
	MenAUIVDtKANRv6v/jQ2Hs2WlrOZqfqpRC2H06ltSgWF40QAyBrtoX+M9ByMHwtYEbdS43ecELc4S
	meCBruHqCeGhabArg0gonDkt+5XDC7K3bceza7Mx8szw4K6E9J5ec73RstXMBgb3YWAkRU0zhn2Dt
	vw13Y6jpPckrrtyq4przctN6KYsW6bbN/8O5hrWZPudbooQOIrfyYhihG1rvFBUfGAPjznYdGWM0r
	8GH/RyLyZl3hHLaSp18HJAh0J8tbutA0DOfTa8oXuEKKmKTR+r3f79fF8MqWBeZI7jA14QcXCvP0k
	ofcy2btRSiAPuO1ScM4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZcX-00CKj8-33;
	Tue, 04 Jul 2023 06:34:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZcU-00CKgg-03
	for linux-i3c@lists.infradead.org;
	Tue, 04 Jul 2023 06:34:39 +0000
Received: from [192.168.14.220] (unknown [159.196.94.230])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AD3C02005F;
	Tue,  4 Jul 2023 14:34:25 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1688452468;
	bh=4a712HWYYivVC3R/cYHgxezT1C9hARmv+s6qvLxS/Wo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=J1do8u2/GXfSj7DcSoQrozQD6M0CI3yGHIbfA1WC5lcRGmhWKuuBPhwiyMktW6vQO
	 IDn1b86idQ5uhcxGJQXUaeEeqBxvv64hX6ImhvrKScbNhlkAqzi/pS7JL2Hylob7lH
	 k94EtrqbZgjIJ/BOEi+ce+yc5ytjegpBW1LbHBL93qVzzEHzsWOabmmfA4h+tx4mgs
	 yNp0G+be44TkE4ZiK9179GoLswF7548kKsDre0FhvsMcZbB4SsCpf0UpJnhMSHgQG8
	 UAFkHYR5DKmWDDv+oVua5UNwdR05kKxoBeaKvHJU9O9fPuaOymlbgje8xot6gq53D4
	 H/Bj5oinCtIiQ==
Message-ID: <07fed8cf89f64fb3064e4363889cfd1b1512223e.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: Add mctp-controller property
From: Matt Johnston <matt@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>,  Jeremy Kerr <jk@codeconstruct.com.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
 <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Date: Tue, 04 Jul 2023 14:34:25 +0800
In-Reply-To: <7b8e0f70-a6d2-16e4-5615-004b930298c5@linaro.org>
References: <20230703053048.275709-1-matt@codeconstruct.com.au>
	 <20230703053048.275709-2-matt@codeconstruct.com.au>
	 <CAGE=qrrqE3Vj1Bs+cC51gKPDmsqMTyHEAJhsrGCyS_jYKf42Gw@mail.gmail.com>
	 <d29fc42c04f2e1142b0a196ef7df2d74335cec2e.camel@codeconstruct.com.au>
	 <7b8e0f70-a6d2-16e4-5615-004b930298c5@linaro.org>
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_233438_271798_C6E134F9 
X-CRM114-Status: GOOD (  16.02  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 2023-07-03 at 16:16 +0200, Krzysztof Kozlowski wrote:
> On 03/07/2023 10:14, Matt Johnston wrote:
> > On Mon, 2023-07-03 at 09:15 +0200, Krzysztof Kozlowski wrote:
> > > On Mon, 3 Jul 2023 at 07:31, Matt Johnston <matt@codeconstruct.com.au> wrote:
> > > > 
> > > > +  mctp-controller:
> > > > +    description: |
> > > > +      Indicates that this bus hosts MCTP-over-I3C target devices.
> > > 
> > > I have doubts you actually tested it - there is no type/ref. Also,
> > > your description is a bit different than existing from dtschema. Why?
> > > Aren't these the same things?
> > 
> > Ah, I'll add 
> > $ref: /schemas/types.yaml#/definitions/flag
> 
> Although does not matter, but use the same as in dtschema.
> type: boolean

OK, thanks.

> > For the description, do you mean it differs to the other properties in
> > i3c.yaml, or something else?
> 
> It differs than existing mctp-controller property. If this was on
> purpose, please share a bit more why. If not, maybe use the same
> description?

The mctp-controller property has the same meaning as for I2C, so I'll use the
existing I2C text for I3C as well. That will also be more suitable if in
future Linux works as an I3C target device (currently it's controller only).

    "indicates that the system is accessible via this bus as an endpoint for
     MCTP over I3C transport."

Thanks,
Matt

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
