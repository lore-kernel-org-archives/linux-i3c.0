Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F33C2D0CD
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjrDADUB+wt7SbI6Hxy+lwXZ64smx27NqK6sjy/ehY0=; b=t9v7vlaszy3Bza
	Fu4nFA7XLKF8MmpybXvNQNm7NeDZPaVDsQw60gEIBaEZdqyaxzi2hjNwfi094ca5AtKNz+erywBNi
	ZYs0QxJvczb9Obz0/ihb8Jbm6QyPj6x9V0knYTvu26fFgacohtbEemzsDyje3znzJHES4Mw+g980q
	IAbJ3X9fCJ+RtgWnFlqXQrC0p5irBN8WJJrSHRnBHIGCGv4dXl1lHFJH6laJ3JMgtIsUrvT8IGfnS
	EvxrzsFe1bv0dGfZZgyoxK7JQNf7SnTUVJqb5GY9kgsZ6xRbFONiC1DezenyD5NIRl6yo0kOP1pBb
	YnaaVDjNDE5RrBxa1lwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVrD-00000000ISv-0NiD;
	Thu, 15 May 2025 10:30:31 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVIC-00000000E3H-3ghx
	for linux-i3c@lists.infradead.org;
	Thu, 15 May 2025 09:54:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89B7343B89;
	Thu, 15 May 2025 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747302858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hYPpHlTt26oAx0c/+Xk9ADP4ln/33H08Wnxj8uMpvL8=;
	b=amE1zNhlCdWVhhOjFuX0co6iiVu31b60ZA4Tg+eAv3tv8Ojy3JoVoeN2SFwb5Y//bFICCh
	xgm0FcglND+Y8ba6Kp0yFbdiPmDU0l5vOogifDx2ebCFh54RveohfeLlLH05P7nGevP6OC
	kpzwb1dt0qQ0rBHdKPExvXtJA1KJthFcqQ3qczVt4LoGYCAS/WHPb/D8CQkXwjxVGCJ2aj
	TVj3OmP2tkHEhOxZqCJ2hu56M6sPVoLOJLo9sTA8VXexnzNdRU2uT0pDAWxUwI+itlra+j
	OewskXbyYTlbQxPKC1Xs4x6h1gXZ9/dSPMcw6bQHeVQlOe7b451W/TEoz9P7EA==
Date: Thu, 15 May 2025 11:54:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	Stanley Chu <stanley.chuys@gmail.com>
Cc: linux-kernel@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 0/2] svc-i3c-master: Reduce IBI transaction time
Message-ID: <174730284585.1309105.12276937340014821403.b4-ty@bootlin.com>
References: <20250415051808.88091-1-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250415051808.88091-1-yschu@nuvoton.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtugemvgegkeejmeegudegfhemfedtvgefmeeitgdvudemhegruggrmehfhegsmeelfeegvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtugemvgegkeejmeegudegfhemfedtvgefmeeitgdvudemhegruggrmehfhegsmeelfeegvgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehfrhgrnhhkrdhlihesnhigphdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhis
 hhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsthgrnhhlvgihrdgthhhuhihssehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhgvrhdrmhgrihhmohhnsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohepkhiflhhiuhesnhhuvhhothhonhdrtghomhdprhgtphhtthhopeihshgthhhusehnuhhvohhtohhnrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_025421_044116_D836782A 
X-CRM114-Status: UNSURE (   6.53  )
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

On Tue, 15 Apr 2025 13:18:06 +0800, Stanley Chu wrote:
> This patchset reduces the IBI transaction time by the following
> improvements.
> 1. Receive the request in interrupt context.
> 2. Emit the STOP as soon as possible.
> 
> Stanley Chu (2):
>   i3c: master: svc: Receive IBI requests in interrupt context
>   i3c: master: svc: Emit STOP asap in the IBI transaction
> 
> [...]

Applied, thanks!

[1/2] i3c: master: svc: Receive IBI requests in interrupt context
      https://git.kernel.org/abelloni/c/8d29fa6d921c
[2/2] i3c: master: svc: Emit STOP asap in the IBI transaction
      https://git.kernel.org/abelloni/c/81f2a9af9821

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
