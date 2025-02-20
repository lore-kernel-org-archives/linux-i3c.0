Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93181C021B2
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 22:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRM5dBixxSmbLLYxyY3yw8UPnFHh42JrZwX+1I+7YWc=; b=IMKXM1e46/inVT
	3sSQDyp3IHLHduX0nq43u9NzbmuMLvVWGaAHIfS13SOcOUEMbBID7+HyUfT11NIcj2agsTPU2B0Q4
	NMx+egEsJRRrqA3wHf/Wrcc+75ZfmfvkyLkk7vxQX2u/+6UXI0oQHK4RyBF5WC7wTHTcp4KXyo12n
	xOT1wybKHIJS8sdlPAZeY7Ne2t4BLeyGMFuA+3KvzfqGfU/v6e9LbpLLPvfAvhd605ensEF1nWqws
	ZJPKs9dNugqikrRbg2QEkaGQIqNP/KVA2h57gC/opcdjJOcVu+Pbj08YV2B7I9zxYQSVKo6cWTNp0
	bzI2WjjO35QYKsRZT0wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEui-000000037iF-15Lp;
	Thu, 20 Feb 2025 22:21:00 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEuf-000000037gQ-39RC
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 22:20:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D65864431D;
	Thu, 20 Feb 2025 22:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740090055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X3LtfwD9Pn+Yvmkz2n0LKCzfssZAUMxpskFJUZ2RaJo=;
	b=HXwlGTfls/SK3S7ZVZTiUfOSL3GfSpUNkHkNt9WId5AtxQQHyrfRVYv+4vS8kZxJ5cBCu9
	gZ4O7HiR6vjMoiyfCxzuAtREnXdgdSun3nCQCwqRS36DmqDdKF6MY9NQWGIw1kDyfzUDwm
	qEjMAXtMcJhKA0vMabxWE896XtnTKIlM1WpVM9j7qFhLI4pPKYXKVoIUdnFtTUM5aErRwV
	bCFsPe5sT39mHEF8E5goMASj/teoxqOOO/UJMLZRjVwYWZuMuKOYGKY85F8vDpcsbR9RNy
	qhr3eHIYqAc/m7zkiXRFiG0jivZbF1jQg3TVjQikmKhh0kYKzrnzrYAlRvCd6A==
Date: Thu, 20 Feb 2025 23:20:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Flush FIFO before sending Dynamic
 Address Assignment(DAA)
Message-ID: <174009003834.598401.3147547459483423784.b4-ty@bootlin.com>
References: <20250129162250.3629189-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250129162250.3629189-1-Frank.Li@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeikeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguv
 ggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_142057_920162_ABF25CA5 
X-CRM114-Status: UNSURE (   6.23  )
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

On Wed, 29 Jan 2025 11:22:50 -0500, Frank Li wrote:
> Ensure the FIFO is empty before issuing the DAA command to prevent
> incorrect command data from being sent. Align with other data transfers,
> such as svc_i3c_master_start_xfer_locked(), which flushes the FIFO before
> sending a command.
> 
> 

Applied, thanks!

[1/1] i3c: master: svc: Flush FIFO before sending Dynamic Address Assignment(DAA)
      https://git.kernel.org/abelloni/c/a892ee4cf22a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
