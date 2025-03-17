Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6B7C282EC
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Mar 2025 22:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDllpjLMmEXs62NyO3zTjBTlp1rNtShHrlu433klLMw=; b=S4y0CMdHX2Ntjt
	ht2Mt5qo8henyrwt8Dq+D2FAcmP3gwCN32HymgYAj4vqGttu1lEGWLDnx+Eyh9WwOlcP6ppdH0Dzb
	6vSO0D6Y+qOyy+IVdLkawM5o6tgUuMxBHsgXWI4krEjxCAD8W9KTw+YuIZ2QAk7ATIykUxGMmiZc+
	HFCFb8Ff+F/LbOwVFLaUjFLstQEdJwmMhZsH7FAl9OszJ/NPJLJ1uOoJr69pT0mX4f7+k2i0c7rUI
	LKDbx4wOhK3JvcSgkmZi6ezwdbTQbwO2hd3wJoiQMJHbbuLYM9JR77njI5MTcwMCAk+UFLU1UXcj1
	Bya6ra0uzyN0DAvibjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuJEC-000000048s7-1tJl;
	Mon, 17 Mar 2025 22:46:36 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuJE9-000000048r9-3hj5
	for linux-i3c@lists.infradead.org;
	Mon, 17 Mar 2025 22:46:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6E7243137;
	Mon, 17 Mar 2025 22:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742251591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TeZfqthe7IKkfbLBAb1vbIIB/6rALBJUMgUfaxe4eSY=;
	b=Ddfkz9DNMIzWIK3bvsBmjKyF1ai4Du6OFnryJ3idXVDTOVbYcgN3iG1hfGAPqAIUEC6Q1I
	1ztcFQVyaaYMWM8TfuYaAsGkh0AirHgzdv5dC06UHWTk1YBMVTEF3G7uzLQ+64gmHPYD89
	JNXNLEj48WYjBNHDZjIR3iRW4kVue/V1xLGfBpH21q+Y2Pz7FePyZj57EfOPpV6BffKLhH
	gRT2krF7oXPJbmyGqgh3iSf3vWXvTBi9RLGmwYFbJf0UVKHF4aDRuFRAWy/jmmWuIld97g
	SKo26MzoVMhKp93OsgO9WRmQkEoKskcQlbdTNrULbG0JZ+aZZpEVRJyEXHKWFg==
Date: Mon, 17 Mar 2025 23:46:29 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	Stanley Chu <stanley.chuys@gmail.com>
Cc: linux-kernel@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v1 1/1] i3c: master: svc: Fix i3c_master_get_free_addr
 return check
Message-ID: <174225158210.1593610.10018812780731849409.b4-ty@bootlin.com>
References: <20250310023304.2335792-1-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310023304.2335792-1-yschu@nuvoton.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepfhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtt
 hhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtrghnlhgvhidrtghhuhihshesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmvghrrdhmrghimhhonhesnhhuvhhothhonhdrtghomhdprhgtphhtthhopehkfihlihhusehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohephihstghhuhesnhhuvhhothhonhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_154634_062266_9732C0B6 
X-CRM114-Status: UNSURE (   9.06  )
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

On Mon, 10 Mar 2025 10:33:04 +0800, Stanley Chu wrote:
> The return value of i3c_master_get_free_addr is assigned to a variable
> with wrong type, so it can't be negative. Use a signed integer for the
> return value. If the value is negative, break the process and propagate
> the error code.
> 
> This commit also fixes the uninitialized symbol 'dyn_addr', reported
> by Smatch static checker.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: Fix i3c_master_get_free_addr return check
      https://git.kernel.org/abelloni/c/d6cb667b8e15

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
