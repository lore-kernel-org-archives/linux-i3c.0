Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01331C27C78
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2024 22:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLRC/keCAPGcfrOQ8iXak9wfslEuFycJU0Ze3YaxFUo=; b=DdxLwU03AFRKyP
	LtqWPQ2kXEK3GN4ukhj6HDTcnRFMVJM2ZNpZjMPO2jG7ebCy8hfEbBdHL4lCXM+EZRuSJ6ScKc3c9
	GOWc4vgHhKG6q1QKbuTAHZa7xAeDEQuhZsEl2l4sY/8tJti06mSRIuvg7SbH1dgsRTKhUTLfc4pnT
	jIeZOFkCV06MapyVVNdlY124aQtJ7tzWgxhSEQ+GvEjagTPz60fXhKNNWgjyfl4bnw3wdvEUIDirj
	RN7iFbvng/MSL2ymWBlVPCthwKuCpcy0GZaM4EPtSoeQzMGhD3AwVAx5QjKIBkXqqjWobz8PSNBQu
	GXoGlsF8M3oaNVXx8O4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9It-0000000Cvh7-2jHW;
	Sat, 22 Jun 2024 22:33:51 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9Iq-0000000Cvey-29Jf
	for linux-i3c@lists.infradead.org;
	Sat, 22 Jun 2024 22:33:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5A2BFF805;
	Sat, 22 Jun 2024 22:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719095627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Np0HAdoh8EZv8Bq/6GLeT6pSPf91A6nHL3cv9CEp+04=;
	b=EyC1qKLsRooRDsCc7cZWjDHJk5YCZHERbx2gBaEtJXyPYnxuQ+kvG1QzOo+N0gy6KFn9m/
	9dTHPEI2CzmGmcq/YyoipSD6y0LXNVOSPsJqJgmzVezwuhT9FCOAyvziA7iAGHuYWPj4Ja
	oryyWD//xLa0KNnGo97fvstUrLYdXctiq1dUQoMod7BhrDmAgJ+WXfLu69dqZaA1xeoXaH
	Dj84+I/fc/Yh3C3uTFPITu5uuqPdNlK2QhktCuZM+3ztbg5U5Ly/RqP7fiXdXDVxiW2em1
	kbm6OBIGkNRvj3WGMDenA1E6u3rZpXSLj74QDZqt+8bPaqQaJcAPjBJzQq924w==
Date: Sun, 23 Jun 2024 00:33:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, imx@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 2/2] i3c: master: svc: resend target address
 when get NACK
Message-ID: <171909557749.2164405.8135288010118106502.b4-ty@bootlin.com>
References: <20240603151527.52235-1-Frank.Li@nxp.com>
 <20240603151527.52235-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603151527.52235-2-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_153348_721866_64E42DBA 
X-CRM114-Status: UNSURE (   6.15  )
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

On Mon, 03 Jun 2024 11:15:27 -0400, Frank Li wrote:
> According to I3C Spec 1.1.1, 11-Jun-2021, section: 5.1.2.2.3:
> 
> If the Controller chooses to start an I3C Message with an I3C Dynamic
> Address, then special provisions shall be made because that same I3C Target
> may be initiating an IBI or a Controller Role Request. So, one of three
> things may happen: (skip 1, 2)
> 
> [...]

Applied, thanks!

[2/2] i3c: master: svc: resend target address when get NACK
      https://git.kernel.org/abelloni/c/2d15862dfba6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
