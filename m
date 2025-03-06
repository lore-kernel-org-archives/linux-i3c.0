Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2808AC28B28
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Mar 2025 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVLEnMuTuO9alxwOa9XHd/HC6F+YK0vXlm0KFyfDlBg=; b=uLaUhuVkWpBPwX
	Abdbmq7ZVc0IQNul1Fj07RqvxDbAVXLm3X+x3vP7HToaIaSqnMAChfrewTnv0iC/HOQlbF3d1PBf/
	ROwqlgVJF1Z0cwuMwENTSjZ4nUPe69ZZmK7inCGAU1NPyatPqlcQFAwGIGybrJmqKEMLVu9uI/O6b
	8i9SZ8wYH46S6SoDAekrmUPI3J7kXJGvw4m5gBB4IptSFI8/Uo/PEAMMSIHRPougJIDWG5c2Riuwp
	SjHV8qnImAO6LWmka9QpNS4pupMyhoAG2EAaJoyH9KplsLKeENsb9ttH9irP6+ijPbLMH9EZ5pAAY
	cm09UzBNrUisLXAjiH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIKX-0000000CC9r-3fqj;
	Thu, 06 Mar 2025 21:00:33 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIFU-0000000CBEf-2PLb
	for linux-i3c@lists.infradead.org;
	Thu, 06 Mar 2025 20:55:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31DAF44379;
	Thu,  6 Mar 2025 20:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741294518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nVgb7S8E/iw4FdNE85VdkMBVo9++SKBT2e5KYx+FTDQ=;
	b=nNDA+zAr0zBQ2VWBQwLLNLtzJ6gqdYttxKfAa/FB5Q6HlQMrdtezUGqiVn48xjMyRLfL6+
	QbGQLcSCj6VaZohrE6znHzNaF5fB/L2bnBZMWejHEJEdZBKXfR57YwmHkfZ8/JGpPTL+WR
	mwcK6PpnRyl+/DmaP3HwO1RTemVhmrMBi4suZp4fPnF5r+pwk8GSLMTmsOtmOlLMIkEe7e
	AEMlIQ+abb9jQQJtZj3JR7/MAz/oRiY01D3B5yuzOqVj9AJDsj+T2lSNU9Nlah0h6usgts
	CqGRGou81dg5QIWNyOIUmLrCB1SiHkc7KOQD/PJz/AhYfegDLm8Ummn1nHv4Wg==
Date: Thu, 6 Mar 2025 21:55:16 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org,
	Stanley Chu <stanley.chuys@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v7 0/5] Add support for Nuvoton npcm845 i3c controller
Message-ID: <174129444617.1163689.11942276093411687387.b4-ty@bootlin.com>
References: <20250306075429.2265183-1-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250306075429.2265183-1-yschu@nuvoton.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepfhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtrghnlhgvhidrtghhuhihshesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_125520_741774_5AB1C88F 
X-CRM114-Status: UNSURE (   8.24  )
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

On Thu, 06 Mar 2025 15:54:24 +0800, Stanley Chu wrote:
> This patchset adds support for the Nuvoton npcm845
> Board Management controller (BMC) SoC family.
> 
> The Nuvoton npcm845 uses the same Silvico IP but an older version.
> This patchset adds fixes for the npcm845 specific hardware issues.
> 
> --
> v7:
>  - Fix kernel test robot build warning.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: i3c: silvaco: Add npcm845 compatible string
      https://git.kernel.org/abelloni/c/c24a084ab6a2
[2/5] i3c: master: svc: Add support for Nuvoton npcm845 i3c
      https://git.kernel.org/abelloni/c/98d87600a04e
[3/5] i3c: master: svc: Fix npcm845 FIFO empty issue
      https://git.kernel.org/abelloni/c/4008a74e0f9b
[4/5] i3c: master: svc: Fix npcm845 invalid slvstart event
      https://git.kernel.org/abelloni/c/4dd12e944f07
[5/5] i3c: master: svc: Fix npcm845 DAA process corruption
      https://git.kernel.org/abelloni/c/2a785307e41b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
