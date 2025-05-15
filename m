Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94064C3ABC9
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQLF05YSkhWYA8qTfk/3q4U/agnq/TksqpIxM3RrycU=; b=N1qasm2uD1dwUZ
	ha3Vm3RzqzBdChgA6Fg0EylfvAaygPAlW+dt4ejGVdDa33wknhxR2PBiivJ36V2XT69e7Vl1N7Mgm
	H9tA+k8924jgsLaZR9Ee7Ke76BkZwxYQM7OX8y0DfHDPmZKAK2wUOB1Vxw/iMsdsjmEP+Hc2exZSz
	vOzwvHmrUo7meTRCWcnCtcktlzwh6qS3s0/+uKyCdaKSjdjOxV7S6DWAX2Jy3b+ySZRi25VLW3y1E
	+JguYDAPI9f71cJQpohcrh6lnT3RnECwpT2jbox8DXk2jNyZ1z8G8nbTfOTCBppb9O1AfF80jKb8K
	KxlkhD1AUgBF4B6lgMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVrD-00000000IT6-1YDy;
	Thu, 15 May 2025 10:30:31 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVKQ-00000000EKZ-3w4Y
	for linux-i3c@lists.infradead.org;
	Thu, 15 May 2025 09:56:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69E2A443C1;
	Thu, 15 May 2025 09:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747302996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7b7QfGSwTLf0/PzmgHM9kT4FYPZClKyby6GF/Dr6W6Y=;
	b=pS3O+aXuaUpOl3ut6N2HqUFsPuhA3T2JNmDd+qC4sCm7kJ3vQBPa9z/pyJdBRKiZfx+3XW
	OKmuO623zxf2XjHRc8W7D9BcKZJsQYrv9PKIJTIAWpBwYTj76mzxVVu7HPNlxf4cjDqkZt
	YvZ8Wav1oT9jAGGUghkdUMJgYg6sEteqCqcQHr5bu536dQB4u7qmRul+rqwu+oOPvnC6Z9
	ld82GxTYnnz31IXYLxB0xojg3UP3NrTiujiH097jM5+P4gK4xnuNNuMbbHCD5zl3H/2Qpc
	1u5vPBTmHJZjFium/XAMSx+yMnv6kWCyKdlUL5Eqa69Eqpmx+eo5QMzdHusx4Q==
Date: Thu, 15 May 2025 11:56:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] i3c: master: svc: skip address resend on repeat
 START
Message-ID: <174730297355.1309338.10386281682864531931.b4-ty@bootlin.com>
References: <20250429054234.4013929-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250429054234.4013929-1-Frank.Li@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtdgumegvgeekjeemgedugehfmeeftdgvfeemiegtvddumeehrggurgemfhehsgemleefgegvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtdgumegvgeekjeemgedugehfmeeftdgvfeemiegtvddumeehrggurgemfhehsgemleefgegvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhin
 hhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_025639_123325_BA6BE460 
X-CRM114-Status: UNSURE (   7.18  )
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

On Tue, 29 Apr 2025 01:42:34 -0400, Frank Li wrote:
> According to the I3C specification, address arbitration only happens during
> the START. Repeated START do not initiate arbitration, and In-Band
> Interrupts (IBIs) cannot occur at this stage.
> 
> Resending the address upon a NACK in a repeat START is therefore redundant
> and unnecessary. Avoid redundant retries, improving efficiency and ensuring
> protocol compliance.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: skip address resend on repeat START
      https://git.kernel.org/abelloni/c/12cbd1573448

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
