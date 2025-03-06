Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB41C28B26
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Mar 2025 21:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSnHWaeh2q5LXaTrNq3OUtdKiUFAxOwVlF1iuFsGmns=; b=JLvDjfJ/hnKmvr
	nJV6O4Ni5TOf+bx2T9KMMVgE/KrpNHqEJEI/y1OLpJSPtun99N93QhNNNoaFl3Em4+rEQyT7rcA68
	M5NRvXAlDteAp3RD+kJugkLGz4zoC52lc1MBC76PAt5f8ZI9C0W54x2MMeJwh4HYUKAg+Y5elH641
	YM4uC03JDsMfJIJiSDb6RxRl8uixOp5Vh4Cn1NyZDg1pb8UjURsf/aCBCzb1x54/xD5TN4Ara7ExJ
	o5573MlfJe/cDZM3HwSJgTu6O0BclGuHS19pnWwTc9wc+/otk9ZMe1tOyV1U1ENKRCJCirzjgSCKk
	x2FNiJvvCVhFbR7A3BbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIKX-0000000CC9f-2QEk;
	Thu, 06 Mar 2025 21:00:33 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIFK-0000000CBDW-3hdJ
	for linux-i3c@lists.infradead.org;
	Thu, 06 Mar 2025 20:55:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97BCB43201;
	Thu,  6 Mar 2025 20:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741294506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5aJhBiQDFvCwYftHFCwv+tUCyIrz3hX4zlIz1yyReJI=;
	b=KISjB8LsvVdhyCgdKws94SLNy9wP1zUpkit8wyQgt9VeAPxI4b+rDqNmK60CF2Aj56fsWA
	co9CIH9zbWF0MVis9zQgUikrRXqi1ZsNE3szZ+nLkxcWzEzk2B2JcMFQZK6bg8COSMjo0W
	N4pp6VzQTF3K1Nj0FaSEA9ThCkntYjtAnMezNjloixU0DzwAXORSfi7vF7HylG6BWmRpA1
	dVwS2UhyQOKjWQslLE01F+nap1NOj7JX/pSP+VQXzNl/xOwR/Wh9uGm4AhXIf5eQSdpXS1
	v4TOLvexF5cEu/8kbZLoe/upfMfnqziSgbLGPFckUWLmTN/Va0wDiyV/Jyp+Bw==
Date: Thu, 6 Mar 2025 21:55:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
	Michal Simek <michal.simek@amd.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:I3C SUBSYSTEM" <linux-i3c@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: i3c: dw: Add power-domains
Message-ID: <174129444615.1163689.13836504837262083923.b4-ty@bootlin.com>
References: <fb8adcd318b1023ca6b90d294e46ae3b59dc1280.1740490666.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb8adcd318b1023ca6b90d294e46ae3b59dc1280.1740490666.git.michal.simek@amd.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepjeejrdduhedtrddvgeeirddvudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrdduhedtrddvgeeirddvudehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhonhhsthhrsehmohhnshhtrhdrvghupdhrtghpthhtohepghhithesgihilhhinhigrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgur
 dgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_125511_422370_414B99F8 
X-CRM114-Status: UNSURE (   4.26  )
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

On Tue, 25 Feb 2025 14:37:48 +0100, Michal Simek wrote:
> Describe optional power-domains property.
> 
> 

Applied, thanks!

[1/1] dt-bindings: i3c: dw: Add power-domains
      https://git.kernel.org/abelloni/c/59f994e6e332

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
