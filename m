Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46FEC28B30
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Mar 2025 22:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jbm3YL6c/VcddVFlRCenykSGfYf1o3Q9TkELGAhQQfo=; b=ALGvl0XTLfGmqt
	IL/k8fiSOjaiU5GFmilsh6C/6ygal1ciKqCzWgDTreAFUO2j8Q7vRCvnVc3JFA6rvOSepCclK+7qC
	rvoV4hmj5hf3T6FUtfVs01nUNR/9iXrdxe4ASSptQI+Up44LF6YW8kZOs+wVuJWkeTYDugKxhSvrQ
	0Kq0QnBWLDKkPUyAl+X6mFsraLrrvu7UeemjUH23Dc3198p/OJiBE5j5S6XnPJj7KyPBpBWv1ntS6
	lFKc3bpJc1ejljeROFkM9A5/hL2vPjDTMl8JaVmiPsL8Hi/KOZwarv6V8j3sy2xd2NbG4fOX5B5MB
	A7gTVh9VT9+Unq0HM2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNz6-0000000DJBo-2iwb;
	Thu, 20 Mar 2025 22:03:28 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNyo-0000000DJAJ-2cSC
	for linux-i3c@lists.infradead.org;
	Thu, 20 Mar 2025 22:03:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96B6D44364;
	Thu, 20 Mar 2025 22:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742508187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q9ANWztryAtzgs9DRNwfWIv3Pg0tyATZHHdZaolpDOY=;
	b=BGuP+IQyk7BHW5sC3FOEVRzpV0bZKhxuuSXJ3EQgav8x4Vj86p9Iw6osoIrkzejmfEleML
	c9UcXzN/7Ds8rib6jllcHjvCBSw+UoU5ByU1aYzkxcQ0+R7gaapu7pGFkku3xe3wLBjUJJ
	3yrwbMpxzrsCXz/q9mepxDs7sTuCMt8f/pcoUI8Iq2j68RnaXFDrdbHNsxGmgQYFE+67YO
	eP4IfL+c0wBqwdaWeO8N2Emis4FAV7pOfxNrVGpDkbJV3ggwZ3GcDe0eBAR2ua7GDr1vQI
	FtXUMvOxxGLsCNEQ/SMi6ILGky2/TcE9uMM+8Iu6EZQbPC4gI+UrF1wdR+9QDg==
Date: Thu, 20 Mar 2025 23:03:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Stanley Chu <yschu@nuvoton.com>, linux-i3c@lists.infradead.org,
	imx@lists.linux.dev, llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] i3c: master: svc: Fix implicit fallthrough in
 svc_i3c_master_ibi_work()
Message-ID: <174250817539.3598269.2833694260995006704.b4-ty@bootlin.com>
References: <20250319-i3c-fix-clang-fallthrough-v1-1-d8e02be1ef5c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250319-i3c-fix-clang-fallthrough-v1-1-d8e02be1ef5c@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeelfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtt
 hhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihstghhuhesnhhuvhhothhonhdrtghomhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehprghttghhvghssehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_150310_812572_1041333B 
X-CRM114-Status: UNSURE (   5.31  )
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

On Wed, 19 Mar 2025 09:08:01 -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>   drivers/i3c/master/svc-i3c-master.c:596:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>     596 |         default:
>         |         ^
>   drivers/i3c/master/svc-i3c-master.c:596:2: note: insert 'break;' to avoid fall-through
>     596 |         default:
>         |         ^
>         |         break;
>   1 error generated.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: Fix implicit fallthrough in svc_i3c_master_ibi_work()
      https://git.kernel.org/abelloni/c/e8d2d287e26d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
