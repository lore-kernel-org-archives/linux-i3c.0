Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA292D46602
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jan 2026 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wW7vE4A0f8nObHNs7LFBtoJfLjS5e6qICN8MNu8ocPA=; b=1hgz9BY7uksGkx
	ePfwvaeAKVZ83marDB3jnNEHx5DLGBbyVhnidn6zeRHYGunGKgCflvtVprM8MeavBGKM39BPLe38P
	Nwlpu+KClXqcVtOr2HvdonBtIqNhFnGF5k8vHKe2SSLVsDIsP6U/prf7fGuR1sTCNSrieRYwbwvMX
	Zn+FYt5t9j7UzVBAsecNA16H2YtW8YeKgIXRfbh5CyRGn2YNVjlfvT2wEHCbMRtJGCX3G3qWdP9tQ
	HsGvokF1s/AXHKy3kswOwcYi7RVekc5g8dnppiBHW2OTIp7jn38LynogeYOOFYqX1X+oXpagdyBvr
	KbsQVzXV/uKuTiWgINrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQte-0000000CpXW-1S2A;
	Thu, 15 Jan 2026 17:12:34 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQta-0000000CpWY-17l2
	for linux-i3c@lists.infradead.org;
	Thu, 15 Jan 2026 17:12:33 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dsV063fr2zJ46Dv;
	Fri, 16 Jan 2026 01:12:06 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A7F440539;
	Fri, 16 Jan 2026 01:12:23 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 15 Jan
 2026 17:12:22 +0000
Date: Thu, 15 Jan 2026 17:12:20 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, <andriy.shevchenko@intel.com>,
	<carlos.song@nxp.com>, <fluturel.adrian@gmail.com>,
	<linux-i3c@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH 1/1] i3c: Add stub functions when I3C support is
 disabled
Message-ID: <20260115171220.000001b7@huawei.com>
In-Reply-To: <176840281753.1259180.16475027635174872850.b4-ty@bootlin.com>
References: <20251230145718.4088694-1-Frank.Li@nxp.com>
	<176840281753.1259180.16475027635174872850.b4-ty@bootlin.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_091231_781707_78689146 
X-CRM114-Status: GOOD (  10.32  )
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

On Wed, 14 Jan 2026 16:02:06 +0100
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> On Tue, 30 Dec 2025 09:57:18 -0500, Frank Li wrote:
> > When I3C is disabled, unused functions are removed by the linker because
> > the driver relies on regmap and no I3C devices are registered, so normal
> > I3C paths are never called.
> > 
> > However, some drivers may still call low-level I3C transfer helpers.
> > Provide stub implementations to avoid adding conditional ifdefs everywhere.
> > 
> > [...]  
> 
> Applied, thanks!
> 
> [1/1] i3c: Add stub functions when I3C support is disabled
>       https://git.kernel.org/i3c/c/8564f88df202
> 
> Best regards,
> 

Hi Alexandre,

This is going to make for an 'interesting' merge window as I'm getting
build failures without that patch.  I don't suppose you'd mind
doing an immutable branch? 

If not, maybe best bet is some local ifdefs that we back out
next merge window. I don't really want to kick the driver back
a cycle just for this.

Thanks,

Jonathan



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
