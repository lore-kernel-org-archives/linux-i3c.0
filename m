Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75227C282EC
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Mar 2025 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M25BmfJsYprvDtv4nEFxdUtGej9V2OH/0nMIfEOdz3k=; b=2za5E7qNl4lDXq
	RU4oVQ2yKIeYHCHBJr0+4Sal0/pivFOBcdmPwjxmnenC2++jMIExhW6C4rH+xFOribWfjWJTpbW6f
	Llmim1S/Rc/Zhgu99E8o7k3GasywjFcd0CrK/bNpayE2Zn723AqLemwPa4dfE/X4P4xBCZFgflkFu
	XHzC6BwWfTS8uC64+vGKszk6dPmT4FfUfewuP3ExEbFQCXUXVk+MTiIgcGvXDfScF1hLOiNxLxdLi
	Yf0LWBkfEKw9BOuHSxLS2kD4hnlG4hARAKzhWt+AVdLnN924JNWUkUDQqiDOKqESX5MkkzfFHuu0a
	pZH8V6cawHXIUUf1WTgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZct-00000006U9y-0qrC;
	Tue, 18 Mar 2025 16:17:11 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZcq-00000006U9D-0x7b
	for linux-i3c@lists.infradead.org;
	Tue, 18 Mar 2025 16:17:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD8B544185;
	Tue, 18 Mar 2025 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742314626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1MC2A6PNfzll9VLItZ+nZI46h7G7PS7pxgkQea5MRVo=;
	b=KFMhNaM2YdK0R5QUeFTiQUkvmUkvMJMxBw0kFjGpQUDGJIF6502dLuf8Upx6G+QsxRdE4k
	2Q6lNB+/PmEX0otv5IMxZnveG0SRso2jFHjWBttpF0cOUEF4Ut3eWt32P9ObRu2NSE2S85
	aTw/IeCwaey76sc+gJkJcMcV/nLdN8deqqcHMSSBlL/la4St2ouL/B2bdNYq1BKwUmluNO
	0KuM9Y0elvr5xRcFmGCRTSEDCmY9vtGdHGIJmYrIzvVKta07nhMq9T/yj0tHz22L05d3A/
	I8NgNWSk3UW9UIuwQlGuy5nII3dbjAAojYVS6Mqwc10NV66UuSkCkUvbVSINCg==
Date: Tue, 18 Mar 2025 17:17:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	Stanley Chu <stanley.chuys@gmail.com>
Cc: linux-kernel@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v2 0/3] Some fixes for Silvaco I3C controller driver
Message-ID: <174231461561.2047387.4537921401617051173.b4-ty@bootlin.com>
References: <20250318053606.3087121-1-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250318053606.3087121-1-yschu@nuvoton.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugdujeefmegsjegstdemjeeitgegmeefudefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugdujeefmegsjegstdemjeeitgegmeefudefgedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehfrhgrnhhkrdhlihesnhigphdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhis
 hhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsthgrnhhlvgihrdgthhhuhihssehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhgvrhdrmhgrihhmohhnsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohepkhiflhhiuhesnhhuvhhothhonhdrtghomhdprhgtphhtthhopeihshgthhhusehnuhhvohhtohhnrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_091708_392576_0BBD1E7C 
X-CRM114-Status: UNSURE (   7.12  )
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

On Tue, 18 Mar 2025 13:36:03 +0800, Stanley Chu wrote:
> This patchset adds some fixes for the Silvaco I3C controller driver.
> 
> Stanley Chu (3):
>   i3c: master: svc: Fix missing the IBI rules
>   i3c: master: svc: Use readsb helper for reading MDB
>   i3c: master: svc: Fix missing STOP for master request
> 
> [...]

Applied, thanks!

[1/3] i3c: master: svc: Fix missing the IBI rules
      https://git.kernel.org/abelloni/c/9cecad134d84
[2/3] i3c: master: svc: Use readsb helper for reading MDB
      https://git.kernel.org/abelloni/c/c06acf7143bd
[3/3] i3c: master: svc: Fix missing STOP for master request
      https://git.kernel.org/abelloni/c/0430bf9bc1ac

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
