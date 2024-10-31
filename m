Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFE7E6748C
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Oct 2024 22:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BK6io0OiG1flgTyNBJt71F/15107SZdtLoa5dXWG1pI=; b=mVR8sBLKOLvu32
	aSe5WIfnc4RbJvVhNCDmXO6YwWfizjS5dkGOaCl+6uxvF50JNsmdCYthCYHjNmoksyenGw++6Fq2x
	bIf3E93wKsH/WsER15RoeyzJTxk1vChPeMJ6uHRf+SKZBSlHGkVqDAqw7ly6Q44nFET0DWtppPUFm
	CbN2XA7a+gyxTCkBqqsbV80JP0Fp9NsszRRyhP30GDI6ae2V8yqSjKdeqODgvqE58INw/LZVMVP2W
	pjnbze76GlFlsZdg4//YOIpKyB72QCNtS7WqfEnDeCkPPCWvSVe7swSBq2+ogb110MuZKOBy06i5f
	GGpIm94cbmteUzM1i6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6e5B-000000056kO-0epu;
	Thu, 31 Oct 2024 22:56:01 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6e57-000000056jA-2Ick
	for linux-i3c@lists.infradead.org;
	Thu, 31 Oct 2024 22:56:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE1B4240002;
	Thu, 31 Oct 2024 22:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730415354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sjSmi0ElHFgzx3wNVCFaZKYItZyn3LIG3b9ExI++Pis=;
	b=Tk/2/1vaqjjhyMDNIbCtptcgnwpMy/xytaDIYtObsBt4Hpi7y/Ab9I+FVZUPkmLTSMe6dM
	mExbuabxER+6htb5a24PLSkO6SiOriiIIbAqXFeOjyO5mPzlyeASrjl2hSVnku24GFRV6C
	C1utm1fp0DKv6cFFPoY/rjw+lHBUoumSJGV4j0Q6Q8Uu3wkTuxM6pb8rh3rpOfGjUZCnJJ
	cmOboOAD/9s1xFY1qyZtX7h7NXkiSSGK8aWbvGDBQVG8f5qzYkd25J/v5d9K//Ddz9h9Ki
	xnic5SIPohYn9ShOAre+g3XjDd/UMicne2VroREd0Rao4u6xTjN3q0m7mVwsIg==
Date: Thu, 31 Oct 2024 23:55:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	arnd@arndb.de, bbrezillon@kernel.org, boris.brezillon@collabora.com,
	conor.culhane@silvaco.com, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, miquel.raynal@bootlin.com,
	pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com,
	stable@kernel.org
Subject: Re: [PATCH v8 0/3] I3C: master: fix the address assign issue if
 assign-address is exist in dts
Message-ID: <173041531796.2391928.12741323378960591582.b4-ty@bootlin.com>
References: <20241021-i3c_dts_assign-v8-0-4098b8bde01e@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021-i3c_dts_assign-v8-0-4098b8bde01e@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_155557_740257_B9420783 
X-CRM114-Status: UNSURE (   8.73  )
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

On Mon, 21 Oct 2024 11:45:05 -0400, Frank Li wrote:
> These patches are split from
> https://lore.kernel.org/linux-i3c/ZvrAuOBLgi+HtrPD@lizhi-Precision-Tower-5810/#R
> 
> There are discussion on
> https://lore.kernel.org/linux-i3c/20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com/T/#m16fa9bb875b0ae9d37c5f6e91f90e375551c6366
> 
> Basic back ground is
> The current framework is
> 1. get free i3c dynamic address
> 2. if found dt have assign-address for such device (identify by PID),
> change to such address.
> 
> [...]

Applied, thanks!

[1/3] i3c: master: Replace hard code 2 with macro I3C_ADDR_SLOT_STATUS_BITS
      https://git.kernel.org/abelloni/c/16aed0a6520b
[2/3] i3c: master: Extend address status bit to 4 and add I3C_ADDR_SLOT_EXT_DESIRED
      https://git.kernel.org/abelloni/c/2f552fa28059
[3/3] i3c: master: Fix dynamic address leak when 'assigned-address' is present
      https://git.kernel.org/abelloni/c/851bd21cdb55

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
