Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4765BCAC5AE
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 20:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W1MXKlZQcL3CAfdSb8MQnQbbI0KTUt1q7UeGaYQgUOA=; b=tiuIFRZPfmMQiVfdjIFCvH/7K3
	RXzkwcH2Vf8O69lu/a+7d5M8ZHiVFjZPcjZNOnCTARG8+qmurZRrDPX0YhB1LzT6mwp8rppnGVMtv
	M0213ENzpJYVkyvSivqRqMGgHLyksJOBRU269P2TNArLk/C/DGdGL1VR5V6NzxOTzywQK3MkbfD/E
	q+vDKpWInMWvyOGWNCdgA2KUWXhfSGbZHTXShpsNcBRMPcgc4vAdO1WDid46XX2nSuUA7vFl7UEjO
	9aRmBdYdpAStZwh7B3/L0ywUBptHqM4tcwHr4yFNVKH4fCur6vLfB/c2CuID2+EL/s7rlA5J3Cf35
	ZmcpcuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Vy1-00000003PNR-0CNG;
	Wed, 24 Sep 2025 20:19:57 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Vxx-00000003PMr-42o3
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 20:19:55 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 3FF64EC01A7;
	Wed, 24 Sep 2025 16:19:52 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 24 Sep 2025 16:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758745192;
	 x=1758831592; bh=m8FTw+V0SHUIhk9QAZOvCPg7GbCZfkE73XxcAK3HRvw=; b=
	cpocQpIwrcUOSlbCkz3Q6P4cmFbBy9OnxrQXVU8fZy+1ag0e1MIMW43vie+IR1Zv
	znhl3qHeXeGy9K5o4xFNx+W6JZvpXyB5Su/WlnBir9I/aOsqEtdXlki2BbXuF1Mp
	YgkZeJtwNEJ4rGl71vQCCNbz0IDYedx0gePQ+tU/xw0VKki7KGkVZeVogtZQkWeX
	lQIDxdRg7ubzrjcNgGGFk0GvV6CIUv+nkoJPz+8zF85nj7plDqpHiOK/x1EUpOL4
	GlqbwC91kFEHHw4gn5dNtWRHxAcV152fZR0RE7Psv48OqB6vZZvZu2G38E4faaDJ
	H24r4DweenAGf38wDvMNrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758745192; x=
	1758831592; bh=m8FTw+V0SHUIhk9QAZOvCPg7GbCZfkE73XxcAK3HRvw=; b=n
	XUXa+IalwlRDv8bv0wOI4v/Fgwz2XA+iow02LdhRhbDR+nWa6bo4P9gT60eCu1Fz
	bVZLSaLxouQ4//NuH+PgQQbnXSvKHA1yzjPKLIUqYqv4zIyxUEdEWYSbmNKpj8pB
	zBALQJw0MDV3WM4QuOZAD4MEVbfq8IR4jki0OnNisMEx59iTm5jDCOqiR9KAkmMs
	ZbHYLoIO52RQsn/WZr9QMnzhL6cylW/QZ409E0WjM7D/eg5ZbsH3tVGDd0I9bpZ4
	lr2Mx87wtyXelnpFaXZOYfYn9mm7iq5WU2yiXoXZDMpAV1o3wd0qATu83U9ZogHZ
	CG4IBhzs4vhiWz57Edhlg==
X-ME-Sender: <xms:Z1LUaHgVnEyQdPi9R-0v9y9rP8Pjv_a0NpPhW9AfA6BXPqh_pG7zrQ>
    <xme:Z1LUaO3H7Y-fL1iXX_Hm2TfZ0O7R3Py-xVFv3J67JfwQz2MH3zE3SKQxH46UkW_Gk
    fPbFz-pGwwKueH1MLfYLDGTBTYXgJWucMfdJPUUZwsS5aBllpIAlU4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeigeehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehmrghnihhkrghnthgrrdhguhhnthhuphgrlhhlihesrghmugdrtghomh
    dprhgtphhtthhopehjohhrghgvrdhmrghrqhhuvghssegrnhgrlhhoghdrtghomhdprhgt
    phhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpd
    hrtghpthhtohepghgrshhtmhgrihgvrhesghhmrghilhdrtghomhdprhgtphhtthhopegr
    rhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqiheftgeslhhish
    htshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehfrhgrnhhkrdhlihesnhig
    phdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinh
    gvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Z1LUaAxNFHMOREkqCmAiqLK0kVFUXn7NEDSl03-6lt2zPVP7A1luNw>
    <xmx:Z1LUaEtMj706rlCTvQJXFZfdVdVaCHO1KvcxBy6q3QecJC05INzl7A>
    <xmx:Z1LUaDDauZxDXUOkgzFsdGu2IXAnv2kUn_c4HJenpYX9mVvlpqxGyQ>
    <xmx:Z1LUaGHtNPGtn62llmgvJ099ab7pgUzs4YhNbfXSdrVrvOi0vFFfag>
    <xmx:aFLUaFfT1aUE0B7TavoJicZNHn_2752eUGLhE1ShqnCFQeIe_os41zoN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 88C5E700065; Wed, 24 Sep 2025 16:19:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AywbbuUSWNC3
Date: Wed, 24 Sep 2025 22:19:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jorge Marques" <gastmaier@gmail.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Jorge Marques" <jorge.marques@analog.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 linux-kernel@vger.kernel.org
Message-Id: <d86da0ed-8293-4356-bc73-98492d08ee8c@app.fastmail.com>
In-Reply-To: <ikwkapgsfntog67hwi2aapdadlq2wy7oydjz6i75gbhgxxd6fc@3e3lxh7xkgy6>
References: <20250924150303.3601429-1-arnd@kernel.org>
 <ikwkapgsfntog67hwi2aapdadlq2wy7oydjz6i75gbhgxxd6fc@3e3lxh7xkgy6>
Subject: Re: [PATCH] i3c: fix big-endian FIFO transfers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_131954_332373_B75D53FA 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

On Wed, Sep 24, 2025, at 19:01, Jorge Marques wrote:
> On Wed, Sep 24, 2025 at 05:02:53PM +0200, Arnd Bergmann wrote:
> Can you fix, as Nuno pointed, to:
>
>    		writesl(addr, &tmp, 1);
>
> as in the original drivers, and adding this information to the cover for
> further clarification.

Sent v2 now with those two changes.

      Arnd

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
