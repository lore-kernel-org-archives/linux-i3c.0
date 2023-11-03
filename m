Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C1CC4167D
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Nov 2023 18:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9P/avKnjGFwg8+NNDDoTTGGGQSVmnTsqmLY0sQzwvF0=; b=G6O2zJwB3/Shzs
	i4g4nDGr38knJkAThTrtVeZXEj79xW1lyUgJnbb55jeiQLntPErqj0IFRZxCJDECH7nBUUBYgdSfn
	5qFR69wJFOQ0tT9S0AzKlqLd43MwEloGzzo90xF52xbRv11JkCnc0h+maDUZst0Q6aol8zv/Ip87L
	jSwiVCxVCKkeN+LEbs2UVFZspjv2Mf0jp1gXYRFuiDJgiedjNqfzI4EJoAGpiL13uv3AhhFLCJvr9
	3ypBETjH2xRFn4EW7EKywQ+f/3ECJFDZ7cEx4tcdhx/vHuCK7SDQwlIunr+bjMUCj8UFZj9DZhG7+
	aPm9ZRLXDF81zRx4PohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyzGP-00BzcL-0L;
	Fri, 03 Nov 2023 18:51:25 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyzGH-00Bzbe-0i
	for linux-i3c@lists.infradead.org;
	Fri, 03 Nov 2023 18:51:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20399FF806;
	Fri,  3 Nov 2023 18:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699037471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IDuaV2o26ipn18Dth3c/+CRuMDxlnBDkzFnwfW4wPK4=;
	b=AotkSUlt+cvUxCNRruWpyimBanIZ5u43UQp2V7aTrUb+lRvE7OzcN4hwD6DJlN0IpcEUxw
	lRAJcrQ3KG/Pdv8dcm8HSy86f8M738+nM+QkKxa9O764AwIVkhCsTntKlbh+956zAx7zVB
	lAYygv8WB/IeKYLmeQJ80anvxqdZatFulL7bytfQcSYN2bkvCVZMJ26M9+ClT6idI9gNxr
	B1KCHcpIC+IasoPIJOPVtR7uTcHv4XneDpT++dRKFniF0h+v8usuhVK6JS/qDBlKpxuyaS
	SC1Fh5rtgXRgZ/5xJQ0dX9qW4CFf5vCaTf/oBz9hL3rorHIgtC4xmNMR7yNn+A==
Date: Fri, 3 Nov 2023 19:51:10 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, conor.culhane@silvaco.com, imx@lists.linux.dev,
	joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] i3c: master: svc: collection of bugs fixes
Message-ID: <169903733135.383554.5820823171048383962.b4-ty@bootlin.com>
References: <20231023161658.3890811-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023161658.3890811-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_115117_427755_65DB72BA 
X-CRM114-Status: UNSURE (   8.23  )
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


On Mon, 23 Oct 2023 12:16:52 -0400, Frank Li wrote:
> Each patch is indepedents. See commit message for detail.
> 
> Change from v1 to v4.
> See each patch notes
> 
> If there are not notes between v2 to v4, that's means not change.
> 
> [...]

Applied, thanks!

[1/6] i3c: master: svc: fix race condition in ibi work thread
      commit: 6bf3fc268183816856c96b8794cd66146bc27b35
[2/6] i3c: master: svc: fix wrong data return when IBI happen during start frame
      commit: 5e5e3c92e748a6d859190e123b9193cf4911fcca
[3/6] i3c: master: svc: fix ibi may not return mandatory data byte
      commit: c85e209b799f12d18a90ae6353b997b1bb1274a5
[4/6] i3c: master: svc: fix check wrong status register in irq handler
      commit: 225d5ef048c4ed01a475c95d94833bd7dd61072d
[5/6] i3c: master: svc: fix SDA keep low when polling IBIWON timeout happen
      commit: dfd7cd6aafdb1f5ba93828e97e56b38304b23a05
[6/6] i3c: master: svc: fix random hot join failure since timeout error
      commit: 9aaeef113c55248ecf3ab941c2e4460aaa8b8b9a


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
