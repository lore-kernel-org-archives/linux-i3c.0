Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF5AE9D410
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FvHCchrtPAk6pmzxN6n+Zs4zvJawwZtE8Nv9Uqt1d8k=; b=i4ASsBwylsKT1jOBqXzcHycEO4
	S9UqyLMrIoAJt3f4lDTDkid36aAy+Gh3mNbBmQhvNj7IHuSFaMTdi3m1guhCFOxqZYNX2wYX50KU+
	01aDW3Lvf9foTIE8cfXOCM9IezMfIH1YcsOCSE4u9pRfw2RNjHHmebgG7ENZhs90BNC41fiFyrgN8
	7/7mA8oRDVWqNLovkRFApLyWK49OjpRPdybX1/NtaYpGtl/gZyLEv6RDS1H1doi4XpkapiIGKXxDk
	aE4CA3QZCP1wqzaBrxwn9TE4LL1uBDDzuf1z0AUe9iuS5YBol0IYLlT94sdyyHgESvvY252xyYDKQ
	OwKFQSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vng05-00000008n3L-3XN9;
	Wed, 04 Feb 2026 16:45:09 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vng02-00000008n2n-2GKy
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 16:45:07 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 9A801EC012A;
	Wed,  4 Feb 2026 11:45:04 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 04 Feb 2026 11:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770223504;
	 x=1770309904; bh=8ZDcifP4P4fB473XIUlUUVFbynGXLbl7un7iNzjpgQs=; b=
	SSmGxKc2cbUDyiKze5BUUTz72Bdz32Vae9rT47WI2G+y8w+sw5bj/IieMHaNiFp1
	kxbem8CLTwOzXuX1oWoasyu27sNEdNfgkQQJxLL53eJtak/0Sw36ibkOAJULMbWr
	PmFR2QG0fHCcJFKE2NHT7Zooo42beXSl4Txh91I2EBcV+uYaHNIwNX77dd0FIRjm
	eMt6AvEWI59dx3zGs96YE+PRSUI5Ndd9NQNEidudWP7QtBwT7AUIag06YemuHQPU
	GuoVsGoAr6VM8rfAUIZNP7oIucNGEUF8yImOakazZAor/QjgXjGXp2iV0hTJ0Adr
	AHz37t3vlyS9W7TR8jxnzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770223504; x=
	1770309904; bh=8ZDcifP4P4fB473XIUlUUVFbynGXLbl7un7iNzjpgQs=; b=Y
	13BINuIsuZMcfWNAD18WoPWecFxXHUVFmbl8gyAR7wTDz2HZz6yxaH2NB2RLnCvS
	O/4nLanot9cVuPwdNRZVNPWKXS7Mw0GSlxlIpmLmI9KyHnVVqKixWOT28rdRuT8m
	PIjJh14czpKB2bXqBMsOXbg9AvOUryCZxgV7RPj56oinx9T+NHRRpQPvAs+vU29Z
	3TJ31fVXe28S7z/f+bvd2yOyTmGBcWmx7j1zlsrHd/WEyEjLZ1HsQfFCOp8xPi3U
	XNCxeWoYEDLpw0Gln68LOVIuLnRV3DDh7o3kRu5FiHV3UjCeDfCn3iBfyFtjrANl
	8Sc6e87F6Iy0ntdfGDlHw==
X-ME-Sender: <xms:j3eDaQIh68sdHEBLAdgKKiE7_QPQZldYwvnbcwW_nMIkpRlEiPUmqg>
    <xme:j3eDaa-tKxhgezjm8XbjBgts7SZH6tPzuiRLUZbSZvb7ie4Rw1a2x1EuEnvo3B1sh
    j0hxqQdgHiZzxLBqaKXFd8lohEvMRLYww6xV9SPc1yyho_ShICCrbI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehnuhhnohdrshgrsegrnhgrlhhoghdrtghomhdprhgtphhtthhope
    gulhgvtghhnhgvrhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheprghlvgigrghn
    ughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehflhhuth
    hurhgvlhdrrggurhhirghnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrihih
    rdhshhgvvhgthhgvnhhkohesihhnthgvlhdrtghomhdprhgtphhtthhopegrnhguhieskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjihgtvdefsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhh
    eslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:j3eDaciJcp7UtbcI1E9MDX-n3vBfvJ0rcnVXBG0KFsHRHtM7r78OFg>
    <xmx:j3eDaWj2z5XqSxaZmgqcMnpRbASTJ-3PavxoJQsnYk-QXIMmmJvdtA>
    <xmx:j3eDaRszcxuuCQ0msJ3HPtyeIIpklvW-S-OEG6DruxTKF0a9Wm40hw>
    <xmx:j3eDaUu3msNgbg0fnnMvVsf1BNg84IdVR9SbZSVXp8FsnosJVoUGTA>
    <xmx:kHeDaae8ybN10he0zJRdQ2G7hDG_u7LYKWGUeEESRIsKi6Rgxk5-_z7Y>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C77BF70006A; Wed,  4 Feb 2026 11:45:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AEyqQNis3263
Date: Wed, 04 Feb 2026 17:44:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Jonathan Cameron" <jic23@kernel.org>
Cc: "Guenter Roeck" <linux@roeck-us.net>, "Arnd Bergmann" <arnd@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Frank Li" <Frank.Li@nxp.com>, "Adrian Fluturel" <fluturel.adrian@gmail.com>,
 "Carlos Song" <carlos.song@nxp.com>, "David Lechner" <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Jean Delvare" <jdelvare@suse.de>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 linux-iio@vger.kernel.org
Message-Id: <207e6197-ca3b-4266-9b96-49ad5ec56fdd@app.fastmail.com>
In-Reply-To: <20260204162604f55a84b5@mail.local>
References: <20260202160543.3654499-1-arnd@kernel.org>
 <a8f8ee55-3c87-4e9c-a5a9-12929855b86f@roeck-us.net>
 <20260202205011.221c1359@jic23-huawei> <20260204162604f55a84b5@mail.local>
Subject: Re: [PATCH] [v2] i3c, iio: fix i3c driver dependencies
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_084506_650980_E6AC1834 
X-CRM114-Status: UNSURE (   9.86  )
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

On Wed, Feb 4, 2026, at 17:26, Alexandre Belloni wrote:
> On 02/02/2026 20:50:11+0000, Jonathan Cameron wrote:
>> On Mon, 2 Feb 2026 09:50:58 -0800
>> > 
>> Hi Arnd / All,
>> 
>> I applied a less good fix and the pull request has gone to Greg for
>> the IIO bug. I copied the hwmon config you have below.
>> So I'm absolutely in favour of this improvement but it's
>> probably a case of rebase after rc1 and it goes in next cycle.
>> Or maybe Greg could pick a rebased version up on top of char-misc-next?
>> 
>> So with it rebased,
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Sounds good, thanks!


> I guess I can pick this up after rc1.

Ok. I've sent a rebased patch with a slightly adapted changelog
text and Jonathan's R-b.

     Arnd

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
