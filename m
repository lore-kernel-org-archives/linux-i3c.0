Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C57DE7DEFC
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Feb 2026 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Z2Uh1+rZ/LpMu+eN3BIUzw9sBTNCXY+lkjOVK7kH7Ok=; b=0ZXGCTDcAMIIZEDJ+jvrCdDTk8
	3XbVnXeSKrZgJ6R/5slcZA/PAvJXCEU7EbaycviTut5d79LaYil7esC/v8VXfhI5STrxpWpk2eN30
	/1wKfrmy3k7ACrCzbu4onF+dOr9dCdq6q5tXhpIRwNXq+BMAbjIMQU/CC537sVahKT+G1tBF17rjN
	dqB73iz7X+HAeWmbQfMkdVmNNw0VwFfuxAibrDN7yzcnI5hz8kHJwUbiMhv4vRANyAKvb9xdu6w4l
	SOFqXvuBByvbcxlSobcUIC1MhhaHyaZZdg12SopKRd11si6QC6Vfe+Tv7Ot+SROvYK2mjJxfCGTWE
	J3Av+hnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwQ6-00000005GKx-0GYO;
	Mon, 02 Feb 2026 16:04:58 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwQ3-00000005GKY-0vxF
	for linux-i3c@lists.infradead.org;
	Mon, 02 Feb 2026 16:04:56 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4F3E77A0063;
	Mon,  2 Feb 2026 11:04:53 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 11:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770048293;
	 x=1770134693; bh=A5s8vBJiflOObhgPxrKF4zHMzLvR/1OrlhfaqkKdkoM=; b=
	TuT/peSxHs1OA3x7debrv619RQpqqW3EsiUUfBpztnHZnhfeZHkNKFrEf0mjSwlh
	CJu9eALI4pvF5Ny0vDcHcn+viOYIyBUKUGDbm6wrcBCKYEuSqw9yiwEAqQx7Ib+m
	BMhaIslBS5TxNBR2UmgrLlOvqrhJLuI9XRg9wnZ/P+5xbTSENERTwL5Ms1J1OOHX
	lP8EEf8t451D3LkqVXNVOLgXIPEaM0r3eK7H4ZL/hItkJrUDMRSXavHoaf8k9N4B
	cyLGTOjG3us3AikX5/aqyOau08Mlldg2Q0YrF9tD9gUGfTScyDfHBOLbUqVKom0v
	k7W/t2XLsbMzv0gwpxGUoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770048293; x=
	1770134693; bh=A5s8vBJiflOObhgPxrKF4zHMzLvR/1OrlhfaqkKdkoM=; b=r
	9bh5Rj4or5gJRgJz8SviVthV9zC8bxUYpEC04QnAUw6JABMBlShBxy8W0mb+WFZG
	4+zKI0y/My4DNywKqqmnOzilsWsCXvS9joUfUYKS+2w4tR4VvAIa/GMMK2afxzPO
	7E/pVxn7M8yFMxZxASpwMS0bZMpzQrklHXWIjbxe4oojKLfm+2YmGQTTqxDw/VbU
	llcOxzXDryTRW7G8iJvHfoFXHG46XkwRQTHP0NyklB+vdZhyD7CPfDroNAQwEL7q
	AUKdWQjPnZHSWtdRluG8RS65zx8U4QZ/yufr6Rkqf3yjUOwTkVCjQYn7Qvh0evhc
	FZDIDrPDlgVZiwUTjYdww==
X-ME-Sender: <xms:JMuAaTXbDgKtpDM816v67-RMy6N2afeQDpGZ5Znc0em5JTMdMSUCwA>
    <xme:JMuAaWbHrx_lpz3qbnAKy7d7bdfKNSpiYkB8_psAka1rmkv-NM8DK02GAJeHcO72z
    IwdbtmU1frx2g8FiFN5Wi_y6XvldHLUvr7suZw_82NKD332_jA5Jfc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehnuhhnohdrshgrsegrnhgrlhhoghdrtghomhdprhgtphhtthhope
    gulhgvtghhnhgvrhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheprghlvgigrghn
    ughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehflhhuth
    hurhgvlhdrrggurhhirghnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrihih
    rdhshhgvvhgthhgvnhhkohesihhnthgvlhdrtghomhdprhgtphhtthhopegrnhguhieskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjihgtvdefsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhh
    eslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:JMuAaVaMzCa6xGRIp4lVpN70Eh8Dwv_fuc8FO4QIv-jnbFwyT_0cBw>
    <xmx:JMuAaVxQ2w95eD-3mxzEBGmBgWMHQ2qjSuo_Q2zjmRsbfefpURt8Aw>
    <xmx:JMuAaQcdY3dZSGKEIRifX31AYO-dGUCcEXQcbkhOQziDPGPuyKHwfQ>
    <xmx:JMuAaTIk9PEpxRxgXphC27Qnrj8CDQo-_zFW1lQ3EeD7EAusG49GyQ>
    <xmx:JcuAaaG1E7g8O-V-3CWalHNx4RXVnakZ2xoyZhE-JCO4NGvvDPuwaqIV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9E8E9700065; Mon,  2 Feb 2026 11:04:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AS8fLWBco_53
Date: Mon, 02 Feb 2026 17:04:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, "Arnd Bergmann" <arnd@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Jonathan Cameron" <jic23@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Frank Li" <Frank.Li@nxp.com>,
 "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Carlos Song" <carlos.song@nxp.com>,
 "Adrian Fluturel" <fluturel.adrian@gmail.com>
Cc: "David Lechner" <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 linux-iio@vger.kernel.org
Message-Id: <01676354-a42d-4862-87d9-7377ea55fae8@app.fastmail.com>
In-Reply-To: <8daadfff-a8c8-4775-93de-72088f929f9f@roeck-us.net>
References: <20260202095628.1254175-1-arnd@kernel.org>
 <8daadfff-a8c8-4775-93de-72088f929f9f@roeck-us.net>
Subject: Re: [PATCH] i3c, iio: fix i3c driver dependencies
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_080455_309196_44C97063 
X-CRM114-Status: GOOD (  10.21  )
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

On Mon, Feb 2, 2026, at 16:24, Guenter Roeck wrote:
> On 2/2/26 01:55, Arnd Bergmann wrote:

>> @@ -2381,19 +2380,7 @@ config SENSORS_TMP102
>>   
>>   config SENSORS_TMP103
>>   	tristate "Texas Instruments TMP103"
>> -	depends on I2C
>> -	select REGMAP_I2C
>> -	help
>> -	  If you say yes here you get support for Texas Instruments TMP103
>> -	  sensor chips.
>> -
>> -	  This driver can also be built as a module. If so, the module
>> -	  will be called tmp103.
>> 
>
> Why ? That doesn't make sense to me, and if it does, it seems unrelated
> to what this patch claims to do.

Indeed, that was not intended here. Sending a fixed version now.

I have no idea how that change got in there.

       Arnd

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
